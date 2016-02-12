# github-extension-api

[![Join the chat at https://gitter.im/pollseed/github-extension-api](https://badges.gitter.im/pollseed/github-extension-api.svg)](https://gitter.im/pollseed/github-extension-api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

GitHub extension API.

## Route Sample

### Order by columns parameters
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

### Response Parameters

column name|detail
:--:|:--:|
id|Ignore column for AI, Return NULL
github_id|GitHub repository ID
name| Repository name
language| Programing language
stargazers_count| star count
forks_count|fork count
html_url|github repository URL
commit_created_at| repository create date
commit_updated_at|repository update date
owner_id|GitHub user ID
owner_followers|user follower count
owner_following|user following count
owner_created_at|user create date
owner_updated_at|user update date
---
### All repositories
#### Route
`GET /github`
#### Request Sample
`http://localhost:9393/github?order_by=forks_count&desc_flg=1&limit=1`
#### Response Sample
```.json
[

    {
        "id": null,
        "github_id": ​943149,
        "name": "d3",
        "language": "javascript",
        "stargazers_count": ​46308,
        "forks_count": ​12401,
        "html_url": "https://github.com/mbostock/d3",
        "commit_created_at": "2010-09-27T17:22:42.000Z",
        "commit_updated_at": "2016-02-11T03:00:20.000Z",
        "owner_id": ​230541,
        "owner_followers": ​11348,
        "owner_following": ​13,
        "owner_created_at": "2010-03-25T22:02:56.000Z",
        "owner_updated_at": "2016-02-06T04:52:06.000Z"
    }

]
```
---
### By language
#### Route
`/github/language/:language`

#### Language Parameters
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
css

#### Request Sample
`http://localhost:9393/github/language/ruby?order_by=forks_count&limit=1`
#### Response Sample
```.json
[

    {
        "id": null,
        "github_id": ​8237199,
        "name": "motion-xray",
        "language": "ruby",
        "stargazers_count": ​586,
        "forks_count": ​12,
        "html_url": "https://github.com/colinta/motion-xray",
        "commit_created_at": "2013-02-16T15:07:15.000Z",
        "commit_updated_at": "2016-01-29T21:57:34.000Z",
        "owner_id": ​27570,
        "owner_followers": ​177,
        "owner_following": ​4,
        "owner_created_at": "2008-10-04T17:51:46.000Z",
        "owner_updated_at": "2016-01-28T14:38:48.000Z"
    }

]
```
---
### GitHub id
#### Route
`/github/:id`
#### Request Sample
`http://localhost:9393/github/id/13584262`
#### Response Sample
```.json
{

    "id": null,
    "github_id": ​13584262,
    "name": "webtorrent",
    "language": "javascript",
    "stargazers_count": ​9019,
    "forks_count": ​644,
    "html_url": "https://github.com/feross/webtorrent",
    "commit_created_at": "2013-10-15T08:16:40.000Z",
    "commit_updated_at": "2016-02-11T02:26:21.000Z",
    "owner_id": ​121766,
    "owner_followers": ​3578,
    "owner_following": ​175,
    "owner_created_at": "2009-09-01T06:06:14.000Z",
    "owner_updated_at": "2016-02-07T04:04:43.000Z"

}
```
