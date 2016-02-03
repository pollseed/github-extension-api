require 'bundler/setup'
require 'json'
require 'httpclient'
require 'logger'
require '../common/constants.rb'
require '../common/models'

module FindApi
  LOG = Logger.new(STDOUT)
  CLIENT_ID = ENV['GITHUB_API_CLIENT_ID']
  CLIENT_SECRET = ENV['GITHUB_API_CLIENT_SECRET']

  ERROR_LOGGER = lambda{|info| LOG.error("#{info.status}, #{info.body}")}

  def find_github_repository_by_lang (lang,page=1,per_page=100)
    response = find_get_json (sprintf(Github::REPOSITORY_URL, lang, page, per_page, CLIENT_ID, CLIENT_SECRET))

    if HttpStatus::OK == response.status
      (JSON.parse response.body).each do |key,value|
        if Github::JSON_KEY_ITEMS == key
          value.each.with_index(1) do |json,i|

            user_info = find_get_json sprintf(Github::USER_URL, json['owner']['login'], CLIENT_ID, CLIENT_SECRET)
            if HttpStatus::OK == user_info.status
              ClawlGithubRepository.register(json, lang, (JSON.parse user_info.body), i)
            else
              ERROR_LOGGER.call user_info
            end
          end
        end
      end
    else
      ERROR_LOGGER.call response
    end
  end

  private
  def find_get_json uri
    http = HTTPClient.new
    http.get uri
  end
end

class Request
  include FindApi

  def argv_run
    argv = ARGV
    LOG.info("language: #{argv[0]}")
    LOG.info("page: #{argv[1]}")
    LOG.info("per_page: #{argv[2]}")
    run(argv[0],argv[1],argv[2])
  end

  def run(language, page, per_page)
    find_github_repository_by_lang(language,page,per_page)
  end
end

# Request.new.argv_run
