CREATE SCHEMA `big_data` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE `clawl_github_repositories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `github_id` bigint(20) NOT NULL,
  `language` varchar(48) NOT NULL,
  `stargazers_count` bigint(20) NOT NULL,
  `response` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_language` (`language`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
