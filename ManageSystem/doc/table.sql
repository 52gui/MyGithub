--用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(32) NOT NULL DEFAULT 'admin',
  `password` varchar(32) NOT NULL DEFAULT '123456',
  `login_times` int(10) NOT NULL DEFAULT '0',
  `last_login_ip` varchar(16) DEFAULT '0.0.0.0',
  `superadmin` smallint(6) NOT NULL DEFAULT '0',
  `module_right` smallint(6) NOT NULL DEFAULT '0',
  `authority` smallint(6) NOT NULL DEFAULT '0',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
insert into user (name, login_name, password, superadmin) values 
('系统管理员', 'admin', 'bloom', 1);

--系统日志表
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '1',
  `user` int(11) NOT NULL DEFAULT '0',
  `operate` smallint(6) NOT NULL DEFAULT '0',
  `description` varchar(256) NOT NULL DEFAULT '',
  `result` smallint(6) NOT NULL DEFAULT '0',
  `ip_address` char(16) NOT NULL DEFAULT '',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `user` (`user`),
  KEY `operate` (`operate`),
  KEY `result` (`result`),
  CONSTRAINT `log_ibfk_3` FOREIGN KEY (`result`) REFERENCES `ct_log_result` (`id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`type`) REFERENCES `ct_log_type` (`id`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`operate`) REFERENCES `ct_log_operate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--会员表
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `weixin_id` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `sn` smallint(6) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify _time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--试卷表
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `describe` varchar(512) DEFAULT NULL,
  `is_score` smallint(6) NOT NULL DEFAULT '0',
  `sn` smallint(6) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify _time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--问题表
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `order` smallint(6) DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '1',
  `up_limit` smallint(6) NOT NULL DEFAULT '1',
  `low_limit` smallint(6) NOT NULL DEFAULT '1',
  `is_must` smallint(6) NOT NULL DEFAULT '1',
  `sn` smallint(6) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify _time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `paper_id` (`paper_id`),
  CONSTRAINT `paper_id` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--选项表
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1',
  `content` varchar(128) DEFAULT NULL,
  `order` smallint(6) DEFAULT '0',
  `index` smallint(6) NOT NULL DEFAULT '1',
  `sn` smallint(6) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify _time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--会员回答表
DROP TABLE IF EXISTS `member_answer`;
CREATE TABLE `member_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1',
  `answer_select` smallint(6) DEFAULT NULL,
  `answer_text` varchar(512) DEFAULT NULL,
  `sn` smallint(6) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify _time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;