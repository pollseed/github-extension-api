require 'bundler/setup'
require './request.rb'

req = Request.new
req.argv_run
#for num in 1..2 do
#  req.run(java num 100)
#end


