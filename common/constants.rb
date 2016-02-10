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

module TechnologyType
  PROGRAMING = 0
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

module JsonApi
  MAX_LIMIT = 50
  UPDATED_AT = 'updated_at'
  DESC = 'DESC'
  
  module Flg
    ON = "1"
    OFF = "0"
  end
  
  module OrderByColumn
    GITHUB_ID = "github_id"
    STARGAZERS_COUNT = "stargazers_count"
    FORKS_COUNT = "forks_count"
    COMMIT_CREATED_AT = "commit_created_at"
    COMMIT_UPDATED_AT = "commit_updated_at"
    OWNER_ID ="owner_id"
    OWNER_FOLLOWERS = "owner_followers"
    OWNER_FOLLOWING = "owner_following"
    OWNER_CREATED_AT = "owner_created_at"
    OWNER_UPDATED_AT = "owner_updated_at"
  end
end
