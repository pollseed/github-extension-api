-- data for analyze
SELECT
    id,
    github_id,
    stargazers_count,
    forks_count,
    ROUND((UNIX_TIMESTAMP(commit_updated_at) - UNIX_TIMESTAMP(commit_created_at)) / 86400) AS commit_days,
    owner_id,
    owner_followers,
    owner_following,
    organization_flg,
    ROUND((UNIX_TIMESTAMP(owner_updated_at) - UNIX_TIMESTAMP(owner_created_at)) / 86400) AS owner_days,
    CASE language
        WHEN 'c++' THEN 0
        WHEN 'python' THEN 1
        WHEN 'bash' THEN 2
        WHEN 'objective-c' THEN 3
        WHEN 'java' THEN 4
        WHEN 'scala' THEN 5
        WHEN 'php' THEN 6
        WHEN 'lisp' THEN 7
        WHEN 'go' THEN 8
        WHEN 'ruby' THEN 9
        WHEN 'c' THEN 10
        WHEN 'perl' THEN 11
        WHEN 'javascript' THEN 12
        WHEN 'swift' THEN 13
        WHEN 'c#' THEN 14
        WHEN 'ecma script' THEN 15
        WHEN 'groovy' THEN 16
        WHEN 'lua' THEN 17
        WHEN 'haskell' THEN 18
        WHEN 'visual basic' THEN 19
        WHEN 'assembly' THEN 20
        else 9999
    END AS language
FROM
    clawl_github_repositories
ORDER BY language ASC , stargazers_count DESC
LIMIT 30000;

SELECT
    owner_id,
    forks_count,
    ROUND((UNIX_TIMESTAMP(owner_updated_at) - UNIX_TIMESTAMP(owner_created_at)) / 86400) AS owner_days,
    ROUND((UNIX_TIMESTAMP(commit_updated_at) - UNIX_TIMESTAMP(commit_created_at)) / 86400) AS commit_days,
    CASE language
        WHEN 'c++' THEN 0
        WHEN 'python' THEN 1
        WHEN 'bash' THEN 2
        WHEN 'objective-c' THEN 3
        WHEN 'java' THEN 4
        WHEN 'scala' THEN 5
        WHEN 'php' THEN 6
        WHEN 'lisp' THEN 7
        WHEN 'go' THEN 8
        WHEN 'ruby' THEN 9
        WHEN 'c' THEN 10
        WHEN 'perl' THEN 11
        WHEN 'javascript' THEN 12
        WHEN 'swift' THEN 13
        WHEN 'c#' THEN 14
        WHEN 'ecma script' THEN 15
        WHEN 'groovy' THEN 16
        WHEN 'lua' THEN 17
        WHEN 'haskell' THEN 18
        WHEN 'visual basic' THEN 19
        WHEN 'assembly' THEN 20
        ELSE 9999
    END AS language,
    stargazers_count,
    github_id
FROM
    clawl_github_repositories
WHERE
    stargazers_count > 1000
        AND owner_id IN ((SELECT
            owner_id
        FROM
            (SELECT
                owner_id, COUNT(github_id) a
            FROM
                big_data.clawl_github_repositories
            GROUP BY owner_id
            HAVING a > 2) b))
ORDER BY stargazers_count DESC
LIMIT 7000;

-- data for stargazers_count's count
SELECT
    language, COUNT(stargazers_count) c
FROM
    clawl_github_repositories
GROUP BY language
ORDER BY c DESC;
