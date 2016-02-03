module Languages
  JAVA = "java".freeze
  RUBY = "ruby".freeze
  JAVASCRIPT = "javascript".freeze
  PHP = "php".freeze
  PYTHON = "python".freeze
  PERL = "perl".freeze
  C = "c".freeze
  C_SHARP = "c#".freeze
  C_PLUS2 = "c++".freeze
  OBJECTIVE_C = "objective-c".freeze
  SWIFT = "swift".freeze
  GO = "go".freeze
  BASH = "bash".freeze
  SCALA = "scala".freeze
  LISP = "lisp".freeze
end

module HttpStatus
  OK = 200.freeze
end

module Github
  REPOSITORY_URL = "https://api.github.com/search/repositories?q=language:%s&sort=stars&order=desc&page=%s&per_page=%s&client_id=%s&client_secret=%s".freeze
  USER_URL = "https://api.github.com/users/%s?client_id=%s&client_secret=%s".freeze
  JSON_KEY_ITEMS = "items"
end
