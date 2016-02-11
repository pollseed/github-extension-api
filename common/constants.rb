# frozen_string_literal: true
module TechnologyType
  PROGRAMING = 0
end

module HttpStatus
  OK = 200
  NOT_FOUND = 404
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

  LANGUAGE = %w(
    java
    ruby
    javascript
    php
    python
    perl
    c
    c#
    c++
    objective-c
    swift
    go
    bash
    scala
    lisp
    ecma script
    groovy
    lua
    haskell
    visual basic
    assembly
  )

  FLG = %w(1 0)

  ORDER_BY_COLUMN = %w(
      github_id
      stargazers_count
      forks_count
      commit_created_at
      commit_updated_at
      owner_id
      owner_followers
      owner_following
      owner_created_at
      owner_updated_at
  )
end
