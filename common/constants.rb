# frozen_string_literal: true
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
  ECMA_SCRIPT = "ecma script"
  GROOVY = "groovy"
  LUA = "lua"
  HASKELL = "haskell"
  VISUAL_BASIC = "visual basic"
  ASSEMBLY = "assembly"
end

module HttpStatus
  OK = 200
end

module Github
  REPOSITORY_URL = "https://api.github.com/search/repositories?q=language:%s&sort=stars&order=desc&page=%s&per_page=%s&client_id=%s&client_secret=%s"
  USER_URL = "https://api.github.com/users/%s?client_id=%s&client_secret=%s"
  JSON_KEY_ITEMS = "items"
  OWNER_TYPE_ORG = "Organization"
end
