require 'sinatra/json'
require 'sinatra/base'

require_relative './models/init'

class Server < Sinatra::Base
  get '/' do
    data = '{status: 200}'
    json data
  end

  get '/github' do
    json ClawlGithubRepository.find_limit(
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/language/:language' do
    json ClawlGithubRepository.find_by_language_limit(
      params['language'],
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/id/:id' do
    json ClawlGithubRepository.find_by(id: params['id'])
  end
end
