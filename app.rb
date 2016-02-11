require 'sinatra/json'
require 'sinatra/base'

require_relative './models/init'

class Server < Sinatra::Base
  get '/' do
    json res(HttpStatus::OK)
  end

  get '/github' do
    return json res(HttpStatus::NOT_FOUND) unless validation?(params)
    json ClawlGithubRepository.find_limit(
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/language/:language' do
    return json res(HttpStatus::NOT_FOUND) unless validation?(params)
    json ClawlGithubRepository.find_by_language_limit(
      params['language'],
      params['organization_flg'],
      params['order_by'],
      params['desc_flg'],
      params['limit']
    )
  end

  get '/github/id/:id' do
    return json res(HttpStatus::NOT_FOUND) unless validation?(params)
    json ClawlGithubRepository.select_column.find_by(github_id: params['id'])
  end

  private
  def validation? params
    unless params['language'].nil?
      return false unless JsonApi::LANGUAGE.include?(params['language'])
    end
    unless params['organization_flg'].nil?
      return false unless JsonApi::FLG.include?(params['organization_flg'])
    end
    unless params['order_by'].nil?
      return false unless JsonApi::ORDER_BY_COLUMN.include?(params['order_by'])
    end
    unless params['desc_flg'].nil?
      return false unless JsonApi::FLG.include?(params['desc_flg'])
    end
    unless params['limit'].nil?
      return false unless (Integer(params['limit']) rescue false)
    end
    unless params['id'].nil?
      return false unless (Integer(params['id']) rescue false)
    end
    true
  end

  def res code
    "{status: #{code}}"
  end
end
