require 'sinatra/json'
require 'sinatra/base'

require_relative './models/init'

class Server < Sinatra::Base
  get '/' do
    data = '{status: 200}'
    json data
  end

  get '/github' do
    return json '{status: 404}' unless validation?(params)
    json ClawlGithubRepository.find_limit(
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/language/:language' do
    return json '{status: 404}' unless validation?(params)
    json ClawlGithubRepository.find_by_language_limit(
      params['language'],
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/id/:id' do
    return json '{status: 404}' unless validation?(params)
    json ClawlGithubRepository.select_column.find_by(github_id: params['id'])
  end

  private
  def validation? params
    unless params['language'].nil?
      return false unless Languages.const_defined?(params['language'])
    end
    unless params['organization_flg'].nil?
      return false unless JsonApi::Flg.const_defined?(params['organization_flg'])
    end
    unless params['order_by'].nil?
      return false unless JsonApi::OrderByColumn.const_defined?(params['order_by'])
    end
    unless params['desc_flg'].nil?
      return false unless JsonApi::Flg.const_defined?(params['desc_flg'])
    end
    unless params['limit'].nil?
      return false unless params['limit'].instance_of?(Fixnum)
    end
    unless params['id'].nil?
      return false unless params['id'].instance_of?(Integer)
    end
  end
end
