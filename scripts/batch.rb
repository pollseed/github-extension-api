require 'bundler/setup'
require_relative './request'

class Batch
  LOG = Logger.new($stdout)

  REQUEST_RUN = ->(lang,req){ (1..10).each{|n| req.run(lang,n,100)} }
  def run
    req = Request.new
    JsonApi::LANGUAGE.each{|lang|
      LOG.info("request language #{lang}")
      REQUEST_RUN.call(lang,req)
    }
  end
end

Batch.new.run
