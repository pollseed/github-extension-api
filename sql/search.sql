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
    END AS language
FROM
    clawl_github_repositories
ORDER BY language ASC , stargazers_count DESC
LIMIT 15000;

-- data for stargazers_count's count
SELECT
    language, COUNT(stargazers_count) c
FROM
    clawl_github_repositories
GROUP BY language
ORDER BY c DESC;
