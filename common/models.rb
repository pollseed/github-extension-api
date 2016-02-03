require 'active_record'
require 'yaml'
require 'logger'

ActiveRecord::Base.configurations = YAML.load_file('../config/database.yml')
ActiveRecord::Base.establish_connection(:development)

class ClawlGithubRepository < ActiveRecord::Base
  LOG = Logger.new(STDOUT)

  def self.register(json, lang, user_json, i)
    ct = ClawlGithubRepository.where(github_id: json['id'], language: lang).take
    if ct.nil?
      create(json, lang, user_json, i)
    else
      update(ct, json, lang, user_json, i)
    end
  end

  private
  def self.create(json, lang, user_json, i)
    ClawlGithubRepository.create(
      github_id: json['id'],
      language: lang,
      stargazers_count: json['stargazers_count'],
      forks_count: json['forks_count'],
      commit_created_at: json['created_at'],
      commit_updated_at: json['updated_at'],
      owner_id: user_json['id'],
      owner_followers: user_json['followers'],
      owner_following: user_json['following'],
      owner_type: Github::OWNER_TYPE_ORG == user_json['type'],
      owner_created_at: user_json['created_at'],
      owner_updated_at: user_json['updated_at'],
      response: json)
    LOG.info("No.#{i} insert github_id=#{json['id']}, lang=#{lang}")
  end

  def self.update(ct, json, lang, user_json, i)
    ct.stargazers_count = json['stargazers_count']
    ct.forks_count = json['forks_count']
    ct.commit_updated_at = json['updated_at']
    ct.owner_followers = user_json['followers']
    ct.owner_following = user_json['following']
    ct.owner_type = Github::OWNER_TYPE_ORG == user_json['type']
    ct.owner_updated_at = user_json['updated_at']
    ct.response = json
    ct.save
    LOG.info("No.#{i} update github_id=#{json['id']}, lang=#{lang}")
  end
end
