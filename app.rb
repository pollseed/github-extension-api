require 'sinatra/base'

require_relative 'models/init'

class Server < Sinatra::Base
  get '/' do
      html:index
  end
end
