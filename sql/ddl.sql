CREATE SCHEMA `big_data` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE `clawl_github_repositories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `github_id` bigint(20) NOT NULL,
  `language` varchar(48) NOT NULL,
  `stargazers_count` bigint(20) NOT NULL DEFAULT '0',
  `forks_count` bigint(20) NOT NULL DEFAULT '0',
  `commit_created_at` datetime NOT NULL,
  `commit_updated_at` datetime NOT NULL,
  `owner_id` bigint(20) NOT NULL DEFAULT '0',
  `owner_followers` bigint(20) NOT NULL DEFAULT '0',
  `owner_following` bigint(20) NOT NULL DEFAULT '0',
  `organization_flg` tinyint(3) NOT NULL DEFAULT '0',
  `owner_created_at` datetime NOT NULL,
  `owner_updated_at` datetime NOT NULL,
  `response` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_language` (`language`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
