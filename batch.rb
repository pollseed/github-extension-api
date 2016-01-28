require 'bundler/setup'
require './request.rb'

module Languages
  JAVA = "java"
  RUBY = "ruby"
  JAVASCRIPT = "javascript"
  PHP = "php"
  PYTHON = "python"
  PERL = "perl"
  C = "c"
  C_SHARP = "c#"
  C_PLUS2 = "c++"
  OBJECTIVE_C = "objective-c"
  SWIFT = "swift"
  GO = "go"
  BASH = "bash"
  SCALA = "scala"
  LISP = "lisp"
end

class Batch
  def run
    req = Request.new
    Languages.constants.each{|c|
      lang = Languages.const_get(c)
      range = 1..10
      range.each{|n|
        req.run(lang,n,100)
      }
    }
  end
end

Batch.new.run
