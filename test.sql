CREATE SCHEMA `new_schema` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `clawl_github_repositories` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `github_id` bigint(20) NOT NULL,
    `language` varchar(48) NOT NULL,
    `response` text NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
