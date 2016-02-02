require 'bundler/setup'
require './request.rb'

class Batch
  def run
    req = Request.new
    Languages.constants.each{|c|
      LOG.info("request language #{c}")
      lang = Languages.const_get c
      range = 1..10
      range.each{|n|
        req.run(lang,n,100)
      }
    }
  end
end

Batch.new.run
