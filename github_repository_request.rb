require 'json'
require 'httpclient'

module FindApi
  def find_github_repository_by_lang lang
    response = find_get_json "https://api.github.com/search/repositories?q=language:#{lang}&sort=stars&order=desc"

    if 200 == response.status
      json_arr = JSON.parse response.body
      json_arr.each do |key,value|
        if 'items' == key
          value.each do |json|
            #p "url: #{json['clone_url']}, score: #{json['score']}, stargazers_count: #{json['stargazers_count']}, forks_count: #{json['forks_count']}, created_at: #{json['created_at']}, updated_at: #{json['updated_at']}"
            p "#{json['clone_url']},#{json['score']},#{json['stargazers_count']},#{json['forks_count']},#{json['created_at']},#{json['updated_at']}"
          end
        end
      end
    else
      p "error: #{response.status}, #{response.body}"
    end
  end

  def find_stackoverflow_questions_by_tag tag
    response = find_get_json "https://api.stackexchange.com/2.2/questions?page=1&pagesize=100&order=desc&sort=votes&tagged=#{tag}&site=ja.stackoverflow&filter=withbody"

    if 200 == response.status
      json_arr = JSON.parse(response.body, quirks_mode: true)
      p json_arr
    else
      p "error: #{response.status}, #{response.body}"
    end
  end

  def find_get_json uri
    http = HTTPClient.new
    http.get uri
  end
end

class Request
  include FindApi

  def main
    argv = ARGV
    find_github_repository_by_lang argv[0]
    #find_stackoverflow_questions_by_tag argv[0]
  end
end

Request.new.main
