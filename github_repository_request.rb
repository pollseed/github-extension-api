require 'uri'
require 'net/http'
require 'json'

def find_github_repository_by_lang(lang)
  response = find_get_json("https://api.github.com/search/repositories?q=language:#{lang}&sort=stars&order=desc")

  if '200' == response.code
    json_arr = JSON.parse(response.body)
    json_arr.each do |key,value|
      if 'items' == key
        value.each do |json|
          #p "url: #{json['clone_url']}, score: #{json['score']}, stargazers_count: #{json['stargazers_count']}, forks_count: #{json['forks_count']}, created_at: #{json['created_at']}, updated_at: #{json['updated_at']}"
          p "#{json['clone_url']},#{json['score']},#{json['stargazers_count']},#{json['forks_count']},#{json['created_at']},#{json['updated_at']}"
        end
      end
    end
  else
    p "error: #{response.code}, #{response.message}"
  end
end

def find_stackoverflow_questions_by_tag(tag)
  response = find_get_json("https://api.stackexchange.com/2.2/questions?page=1&pagesize=100&order=desc&sort=votes&tagged=#{tag}&site=ja.stackoverflow&filter=withbody")

  if '200' == response.code
    json_arr = JSON.parse(response.body)
    p json_arr
  else
    p "error: #{response.code}, #{response.message}"
  end
end

def find_get_json(uri_format)
  uri = URI.parse(uri_format)
  Net::HTTP.get_response(uri)
end

def main
  argv = ARGV
  find_github_repository_by_lang(argv[0])
  find_stackoverflow_questions_by_tag(argv[0])
end

main
