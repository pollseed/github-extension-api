require 'sinatra/json'
require 'sinatra/base'

require_relative './models/init'

class Server < Sinatra::Base
  LOG = Logger.new($stdout)

  get '/' do
    json res(HttpStatus::OK,"API is available.")
  end

  get '/v1' do
    json res(HttpStatus::OK,"version 1.0 API is available.")
  end

  get '/v1/github' do
    return json validation_error unless validation?(params)
    begin
      json ClawlGithubRepository.find_limit(
        params['organization_flg'],
        params['order_by'],
        params['desc_flg'],
        params['limit']
      )
    rescue => exc
      LOG.error(exc)
      internal_server_error
    end
  end

  get '/v1/github/languages/:language' do
    return json validation_error unless validation?(params)
    begin
      json ClawlGithubRepository.find_by_language_limit(
        params['language'],
        params['organization_flg'],
        params['order_by'],
        params['desc_flg'],
        params['limit']
      )
    rescue => exc
      LOG.error(exc)
      internal_server_error
    end
  end

  get '/v1/github/ids/:id' do
    return json validation_error unless validation?(params)
    begin
      json ClawlGithubRepository.select_column.find_by(github_id: params['id'])
    rescue => exc
      LOG.error(exc)
      internal_server_error
    end
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

  def validation_error
    res(HttpStatus::NOT_FOUND,"validation error")
  end

  def internal_server_error
    res(HttpStatus::INTERNAL_SERVER_ERROR,"internal server error")
  end

  def res(code,message)
    "{status: #{code}, message: #{message}"
  end
end
