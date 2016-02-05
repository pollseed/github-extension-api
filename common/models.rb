require 'active_record'
require 'yaml'
require 'logger'

ActiveRecord::Base.configurations = YAML.load_file('../config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class ClawlGithubRepository < ActiveRecord::Base
  LOG = Logger.new(STDOUT)

  INFO_LOGGER = lambda{|type| LOG.info("No.#{@i} #{type} github_id=#{@json['id']}, lang=#{@lang}")}

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
