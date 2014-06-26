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
  `visible` smallint(6) NOT NULL DEFAULT '0',
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
  `id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1',
  `user` int(11) NOT NULL DEFAULT '0',
  `operate` smallint(6) NOT NULL DEFAULT '0',
  `description` varchar(256) NOT NULL DEFAULT '',
  `result` smallint(6) NOT NULL DEFAULT '0',
  `ip_address` char(16) NOT NULL DEFAULT '',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '0',
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
  CONSTRAINT `log_ibfk_4` FOREIGN KEY (`result`) REFERENCES `ct_log_result` (`id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`type`) REFERENCES `ct_log_type` (`id`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `log_ibfk_3` FOREIGN KEY (`operate`) REFERENCES `ct_log_operate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;