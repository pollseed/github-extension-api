require 'bundler/setup'
require './request.rb'

class Batch
  LOG = Logger.new(STDOUT)

  REQUEST_RUN = lambda{|lang,req|(1..10).each{|n| req.run(lang,n,100)}}
  def run
    req = Request.new
    Languages.constants.each{|c|
      LOG.info("request language #{c}")
      REQUEST_RUN.call(Languages.const_get(c),req)
    }
  end
end

Batch.new.run
