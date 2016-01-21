require 'uri'
require 'net/http'
require 'json'

def request(lang)
  uri = URI.parse("https://api.github.com/search/repositories?q=language:#{lang}&sort=stars&order=desc")
  response = Net::HTTP.get_response(uri)

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

argv = ARGV
request(argv[0])
