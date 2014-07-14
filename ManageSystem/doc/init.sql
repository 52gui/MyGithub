--日志类型代码表
DROP TABLE IF EXISTS `ct_log_type`;
CREATE TABLE `ct_log_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `ct_log_type` VALUES ('1', '全部', '0', '0', '1', '0', '2014-06-24 23:00:27', '0000-00-00 00:00:00');
INSERT INTO `ct_log_type` VALUES ('2', '系统', '0', '0', '1', '0', '2014-06-24 23:00:27', '0000-00-00 00:00:00');
INSERT INTO `ct_log_type` VALUES ('3', '登录', '0', '0', '1', '0', '2014-06-24 23:00:27', '0000-00-00 00:00:00');
INSERT INTO `ct_log_type` VALUES ('4', '数据', '0', '0', '1', '0', '2014-06-24 23:02:34', '0000-00-00 00:00:00');

--日志操作类型表
DROP TABLE IF EXISTS `ct_log_operate`;
CREATE TABLE `ct_log_operate` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `ct_log_operate` VALUES ('1', '全部', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('2', '其他', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('3', '新增', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('4', '删除', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('5', '修改', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('6', '登录', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('7', '注销', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('8', '导出', '0', '0', '1', '0', '2014-06-24 23:09:56', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('9', '关注', '0', '0', '1', '0', '2014-06-24 23:09:56', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('10', '取消关注', '0', '0', '1', '0', '2014-06-24 23:09:56', '0000-00-00 00:00:00');
INSERT INTO `ct_log_operate` VALUES ('11', '菜单', '0', '0', '1', '0', '2014-06-24 23:09:56', '0000-00-00 00:00:00');

--操作结果
DROP TABLE IF EXISTS `ct_log_result`;
CREATE TABLE `ct_log_result` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `sn` int(10) NOT NULL DEFAULT '0',
  `visible` smallint(6) NOT NULL DEFAULT '1',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `ct_log_result` VALUES ('1', '全部', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_result` VALUES ('2', '其他', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_result` VALUES ('3', '新增', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
INSERT INTO `ct_log_result` VALUES ('4', '删除', '0', '0', '1', '0', '2014-06-24 23:09:55', '0000-00-00 00:00:00');
