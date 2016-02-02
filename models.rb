require 'active_record'
require 'yaml'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class ClawlGithubRepository < ActiveRecord::Base
  def register(json, lang, user_json, i)
    ct = ClawlGithubRepository.where(github_id: json['id'], language: lang).take,
    if ct.nil?
        create(json, lang, user_json, i)
    else
      update(ct, json, lang, user_json, i)
    end
  end

  def create(json, lang, user_json, i)
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
      owner_created_at: user_json['created_at'],
      owner_updated_at: user_json['updated_at'],
      response: json)
    p "success: No.#{i} insert github_id=#{json['id']}, lang=#{lang}"
  end

  def update(ct, json, lang, user_json, i)
    ct.stargazers_count = json['stargazers_count']
    ct.forks_count = json['forks_count']
    ct.commit_updated_at = json['updated_at']
    ct.owner_followers = user_json['followers']
    ct.owner_following = user_json['following']
    ct.owner_updated_at = user_json['updated_at']
    ct.response = json
    ct.save
    p "success: No.#{i} update github_id=#{json['id']}, lang=#{lang}"
  end
end
