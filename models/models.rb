require 'active_record'
require 'yaml'
require 'logger'
require_relative '../common/constants'

ActiveRecord::Base.configurations = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class ClawlGithubRepository < ActiveRecord::Base
  LOG = Logger.new(STDOUT)

  INFO_LOGGER = lambda{|type| LOG.info("No.#{@i} #{type} github_id=#{@json['id']}, lang=#{@lang}")}

  def self.find_limit(organization_flg, order_by, sort, limit)
    order_by_value(select_column.where(organization_flg: get_organization_flg(organization_flg)),order_by, sort, limit)
  end

  def self.find_by_language_limit(language, organization_flg, order_by, sort, limit)
    order_by_value(select_column.where(language: language, organization_flg: get_organization_flg(organization_flg)),
      order_by, sort, limit)
  end

  def self.register(json, lang, user_json, i)
    @json = json
    @lang = lang
    @user_json = user_json
    @i = i
    @ct = ClawlGithubRepository.where(github_id: @json['id'], language: @lang).take
    if @ct.nil?
      save
    else
      update
    end
  end

  private
  def self.select_column
    ClawlGithubRepository.select( :github_id,
                                  :name,
                                  :language,
                                  :stargazers_count,
                                  :forks_count,
                                  :commit_created_at,
                                  :commit_updated_at,
                                  :owner_id,
                                  :owner_followers,
                                  :owner_following,
                                  :owner_created_at,
                                  :owner_updated_at
                                )
  end

  def self.order_by_value(where, order_by, sort, limit)
    where.order("#{get_order_by order_by} #{get_sort sort}").limit(min_limit limit)
  end

  def self.get_order_by val
    val.nil? ? JsonApi::UPDATED_AT : val
  end

  def self.get_sort val
    val == '1' ? JsonApi::DESC : ''
  end

  def self.get_organization_flg flg
    flg.nil? ? 0 : flg
  end

  def self.min_limit num
    count = num.nil? ? 0 : num.to_i
    [ JsonApi::MAX_LIMIT, count ].min
  end

  def self.save
    ClawlGithubRepository.create(
    github_id: @json['id'],
    name: @json['name'],
    language: @lang,
    stargazers_count: @json['stargazers_count'],
    forks_count: @json['forks_count'],
    commit_created_at: @json['created_at'],
    commit_updated_at: @json['updated_at'],
    owner_id: @user_json['id'],
    owner_followers: @user_json['followers'],
    owner_following: @user_json['following'],
    organization_flg: Github::OWNER_TYPE_ORG == @user_json['type'],
    owner_created_at: @user_json['created_at'],
    owner_updated_at: @user_json['updated_at'],
    response: @json)
    INFO_LOGGER.call "insert"
  end

  def self.update
    @ct.name = @json['name']
    @ct.stargazers_count = @json['stargazers_count']
    @ct.forks_count = @json['forks_count']
    @ct.commit_updated_at = @json['updated_at']
    @ct.owner_followers = @user_json['followers']
    @ct.owner_following = @user_json['following']
    @ct.organization_flg = Github::OWNER_TYPE_ORG == @user_json['type']
    @ct.owner_updated_at = @user_json['updated_at']
    @ct.response = @json
    @ct.save
    INFO_LOGGER.call "update"
  end
end
