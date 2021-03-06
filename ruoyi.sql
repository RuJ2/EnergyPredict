/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2021-08-31 15:18:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0 0 2 * * ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000C3020302032202A202A203F2074000CE8AEBEE5A487E8BF87E69C9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000374000965717569705461736B74000A72794E6F506172616D7374000074000133740001317800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'MS-CGQMPIYDKKIR1630394031686', '1630394084250', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1630394040000', '-1', '5', 'PAUSED', 'CRON', '1630394032000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1630394040000', '-1', '5', 'PAUSED', 'CRON', '1630394033000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1630432800000', '-1', '5', 'PAUSED', 'CRON', '1630394033000', '0', null, '2', '');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `config_name` varchar(100) DEFAULT '' COMMENT '????????????',
  `config_key` varchar(100) DEFAULT '' COMMENT '????????????',
  `config_value` varchar(100) DEFAULT '' COMMENT '????????????',
  `config_type` char(1) DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '????????????-????????????????????????', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2021-08-31 15:06:09', '?????? skin-blue????????? skin-green????????? skin-purple????????? skin-red????????? skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '????????????-??????????????????', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '??????????????? 123456');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '?????????id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(30) DEFAULT '' COMMENT '????????????',
  `order_num` int(4) DEFAULT '0' COMMENT '????????????',
  `leader` varchar(20) DEFAULT NULL COMMENT '?????????',
  `phone` varchar(11) DEFAULT NULL COMMENT '????????????',
  `email` varchar(50) DEFAULT NULL COMMENT '??????',
  `status` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='?????????';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '???????????????', '0', '??????', '15888888888', 'gongjian@lims.com', '0', '0', 'sys', '2019-08-01 18:00:00', 'sys', '2019-08-01 18:00:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '?????????', '1', null, null, null, '0', '0', 'admin', '2020-05-29 13:40:40', '', null);
INSERT INTO `sys_dept` VALUES ('102', '101', '0,100,101', '?????????1', '1', null, null, null, '0', '0', 'admin', '2020-05-29 13:40:52', '', null);

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_sort` int(4) DEFAULT '0' COMMENT '????????????',
  `dict_label` varchar(100) DEFAULT '' COMMENT '????????????',
  `dict_value` varchar(100) DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) DEFAULT '' COMMENT '????????????',
  `css_class` varchar(100) DEFAULT NULL COMMENT '????????????????????????????????????',
  `list_class` varchar(100) DEFAULT NULL COMMENT '??????????????????',
  `is_default` char(1) DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `status` char(1) DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '???', '0', 'sys_user_sex', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '?????????');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '???', '1', 'sys_user_sex', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '?????????');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '??????', '2', 'sys_user_sex', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '??????', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '??????', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '??????', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '??????', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '??????', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '??????', '1', 'sys_job_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '???', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '???????????????');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '???', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '???????????????');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '??????', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '??????');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '??????', '2', 'sys_notice_type', '', 'success', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '??????');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '??????', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '??????', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '??????', '1', 'sys_oper_type', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '??????', '2', 'sys_oper_type', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '??????', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '??????', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '??????', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '??????', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '??????', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '????????????', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('24', '9', '????????????', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '??????', '0', 'sys_common_status', '', 'primary', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '??????', '1', 'sys_common_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '????????????');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '????????????', '1', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '????????????', '2', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('29', '10', '??????', '10', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('30', '1', '???????????????', '1', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('31', '2', '???????????????', '2', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('32', '3', '???????????????', '3', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('33', '1', '??????', '1', 'lims_equip_state', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('34', '2', '??????', '2', 'lims_equip_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('35', '3', '??????', '3', 'lims_equip_state', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('36', '5', '??????', '5', 'lims_equip_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('37', '4', '??????', '4', 'lims_equip_state', '', 'success', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('38', '1', '??????', '1', 'lims_equip_tech_state', '', 'default', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('39', '2', '??????', '2', 'lims_equip_tech_state', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('40', '3', '??????', '3', 'lims_equip_tech_state', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('41', '4', '??????', '4', 'lims_equip_tech_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('42', '1', '???', '1', 'lims_consum_unit', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('43', '2', '???', '2', 'lims_consum_unit', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('44', '1', '??????', '1', 'lims_sample_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('45', '2', '??????', '2', 'lims_sample_status', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('46', '3', '??????', '3', 'lims_sample_status', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('48', '1', '????????????', '1', 'lims_equip_source', '', 'default', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('49', '2', '????????????', '2', 'lims_equip_source', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('50', '1', '???', '1', 'lims_asset_judge', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('51', '2', '???', '0', 'lims_asset_judge', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('52', '1', '????????????1', '1', 'lims_content_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('53', '2', '????????????2', '2', 'lims_content_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('54', '1', '??????', '0', 'lims_template_status', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('55', '2', '??????', '1', 'lims_template_status', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('57', '1', '????????????', '1', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('58', '2', '????????????', '2', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('59', '3', '????????????', '3', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('60', '4', '????????????', '4', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('61', '5', '????????????', '5', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('62', '1', '?????????', '1', 'lims_msg_frequence', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('63', '2', '??????', '2', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('64', '3', '??????', '3', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('65', '4', '??????', '4', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES ('66', '1', '??????', '1', 'lims_report_kind', null, null, 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('67', '2', '??????', '2', 'lims_report_kind', null, null, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('68', '1', '????????????1', '1', 'lims_report_verdict', null, null, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);
INSERT INTO `sys_dict_data` VALUES ('69', '2', '????????????2', '2', 'lims_report_verdict', null, null, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', null);

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_name` varchar(100) DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) DEFAULT '' COMMENT '????????????',
  `status` char(1) DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '????????????', 'sys_user_sex', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('2', '????????????', 'sys_show_hide', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('3', '????????????', 'sys_normal_disable', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('4', '????????????', 'sys_job_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('5', '????????????', 'sys_yes_no', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('6', '????????????', 'sys_notice_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('7', '????????????', 'sys_notice_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('8', '????????????', 'sys_oper_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('9', '????????????', 'sys_common_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('10', '????????????', 'lims_equipBook_category', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????????????????');
INSERT INTO `sys_dict_type` VALUES ('11', '????????????', 'lims_consum_specification', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '????????????');
INSERT INTO `sys_dict_type` VALUES ('12', '????????????', 'lims_equip_state', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '?????????????????????????????????');
INSERT INTO `sys_dict_type` VALUES ('13', '??????????????????', 'lims_equip_tech_state', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '?????????????????????????????????');
INSERT INTO `sys_dict_type` VALUES ('14', '????????????', 'lims_equip_source', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '???????????????????????????');
INSERT INTO `sys_dict_type` VALUES ('15', '??????????????????', 'lims_consum_unit', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '?????????');
INSERT INTO `sys_dict_type` VALUES ('16', '????????????', 'lims_sample_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '???????????????');
INSERT INTO `sys_dict_type` VALUES ('17', '??????????????????', 'lims_asset_judge', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '?????????????????????');
INSERT INTO `sys_dict_type` VALUES ('18', '????????????', 'lims_content_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '????????????');
INSERT INTO `sys_dict_type` VALUES ('19', '????????????', 'lims_template_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '????????????');
INSERT INTO `sys_dict_type` VALUES ('20', '????????????', 'lims_template_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '????????????');
INSERT INTO `sys_dict_type` VALUES ('21', '????????????', 'lims_msg_frequence', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '????????????');
INSERT INTO `sys_dict_type` VALUES ('22', '??????-??????/??????', 'lims_report_kind', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '??????-??????/??????');
INSERT INTO `sys_dict_type` VALUES ('23', '??????????????????', 'lims_report_verdict', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', null);

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '????????????',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '????????????',
  `method_name` varchar(500) DEFAULT '' COMMENT '????????????',
  `method_params` varchar(50) DEFAULT NULL COMMENT '????????????',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron???????????????',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '???????????????????????????1???????????? 2???????????? 3???????????????',
  `concurrent` char(1) DEFAULT '1' COMMENT '?????????????????????0?????? 1?????????',
  `status` char(1) DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT '' COMMENT '????????????',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='?????????????????????';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '????????????????????????', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '????????????????????????', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');
INSERT INTO `sys_job` VALUES ('3', 'equipTask', '????????????', 'ryNoParams', '', '0 0 2 * * ? ', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????ID',
  `job_name` varchar(64) NOT NULL COMMENT '????????????',
  `job_group` varchar(64) NOT NULL COMMENT '????????????',
  `method_name` varchar(500) DEFAULT NULL COMMENT '????????????',
  `method_params` varchar(50) DEFAULT NULL COMMENT '????????????',
  `job_message` varchar(500) DEFAULT NULL COMMENT '????????????',
  `status` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????????????????';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '????????????',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '??????IP??????',
  `login_location` varchar(255) DEFAULT '' COMMENT '????????????',
  `browser` varchar(50) DEFAULT '' COMMENT '???????????????',
  `os` varchar(50) DEFAULT '' COMMENT '????????????',
  `status` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `msg` varchar(255) DEFAULT '' COMMENT '????????????',
  `login_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-08-09 14:51:20');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-08-14 13:51:30');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-10-17 18:20:59');
INSERT INTO `sys_logininfor` VALUES ('4', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-10-17 18:24:12');
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-10-17 18:24:12');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-10-21 12:39:08');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-19 13:09:34');
INSERT INTO `sys_logininfor` VALUES ('8', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-25 13:52:13');
INSERT INTO `sys_logininfor` VALUES ('9', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-26 11:15:00');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-26 12:42:25');
INSERT INTO `sys_logininfor` VALUES ('11', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-26 16:23:37');
INSERT INTO `sys_logininfor` VALUES ('12', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 11:17:38');
INSERT INTO `sys_logininfor` VALUES ('13', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 12:28:49');
INSERT INTO `sys_logininfor` VALUES ('14', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 13:17:35');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 13:18:16');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:19:41');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:24:16');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:29:44');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:41:21');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:55:05');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 15:57:22');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 16:10:12');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 16:23:41');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 16:25:27');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-27 17:34:51');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-30 14:02:29');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2019-12-30 16:38:12');
INSERT INTO `sys_logininfor` VALUES ('28', 'sa', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:00:58');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:01:00');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:01:10');
INSERT INTO `sys_logininfor` VALUES ('31', 'sa', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:01:17');
INSERT INTO `sys_logininfor` VALUES ('32', 'sa', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:01:22');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:01:23');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:35:29');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:36:21');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 11:37:10');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 13:44:20');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 13:50:38');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 13:56:48');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 14:17:52');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-09 14:33:58');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-13 12:54:09');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-13 13:55:54');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-13 13:59:10');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-13 14:00:38');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-15 15:56:24');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-15 16:01:07');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 11:47:11');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 13:35:02');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:38:45');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:38:59');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:40:52');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:41:06');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:42:41');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:42:54');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:44:45');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:44:58');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:46:37');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:46:54');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:47:59');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:48:11');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:49:15');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 14:49:43');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 15:33:05');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 17:21:11');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 17:40:10');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 18:34:25');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-16 18:37:40');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 10:57:05');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 14:42:25');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:18:38');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:25:38');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:26:56');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:28:37');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:34:52');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 15:36:48');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 16:17:43');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-17 16:54:00');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-01-19 13:41:10');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-03-19 20:00:01');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-15 16:36:54');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 16:02:55');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 16:03:50');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 16:47:19');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 16:55:37');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 17:12:42');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 17:23:22');
INSERT INTO `sys_logininfor` VALUES ('88', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 17:31:30');
INSERT INTO `sys_logininfor` VALUES ('89', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-04-16 17:33:00');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 19:10:14');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 19:47:19');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:01:32');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:07:29');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:12:25');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:17:09');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:26:38');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:32:33');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-01 20:40:06');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 09:55:38');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:24:45');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:28:49');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:34:37');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:36:59');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:40:01');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:43:46');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:45:00');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:49:11');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 10:53:47');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 11:45:12');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 11:48:10');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 11:51:04');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:01:37');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:05:42');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:20:00');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:29:27');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:30:41');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:36:22');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:54:48');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 15:59:57');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 16:41:09');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 17:00:26');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 17:09:57');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 17:23:59');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-03 17:26:18');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 18:53:49');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 19:03:34');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:02:28');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:19:18');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:20:06');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:24:44');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:30:16');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:38:05');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 21:43:33');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 22:34:32');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-06 22:42:59');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 17:31:13');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 18:15:21');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:11:30');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:22:51');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:25:02');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:29:12');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:30:23');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:39:47');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:41:10');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:44:22');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 19:56:35');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-07 20:14:30');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-19 19:41:14');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-27 17:39:09');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-27 19:29:30');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-27 20:11:39');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-27 20:14:30');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 20:24:50');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 20:55:54');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 21:34:27');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 21:36:05');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 21:37:47');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 22:12:22');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 22:45:12');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 22:49:29');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 22:51:05');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-28 22:56:23');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 08:37:05');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 10:07:11');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 10:33:36');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 10:51:50');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 11:00:23');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 11:03:41');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 11:22:34');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 12:23:59');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 12:38:20');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 13:02:06');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 13:11:58');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 13:14:37');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-05-29 13:20:07');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-06-10 13:07:14');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 15:24:12');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 15:54:15');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 16:03:16');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 16:54:17');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 16:58:13');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 17:10:59');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 17:59:03');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:04:26');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:07:44');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:12:06');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:17:34');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:45:06');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '??????IP', 'Chrome', 'Windows 7', '0', '????????????', '2020-07-06 18:48:57');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-06 21:17:44');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-06 21:34:05');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-06 22:04:38');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-27 23:42:58');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-27 23:49:16');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-07-31 16:36:10');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-04 21:23:18');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-07 22:57:58');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-12 10:40:13');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-12 10:45:48');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-14 21:35:01');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-16 13:52:23');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-09-29 11:07:38');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 20:36:28');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:34:23');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:35:51');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:39:46');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:44:14');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:47:10');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:53:48');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 21:56:11');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:00:06');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:14:08');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:18:39');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:23:10');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:25:44');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:27:52');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:30:48');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:38:35');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:40:05');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:46:26');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-20 22:48:38');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-10-22 20:02:31');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 13:44:58');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 15:48:12');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 17:47:32');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 20:01:28');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 20:08:32');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-03 20:12:34');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-13 20:29:36');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-13 22:06:55');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 21:37:42');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 22:11:44');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 22:24:48');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 22:31:37');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 22:36:16');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 22:59:41');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-20 23:37:39');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-21 00:14:02');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-21 10:39:14');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', '0', '????????????', '2020-11-21 15:07:34');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-19 21:18:30');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-20 16:04:58');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 09:11:28');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 09:47:16');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 10:20:14');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 10:29:57');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 10:35:15');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 10:50:10');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 11:39:44');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 11:46:16');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 11:56:30');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 12:03:18');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 12:57:47');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-23 14:34:01');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 14:45:29');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 14:49:03');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 14:51:45');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 16:21:27');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 16:51:41');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-24 20:34:24');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 08:49:40');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 10:01:13');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 11:04:11');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 11:13:17');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 11:17:56');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 12:13:32');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 14:24:08');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 14:57:11');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 16:29:15');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-25 16:33:28');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-26 14:16:01');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-26 14:58:29');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-26 16:12:57');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 10:05:38');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 10:55:31');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 11:46:01');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 13:30:01');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 13:34:48');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 13:50:09');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 14:18:26');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 14:22:38');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 15:22:41');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-27 15:47:58');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 10:04:13');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 11:26:41');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 11:50:22');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 12:09:37');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 12:11:20');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 13:47:36');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 14:03:48');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 14:15:33');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 14:34:30');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 14:43:09');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 15:00:23');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 15:24:11');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 15:27:07');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 15:51:22');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 16:09:12');
INSERT INTO `sys_logininfor` VALUES ('299', 'user', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 16:09:21');
INSERT INTO `sys_logininfor` VALUES ('300', 'user', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 16:28:49');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 16:38:22');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-28 16:39:17');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 09:04:05');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 09:30:33');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 10:18:50');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 11:06:36');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 11:08:36');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 11:49:48');
INSERT INTO `sys_logininfor` VALUES ('309', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 14:38:57');
INSERT INTO `sys_logininfor` VALUES ('310', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 14:42:16');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 14:52:00');
INSERT INTO `sys_logininfor` VALUES ('312', 'admin', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', '0', '????????????', '2021-08-31 15:14:21');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `menu_name` varchar(50) NOT NULL COMMENT '????????????',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '?????????ID',
  `order_num` int(4) DEFAULT '0' COMMENT '????????????',
  `url` varchar(200) DEFAULT '#' COMMENT '????????????',
  `target` varchar(20) DEFAULT '' COMMENT '???????????????menuItem?????? menuBlank????????????',
  `menu_type` char(1) DEFAULT '' COMMENT '???????????????M?????? C?????? F?????????',
  `visible` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `perms` varchar(100) DEFAULT NULL COMMENT '????????????',
  `icon` varchar(100) DEFAULT '#' COMMENT '????????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT '' COMMENT '??????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2128 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '????????????', '0', '5', '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('2', '????????????', '0', '6', '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('3', '????????????', '0', '7', '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('100', '????????????', '1', '3', '/system/user', 'menuItem', 'C', '0', 'system:user:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:16:46', '??????????????????');
INSERT INTO `sys_menu` VALUES ('101', '????????????', '1', '4', '/system/role', 'menuItem', 'C', '0', 'system:role:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:20', '??????????????????');
INSERT INTO `sys_menu` VALUES ('102', '????????????', '1', '6', '/system/menu', 'menuItem', 'C', '0', 'system:menu:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:50', '??????????????????');
INSERT INTO `sys_menu` VALUES ('103', '????????????', '1', '2', '/system/dept', 'menuItem', 'C', '0', 'system:dept:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:15:23', '??????????????????');
INSERT INTO `sys_menu` VALUES ('104', '????????????', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('105', '????????????', '1', '7', '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:59', '??????????????????');
INSERT INTO `sys_menu` VALUES ('106', '????????????', '1', '8', '/system/config', 'menuItem', 'C', '0', 'system:config:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:24:07', '??????????????????');
INSERT INTO `sys_menu` VALUES ('107', '????????????', '1', '1', '/system/notice', 'menuItem', 'C', '0', 'system:notice:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-19 13:49:01', '??????????????????');
INSERT INTO `sys_menu` VALUES ('108', '????????????', '1', '9', '#', '', 'M', '0', '', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('109', '????????????', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('110', '????????????', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('111', '????????????', '2', '3', '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('112', '????????????', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('113', '????????????', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('114', '????????????', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('115', '????????????', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('500', '????????????', '108', '1', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('501', '????????????', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '??????????????????');
INSERT INTO `sys_menu` VALUES ('1000', '????????????', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1001', '????????????', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1002', '????????????', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1003', '????????????', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1004', '????????????', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1005', '????????????', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1006', '????????????', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1007', '????????????', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1008', '????????????', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1009', '????????????', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1010', '????????????', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1011', '????????????', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1012', '????????????', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1013', '????????????', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1014', '????????????', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1015', '????????????', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1016', '????????????', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1017', '????????????', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1018', '????????????', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1019', '????????????', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1020', '????????????', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1021', '????????????', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1022', '????????????', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1023', '????????????', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1024', '????????????', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1025', '????????????', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1026', '????????????', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1027', '????????????', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1028', '????????????', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1029', '????????????', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1030', '????????????', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1031', '????????????', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1032', '????????????', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1033', '????????????', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1034', '????????????', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1035', '????????????', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1036', '????????????', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1037', '????????????', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1038', '????????????', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1039', '????????????', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1040', '????????????', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1041', '????????????', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1042', '????????????', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1043', '????????????', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1044', '????????????', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1045', '????????????', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1046', '????????????', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1047', '????????????', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1048', '????????????', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1049', '????????????', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1050', '????????????', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1051', '????????????', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1052', '????????????', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1053', '????????????', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1054', '????????????', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1055', '????????????', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1056', '????????????', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('1057', '????????????', '114', '2', '#', '', 'F', '0', 'tool:gen:code', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES ('2005', '?????????', '0', '1', '#', 'menuItem', 'M', '0', '', 'fa fa-bank', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-27 16:41:29', '');
INSERT INTO `sys_menu` VALUES ('2008', '????????????', '2005', '4', '/html/lims_echart', 'menuItem', 'C', '0', '', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2020-01-14 16:37:06', '');
INSERT INTO `sys_menu` VALUES ('2105', '????????????', '2005', '6', '/lims/recordData', 'menuItem', 'C', '0', 'lims:recordData:view', '#', 'admin', '2019-12-19 13:48:13', 'admin', '2020-03-19 21:38:38', '');
INSERT INTO `sys_menu` VALUES ('2106', '????????????', '2005', '3', '/html/lims_gy2', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:49:43', 'admin', '2020-05-27 17:42:03', '');
INSERT INTO `sys_menu` VALUES ('2108', '????????????', '2005', '5', '/html/lims_trains', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:50:42', 'admin', '2020-03-19 21:38:17', '');
INSERT INTO `sys_menu` VALUES ('2109', '????????????', '2005', '7', '/html/lims_report1', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:51:26', 'admin', '2020-05-28 20:25:27', '');
INSERT INTO `sys_menu` VALUES ('2110', '??????3D', '2005', '2', '/html/lims_data3dview', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-27 12:57:21', 'admin', '2020-01-09 11:38:47', '');
INSERT INTO `sys_menu` VALUES ('2112', '????????????', '2105', '1', '#', '', 'F', '0', 'lims:recordData:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2113', '????????????', '2105', '2', '#', '', 'F', '0', 'lims:recordData:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2114', '????????????', '2105', '3', '#', '', 'F', '0', 'lims:recordData:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2115', '????????????', '2105', '4', '#', '', 'F', '0', 'lims:recordData:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2116', '????????????', '2105', '5', '#', 'menuItem', 'F', '0', 'lims:recordData:import', '#', 'admin', '2019-12-27 15:55:39', 'admin', '2019-12-27 15:56:05', '');
INSERT INTO `sys_menu` VALUES ('2117', '????????????', '2005', '1', '/html/lims_dataview', 'menuItem', 'C', '0', '', '#', 'admin', '2020-03-19 20:18:27', 'admin', '2020-03-19 20:18:51', '');
INSERT INTO `sys_menu` VALUES ('2118', '????????????', '2005', '1', '/lims/produce', 'menuItem', 'C', '1', 'lims:produce:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-05-29 11:24:49', 'ssssd??????');
INSERT INTO `sys_menu` VALUES ('2119', '??????????????????', '2118', '1', '#', '', 'F', '0', 'lims:produce:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2120', '??????????????????', '2118', '2', '#', '', 'F', '0', 'lims:produce:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2121', '??????????????????', '2118', '3', '#', '', 'F', '0', 'lims:produce:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2122', '??????????????????', '2118', '4', '#', '', 'F', '0', 'lims:produce:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2123', '????????????', '2005', '8', '/lims/newworkModelData', 'menuItem', 'C', '0', 'lims:newworkModelData:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '??????????????????????????????');
INSERT INTO `sys_menu` VALUES ('2124', '????????????', '2123', '1', '#', '', 'F', '0', 'lims:newworkModelData:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2125', '????????????', '2123', '2', '#', '', 'F', '0', 'lims:newworkModelData:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2126', '????????????', '2123', '3', '#', '', 'F', '0', 'lims:newworkModelData:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2127', '????????????', '2123', '4', '#', '', 'F', '0', 'lims:newworkModelData:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for `sys_msg_alarm`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_alarm`;
CREATE TABLE `sys_msg_alarm` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `message` varchar(255) DEFAULT NULL COMMENT '????????????',
  `frequence` int(1) DEFAULT NULL COMMENT '????????????',
  `alarm_time` varchar(10) DEFAULT NULL COMMENT '????????????',
  `next_time` date DEFAULT NULL COMMENT '??????????????????',
  `status` int(1) DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `create_by` varchar(64) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `del_flag` int(1) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='????????????';

-- ----------------------------
-- Records of sys_msg_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `notice_title` varchar(50) NOT NULL COMMENT '????????????',
  `notice_type` char(1) NOT NULL COMMENT '???????????????1?????? 2?????????',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '????????????',
  `status` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `file_id` int(20) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `title` varchar(50) DEFAULT '' COMMENT '????????????',
  `business_type` int(2) DEFAULT '0' COMMENT '???????????????0?????? 1?????? 2?????? 3?????????',
  `method` varchar(100) DEFAULT '' COMMENT '????????????',
  `operator_type` int(1) DEFAULT '0' COMMENT '???????????????0?????? 1???????????? 2??????????????????',
  `oper_name` varchar(50) DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(50) DEFAULT '' COMMENT '????????????',
  `oper_url` varchar(255) DEFAULT '' COMMENT '??????URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '????????????',
  `oper_location` varchar(255) DEFAULT '' COMMENT '????????????',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '????????????',
  `status` int(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '????????????',
  `oper_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart1\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-08-14 13:54:43');
INSERT INTO `sys_oper_log` VALUES ('2', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2010', '127.0.0.1', '??????IP', '{}', '0', null, '2019-08-14 13:55:31');
INSERT INTO `sys_oper_log` VALUES ('3', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2011', '127.0.0.1', '??????IP', '{}', '0', null, '2019-08-14 13:55:36');
INSERT INTO `sys_oper_log` VALUES ('4', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,107,1035,1036,1037,1038,103,1016,1017,1018,1019,2008,2038,2039,2040,2041,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-10-17 19:15:49');
INSERT INTO `sys_oper_log` VALUES ('5', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:48:13');
INSERT INTO `sys_oper_log` VALUES ('6', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"???????????????\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:48:45');
INSERT INTO `sys_oper_log` VALUES ('7', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:49:01');
INSERT INTO `sys_oper_log` VALUES ('8', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"???????????????\"],\"url\":[\"https://www.echartsjs.com/examples/zh/editor.html?c=multiple-y-axis\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:49:43');
INSERT INTO `sys_oper_log` VALUES ('9', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"??????????????????\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:50:12');
INSERT INTO `sys_oper_log` VALUES ('10', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2107', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-19 13:50:33');
INSERT INTO `sys_oper_log` VALUES ('11', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????????????????\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:50:42');
INSERT INTO `sys_oper_log` VALUES ('12', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:50:54');
INSERT INTO `sys_oper_log` VALUES ('13', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"34\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:51:01');
INSERT INTO `sys_oper_log` VALUES ('14', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????????????????\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:51:26');
INSERT INTO `sys_oper_log` VALUES ('15', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-19 13:51:49');
INSERT INTO `sys_oper_log` VALUES ('16', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2105,2008,2038,2039,2040,2041,2108,2109,1,100,1000,1001,1002,1003,1004,1005,1006,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-12-19 13:52:17');
INSERT INTO `sys_oper_log` VALUES ('17', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:15:23');
INSERT INTO `sys_oper_log` VALUES ('18', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/user\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:16:46');
INSERT INTO `sys_oper_log` VALUES ('19', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2038', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:19:11');
INSERT INTO `sys_oper_log` VALUES ('20', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2105,2108,2109,1,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-12-26 11:19:57');
INSERT INTO `sys_oper_log` VALUES ('21', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2038', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:20:01');
INSERT INTO `sys_oper_log` VALUES ('22', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2039', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:20:07');
INSERT INTO `sys_oper_log` VALUES ('23', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2108', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:20:11');
INSERT INTO `sys_oper_log` VALUES ('24', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2040', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:20:15');
INSERT INTO `sys_oper_log` VALUES ('25', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2041', '127.0.0.1', '??????IP', '{}', '0', null, '2019-12-26 11:20:20');
INSERT INTO `sys_oper_log` VALUES ('26', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:21:55');
INSERT INTO `sys_oper_log` VALUES ('27', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2105,2008,2108,2109,1,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-12-26 11:22:36');
INSERT INTO `sys_oper_log` VALUES ('28', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"24\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:23:06');
INSERT INTO `sys_oper_log` VALUES ('29', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:23:20');
INSERT INTO `sys_oper_log` VALUES ('30', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"102\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:menu:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:23:33');
INSERT INTO `sys_oper_log` VALUES ('31', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"102\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:menu:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:23:50');
INSERT INTO `sys_oper_log` VALUES ('32', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:23:59');
INSERT INTO `sys_oper_log` VALUES ('33', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 11:24:07');
INSERT INTO `sys_oper_log` VALUES ('34', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"https://www.echartsjs.com/examples/zh/editor.html?c=multiple-y-axis\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:02:57');
INSERT INTO `sys_oper_log` VALUES ('35', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:03:12');
INSERT INTO `sys_oper_log` VALUES ('36', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:03:43');
INSERT INTO `sys_oper_log` VALUES ('37', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:03:53');
INSERT INTO `sys_oper_log` VALUES ('38', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:04:46');
INSERT INTO `sys_oper_log` VALUES ('39', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:06:39');
INSERT INTO `sys_oper_log` VALUES ('40', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_dataview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-26 14:38:59');
INSERT INTO `sys_oper_log` VALUES ('41', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:56:15');
INSERT INTO `sys_oper_log` VALUES ('42', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:56:27');
INSERT INTO `sys_oper_log` VALUES ('43', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:56:36');
INSERT INTO `sys_oper_log` VALUES ('44', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"34\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:56:43');
INSERT INTO `sys_oper_log` VALUES ('45', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????3D\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:57:21');
INSERT INTO `sys_oper_log` VALUES ('46', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2110\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????3D\"],\"url\":[\"/html/lims_data3dview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 12:57:34');
INSERT INTO `sys_oper_log` VALUES ('47', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2008,2108,2109,2105,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-12-27 12:57:45');
INSERT INTO `sys_oper_log` VALUES ('48', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_config\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 13:30:57');
INSERT INTO `sys_oper_log` VALUES ('49', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 14:18:51');
INSERT INTO `sys_oper_log` VALUES ('50', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 14:21:32');
INSERT INTO `sys_oper_log` VALUES ('51', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3\"]}', '0', null, '2019-12-27 15:11:07');
INSERT INTO `sys_oper_log` VALUES ('52', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', '0', null, '2019-12-27 15:13:41');
INSERT INTO `sys_oper_log` VALUES ('53', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2019-12-27 15:19:51');
INSERT INTO `sys_oper_log` VALUES ('54', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '???????????????', '/tool/gen/batchGenCode', '127.0.0.1', '??????IP', '{\"tables\":[\"t_record_data\"]}', '0', null, '2019-12-27 15:21:38');
INSERT INTO `sys_oper_log` VALUES ('55', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 15:29:02');
INSERT INTO `sys_oper_log` VALUES ('56', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 15:29:25');
INSERT INTO `sys_oper_log` VALUES ('57', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2105,2112,2113,2114,2115,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2019-12-27 15:30:39');
INSERT INTO `sys_oper_log` VALUES ('58', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2105\"],\"menuType\":[\"F\"],\"menuName\":[\"????????????\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 15:55:39');
INSERT INTO `sys_oper_log` VALUES ('59', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2116\"],\"parentId\":[\"2105\"],\"menuType\":[\"F\"],\"menuName\":[\"????????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:import\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 15:56:05');
INSERT INTO `sys_oper_log` VALUES ('60', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2106,2110,2105,2112,2113,2114,2115,2116,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2019-12-27 15:56:14');
INSERT INTO `sys_oper_log` VALUES ('61', '????????????', '6', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', '1', 'admin', '???????????????', '/lims/recordData/importData', '127.0.0.1', '??????IP', '{\"updateSupport\":[\"false\"]}', '1', '??????????????????0 ?????????,  ??????????????? 27 ??????????????????????????????????????????<br/>1???Days(Mon Jul 01 00:00:00 CST 20193) ???????????????\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_record_data    ( days,    machine,    extruding_dryness,    centrifuge_speed,    screw_frequency,    water_temperature,    water_addition,    mixing_frequency,    liquid_beauty,    solid_content,    create_by,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value<br/>2???Days(Mon Jul 01 00:00:00 CST 20192) ???????????????\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_record_data    ( days,    machine,    extruding_dryness,    centrifuge_speed,    screw_frequency,    water_temperature,    water_addition,    mixing_frequency,    liquid_beauty,    solid_content,    create_by,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value<br/>3???Days(Mon Jul 01 00:00:00 CST 20191) ???????????????\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The', '2019-12-27 16:16:29');
INSERT INTO `sys_oper_log` VALUES ('62', '????????????', '6', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', '1', 'admin', '???????????????', '/lims/recordData/importData', '127.0.0.1', '??????IP', '{\"updateSupport\":[\"false\"]}', '0', null, '2019-12-27 16:16:57');
INSERT INTO `sys_oper_log` VALUES ('63', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"?????????\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', '0', null, '2019-12-27 16:41:29');
INSERT INTO `sys_oper_log` VALUES ('64', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/system_main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-08 17:08:59');
INSERT INTO `sys_oper_log` VALUES ('65', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-08 17:09:45');
INSERT INTO `sys_oper_log` VALUES ('66', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:38:38');
INSERT INTO `sys_oper_log` VALUES ('67', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2110\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"??????3D\"],\"url\":[\"/html/lims_data3dview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:38:47');
INSERT INTO `sys_oper_log` VALUES ('68', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:39:03');
INSERT INTO `sys_oper_log` VALUES ('69', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:39:11');
INSERT INTO `sys_oper_log` VALUES ('70', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:39:20');
INSERT INTO `sys_oper_log` VALUES ('71', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:39:57');
INSERT INTO `sys_oper_log` VALUES ('72', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_config\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-09 11:40:04');
INSERT INTO `sys_oper_log` VALUES ('73', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2029', '127.0.0.1', '??????IP', '{}', '0', null, '2020-01-13 15:20:46');
INSERT INTO `sys_oper_log` VALUES ('74', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '???????????????', '/tool/gen/genCode/t_record_data', '127.0.0.1', '??????IP', '{}', '0', null, '2020-01-13 18:58:06');
INSERT INTO `sys_oper_log` VALUES ('75', '????????????', '2', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.editSave()', '1', 'admin', '???????????????', '/lims/recordData/edit', '127.0.0.1', '??????IP', '{\"id\":[\"26\"],\"days\":[\"Tue Jul 09 00:00:00 CST 2019\"],\"machine\":[\"1\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"6360\"],\"water1Temperature\":[\"82.0\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"35.0\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"25\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"123\"],\"extruding1Dryness\":[\"32.98\"],\"extruding2Dryness\":[\"\"],\"liquidOutput\":[\"\"],\"mixingFrequency\":[\"187\"],\"liquidBeauty\":[\"7.0\"],\"solidContent\":[\"8.25\"],\"remark\":[\"\"]}', '0', null, '2020-01-14 13:03:36');
INSERT INTO `sys_oper_log` VALUES ('76', '????????????', '2', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.editSave()', '1', 'admin', '???????????????', '/lims/recordData/edit', '127.0.0.1', '??????IP', '{\"id\":[\"26\"],\"days\":[\"Tue Jul 09 00:00:00 CST 2019\"],\"machine\":[\"1\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"6360\"],\"water1Temperature\":[\"82.0\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"35.0\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"25\"],\"screw2Frequency\":[\"1\"],\"screw3Frequency\":[\"1\"],\"screw4Frequency\":[\"1\"],\"screw5Frequency\":[\"1\"],\"screw6Frequency\":[\"123\"],\"extruding1Dryness\":[\"32.98\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"187\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"7.0\"],\"solid1Content\":[\"8.25\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', '0', null, '2020-01-14 14:37:16');
INSERT INTO `sys_oper_log` VALUES ('77', '????????????', '6', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', '1', 'admin', '???????????????', '/lims/recordData/importData', '127.0.0.1', '??????IP', '{\"updateSupport\":[\"false\"]}', '0', null, '2020-01-14 16:05:07');
INSERT INTO `sys_oper_log` VALUES ('78', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-14 16:37:06');
INSERT INTO `sys_oper_log` VALUES ('79', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-14 17:11:02');
INSERT INTO `sys_oper_log` VALUES ('80', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/gy\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-14 17:38:09');
INSERT INTO `sys_oper_log` VALUES ('81', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_gy\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-14 17:39:27');
INSERT INTO `sys_oper_log` VALUES ('82', '????????????', '1', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', '1', 'admin', '???????????????', '/lims/recordData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2020-01-16\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', '0', null, '2020-01-16 17:43:06');
INSERT INTO `sys_oper_log` VALUES ('83', '????????????', '1', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', '1', 'admin', '???????????????', '/lims/recordData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2020-01-22\"],\"machine\":[\"q\"],\"feedingTime\":[\"1111\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', '0', null, '2020-01-16 17:44:16');
INSERT INTO `sys_oper_log` VALUES ('84', '????????????', '1', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', '1', 'admin', '???????????????', '/lims/recordData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2020-01-23\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', '0', null, '2020-01-16 17:48:18');
INSERT INTO `sys_oper_log` VALUES ('85', '????????????', '1', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', '1', 'admin', '???????????????', '/lims/recordData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2020-01-29\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', '0', null, '2020-01-16 17:49:06');
INSERT INTO `sys_oper_log` VALUES ('86', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-17 11:49:22');
INSERT INTO `sys_oper_log` VALUES ('87', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_train\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-17 15:20:31');
INSERT INTO `sys_oper_log` VALUES ('88', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_trains\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-01-17 15:28:52');
INSERT INTO `sys_oper_log` VALUES ('89', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 20:18:27');
INSERT INTO `sys_oper_log` VALUES ('90', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2117\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_dataview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 20:18:51');
INSERT INTO `sys_oper_log` VALUES ('91', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2020-03-19 20:19:17');
INSERT INTO `sys_oper_log` VALUES ('92', '????????????', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '???????????????', '/system/menu/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"2106\"],\"menuType\":[\"C\"],\"menuName\":[\"gongyi1\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 21:09:21');
INSERT INTO `sys_oper_log` VALUES ('93', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,2118,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2020-03-19 21:13:21');
INSERT INTO `sys_oper_log` VALUES ('94', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2118', '127.0.0.1', '??????IP', '{}', '0', null, '2020-03-19 21:37:41');
INSERT INTO `sys_oper_log` VALUES ('95', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2020-03-19 21:37:50');
INSERT INTO `sys_oper_log` VALUES ('96', '????????????', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '???????????????', '/system/menu/remove/2118', '127.0.0.1', '??????IP', '{}', '0', null, '2020-03-19 21:37:57');
INSERT INTO `sys_oper_log` VALUES ('97', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_trains\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 21:38:17');
INSERT INTO `sys_oper_log` VALUES ('98', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 21:38:27');
INSERT INTO `sys_oper_log` VALUES ('99', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-03-19 21:38:38');
INSERT INTO `sys_oper_log` VALUES ('100', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_gy2\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-05-27 17:42:04');
INSERT INTO `sys_oper_log` VALUES ('101', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/html/lims_report1\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2020-05-28 20:25:27');
INSERT INTO `sys_oper_log` VALUES ('102', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '???????????????', '/tool/gen/genCode/t_produce', '127.0.0.1', '??????IP', '{}', '0', null, '2020-05-28 22:06:00');
INSERT INTO `sys_oper_log` VALUES ('103', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '???????????????', '/tool/gen/genCode/t_produce', '127.0.0.1', '??????IP', '{}', '0', null, '2020-05-28 22:06:01');
INSERT INTO `sys_oper_log` VALUES ('104', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2020-05-28 22:19:06');
INSERT INTO `sys_oper_log` VALUES ('105', '????????????', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '???????????????', '/system/menu/edit', '127.0.0.1', '??????IP', '{\"menuId\":[\"2118\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"????????????\"],\"url\":[\"/lims/produce\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:produce:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2020-05-29 11:24:49');
INSERT INTO `sys_oper_log` VALUES ('106', '????????????', '1', 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', '1', 'admin', '???????????????', '/system/dept/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"100\"],\"deptName\":[\"?????????\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"status\":[\"0\"]}', '0', null, '2020-05-29 13:40:40');
INSERT INTO `sys_oper_log` VALUES ('107', '????????????', '1', 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', '1', 'admin', '???????????????', '/system/dept/add', '127.0.0.1', '??????IP', '{\"parentId\":[\"101\"],\"deptName\":[\"?????????1\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"status\":[\"0\"]}', '0', null, '2020-05-29 13:40:52');
INSERT INTO `sys_oper_log` VALUES ('108', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '???????????????', '/tool/gen/genCode/t_newwork_model_data', '127.0.0.1', '??????IP', '{}', '0', null, '2021-08-23 10:00:04');
INSERT INTO `sys_oper_log` VALUES ('109', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '???????????????', '/system/role/authDataScope', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2021-08-23 10:27:46');
INSERT INTO `sys_oper_log` VALUES ('110', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '???????????????', '/system/role/edit', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"???????????????\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,2123,2124,2125,2126,2127,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', '0', null, '2021-08-23 10:28:04');
INSERT INTO `sys_oper_log` VALUES ('111', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '???????????????', '/system/role/authDataScope', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', '0', null, '2021-08-23 10:28:13');
INSERT INTO `sys_oper_log` VALUES ('112', '????????????', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '???????????????', '/tool/gen/genCode/t_newwork_model_data', '127.0.0.1', '??????IP', '{}', '0', null, '2021-08-23 11:41:39');
INSERT INTO `sys_oper_log` VALUES ('113', '????????????????????????', '1', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2021-08-27  02:08\"],\"water\":[\"1\"],\"electric\":[\"1\"],\"gas\":[\"1\"],\"yield\":[\"1\"],\"speed\":[\"1\"],\"temperature\":[\"1\"],\"humidity\":[\"1\"],\"oven\":[\"1\"],\"hotair\":[\"1\"],\"low\":[\"1\"],\"hight\":[\"1\"],\"centrifuge\":[\"1\"]}', '0', null, '2021-08-23 14:16:03');
INSERT INTO `sys_oper_log` VALUES ('114', '????????????????????????', '3', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.remove()', '1', 'admin', '???????????????', '/lims/newworkModelData/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"2\"]}', '0', null, '2021-08-23 14:16:43');
INSERT INTO `sys_oper_log` VALUES ('115', '????????????????????????', '1', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2021-08-23  02:08\"],\"water\":[\"1\"],\"electric\":[\"1\"],\"gas\":[\"1\"],\"yield\":[\"1\"],\"speed\":[\"1\"],\"temperature\":[\"1\"],\"humidity\":[\"1\"],\"oven\":[\"1\"],\"hotair\":[\"1\"],\"low\":[\"1\"],\"hight\":[\"1\"],\"centrifuge\":[\"1\"]}', '0', null, '2021-08-23 14:31:26');
INSERT INTO `sys_oper_log` VALUES ('116', '????????????????????????', '1', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/add', '127.0.0.1', '??????IP', '{\"days\":[\"2021-08-24  02:08\"],\"water\":[\"2\"],\"electric\":[\"2\"],\"gas\":[\"2\"],\"yield\":[\"2\"],\"speed\":[\"2\"],\"temperature\":[\"2\"],\"humidity\":[\"2\"],\"oven\":[\"2\"],\"hotair\":[\"2\"],\"low\":[\"2\"],\"hight\":[\"2\"],\"centrifuge\":[\"2\"]}', '0', null, '2021-08-23 14:34:33');
INSERT INTO `sys_oper_log` VALUES ('117', '????????????', '3', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.remove()', '1', 'admin', '???????????????', '/lims/recordData/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"41\"]}', '0', null, '2021-08-23 14:38:24');
INSERT INTO `sys_oper_log` VALUES ('118', '????????????', '3', 'com.ruoyi.project.lims.recordData.controller.RecordDataController.remove()', '1', 'admin', '???????????????', '/lims/recordData/remove', '127.0.0.1', '??????IP', '{\"ids\":[\"40\"]}', '0', null, '2021-08-23 14:39:41');
INSERT INTO `sys_oper_log` VALUES ('119', '????????????????????????', '2', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/edit', '127.0.0.1', '??????IP', '{\"id\":[\"1\"],\"days\":[\"Fri Jan 15 00:00:00 CST 2021\"],\"water\":[\"11161\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.0\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', '0', null, '2021-08-23 14:59:58');
INSERT INTO `sys_oper_log` VALUES ('120', '????????????????????????', '2', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/edit', '127.0.0.1', '??????IP', '{\"id\":[\"1\"],\"days\":[\"Fri Jan 15 00:00:00 CST 2021\"],\"water\":[\"11162\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.0\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', '0', null, '2021-08-23 15:00:09');
INSERT INTO `sys_oper_log` VALUES ('121', '????????????????????????', '2', 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', '1', 'admin', '???????????????', '/lims/newworkModelData/edit', '127.0.0.1', '??????IP', '{\"id\":[\"1\"],\"days\":[\"2021-01-15 12:01\"],\"water\":[\"11162\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.00\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', '0', null, '2021-08-23 15:28:41');
INSERT INTO `sys_oper_log` VALUES ('122', '????????????', '1', 'com.ruoyi.project.system.role.controller.RoleController.addSave()', '1', 'admin', '???????????????', '/system/role/add', '127.0.0.1', '??????IP', '{\"roleName\":[\"????????????\"],\"roleKey\":[\"operate\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2123,2124,2125,2126,2127,1,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', '0', null, '2021-08-28 16:00:39');
INSERT INTO `sys_oper_log` VALUES ('123', '????????????', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '???????????????', '/system/role/authDataScope', '127.0.0.1', '??????IP', '{\"roleId\":[\"1\"],\"roleName\":[\"???????????????\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2021-08-28 16:00:57');
INSERT INTO `sys_oper_log` VALUES ('124', '????????????', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '???????????????', '/system/user/add', '127.0.0.1', '??????IP', '{\"deptId\":[\"101\"],\"userName\":[\"manager\"],\"deptName\":[\"?????????\"],\"phonenumber\":[\"1387100000\"],\"sex\":[\"0\"],\"loginName\":[\"user\"],\"password\":[\"user123\"],\"role\":[\"4\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"\"]}', '0', null, '2021-08-28 16:03:43');
INSERT INTO `sys_oper_log` VALUES ('125', '????????????', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '???????????????', '/system/user/edit', '127.0.0.1', '??????IP', '{\"userId\":[\"3\"],\"deptId\":[\"101\"],\"userName\":[\"user\"],\"dept.deptName\":[\"?????????\"],\"phonenumber\":[\"1387100000\"],\"sex\":[\"0\"],\"loginName\":[\"user\"],\"role\":[\"4\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"\"]}', '0', null, '2021-08-28 16:04:14');
INSERT INTO `sys_oper_log` VALUES ('126', '????????????', '2', 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', '1', 'admin', '???????????????', '/system/config/edit', '127.0.0.1', '??????IP', '{\"configId\":[\"1\"],\"configName\":[\"????????????-????????????????????????\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-green\"],\"configType\":[\"Y\"],\"remark\":[\"?????? skin-blue????????? skin-green????????? skin-purple????????? skin-red????????? skin-yellow\"]}', '0', null, '2021-08-31 15:06:09');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `post_code` varchar(64) NOT NULL COMMENT '????????????',
  `post_name` varchar(50) NOT NULL COMMENT '????????????',
  `post_sort` int(4) NOT NULL COMMENT '????????????',
  `status` char(1) NOT NULL COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'me', '?????????', '1', '0', 'sys', '2019-08-07 18:56:50', 'sys', '2019-08-07 18:56:50', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `role_name` varchar(30) NOT NULL COMMENT '????????????',
  `role_key` varchar(100) NOT NULL COMMENT '?????????????????????',
  `role_sort` int(4) NOT NULL COMMENT '????????????',
  `data_scope` char(1) DEFAULT '1' COMMENT '???????????????1????????????????????? 2????????????????????????',
  `status` char(1) NOT NULL COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '???????????????', 'admin', '1', '1', '0', '0', 'sys', '2019-08-07 18:57:56', 'admin', '2021-08-28 16:00:57', '???????????????');
INSERT INTO `sys_role` VALUES ('2', '??????????????????', 'manager', '2', '4', '0', '0', 'sys', '2019-08-07 18:57:56', 'sys', '2019-08-07 18:57:56', '??????????????????');
INSERT INTO `sys_role` VALUES ('3', '????????????', 'cuser', '3', '4', '0', '0', 'sys', '2019-08-07 18:57:56', 'sys', '2019-08-07 18:57:56', '????????????');
INSERT INTO `sys_role` VALUES ('4', '????????????', 'operate', '2', '1', '0', '0', 'admin', '2021-08-28 16:00:38', '', null, null);

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  `dept_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  `menu_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '2005');
INSERT INTO `sys_role_menu` VALUES ('1', '2008');
INSERT INTO `sys_role_menu` VALUES ('1', '2105');
INSERT INTO `sys_role_menu` VALUES ('1', '2106');
INSERT INTO `sys_role_menu` VALUES ('1', '2108');
INSERT INTO `sys_role_menu` VALUES ('1', '2109');
INSERT INTO `sys_role_menu` VALUES ('1', '2110');
INSERT INTO `sys_role_menu` VALUES ('1', '2112');
INSERT INTO `sys_role_menu` VALUES ('1', '2113');
INSERT INTO `sys_role_menu` VALUES ('1', '2114');
INSERT INTO `sys_role_menu` VALUES ('1', '2115');
INSERT INTO `sys_role_menu` VALUES ('1', '2116');
INSERT INTO `sys_role_menu` VALUES ('1', '2117');
INSERT INTO `sys_role_menu` VALUES ('1', '2118');
INSERT INTO `sys_role_menu` VALUES ('1', '2119');
INSERT INTO `sys_role_menu` VALUES ('1', '2120');
INSERT INTO `sys_role_menu` VALUES ('1', '2121');
INSERT INTO `sys_role_menu` VALUES ('1', '2122');
INSERT INTO `sys_role_menu` VALUES ('1', '2123');
INSERT INTO `sys_role_menu` VALUES ('1', '2124');
INSERT INTO `sys_role_menu` VALUES ('1', '2125');
INSERT INTO `sys_role_menu` VALUES ('1', '2126');
INSERT INTO `sys_role_menu` VALUES ('1', '2127');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '100');
INSERT INTO `sys_role_menu` VALUES ('4', '101');
INSERT INTO `sys_role_menu` VALUES ('4', '102');
INSERT INTO `sys_role_menu` VALUES ('4', '103');
INSERT INTO `sys_role_menu` VALUES ('4', '104');
INSERT INTO `sys_role_menu` VALUES ('4', '108');
INSERT INTO `sys_role_menu` VALUES ('4', '500');
INSERT INTO `sys_role_menu` VALUES ('4', '501');
INSERT INTO `sys_role_menu` VALUES ('4', '1000');
INSERT INTO `sys_role_menu` VALUES ('4', '1001');
INSERT INTO `sys_role_menu` VALUES ('4', '1002');
INSERT INTO `sys_role_menu` VALUES ('4', '1003');
INSERT INTO `sys_role_menu` VALUES ('4', '1004');
INSERT INTO `sys_role_menu` VALUES ('4', '1005');
INSERT INTO `sys_role_menu` VALUES ('4', '1006');
INSERT INTO `sys_role_menu` VALUES ('4', '1007');
INSERT INTO `sys_role_menu` VALUES ('4', '1008');
INSERT INTO `sys_role_menu` VALUES ('4', '1009');
INSERT INTO `sys_role_menu` VALUES ('4', '1010');
INSERT INTO `sys_role_menu` VALUES ('4', '1011');
INSERT INTO `sys_role_menu` VALUES ('4', '1012');
INSERT INTO `sys_role_menu` VALUES ('4', '1013');
INSERT INTO `sys_role_menu` VALUES ('4', '1014');
INSERT INTO `sys_role_menu` VALUES ('4', '1015');
INSERT INTO `sys_role_menu` VALUES ('4', '1016');
INSERT INTO `sys_role_menu` VALUES ('4', '1017');
INSERT INTO `sys_role_menu` VALUES ('4', '1018');
INSERT INTO `sys_role_menu` VALUES ('4', '1019');
INSERT INTO `sys_role_menu` VALUES ('4', '1020');
INSERT INTO `sys_role_menu` VALUES ('4', '1021');
INSERT INTO `sys_role_menu` VALUES ('4', '1022');
INSERT INTO `sys_role_menu` VALUES ('4', '1023');
INSERT INTO `sys_role_menu` VALUES ('4', '1024');
INSERT INTO `sys_role_menu` VALUES ('4', '1039');
INSERT INTO `sys_role_menu` VALUES ('4', '1040');
INSERT INTO `sys_role_menu` VALUES ('4', '1041');
INSERT INTO `sys_role_menu` VALUES ('4', '1042');
INSERT INTO `sys_role_menu` VALUES ('4', '1043');
INSERT INTO `sys_role_menu` VALUES ('4', '1044');
INSERT INTO `sys_role_menu` VALUES ('4', '1045');
INSERT INTO `sys_role_menu` VALUES ('4', '2005');
INSERT INTO `sys_role_menu` VALUES ('4', '2123');
INSERT INTO `sys_role_menu` VALUES ('4', '2124');
INSERT INTO `sys_role_menu` VALUES ('4', '2125');
INSERT INTO `sys_role_menu` VALUES ('4', '2126');
INSERT INTO `sys_role_menu` VALUES ('4', '2127');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  `login_name` varchar(30) NOT NULL COMMENT '????????????',
  `user_name` varchar(30) NOT NULL COMMENT '????????????',
  `user_type` varchar(2) DEFAULT '00' COMMENT '???????????????00???????????????',
  `email` varchar(50) DEFAULT '' COMMENT '????????????',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '????????????',
  `sex` char(1) DEFAULT '0' COMMENT '???????????????0??? 1??? 2?????????',
  `avatar` varchar(100) DEFAULT '' COMMENT '????????????',
  `password` varchar(50) DEFAULT '' COMMENT '??????',
  `salt` varchar(20) DEFAULT '' COMMENT '?????????',
  `status` char(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `login_ip` varchar(50) DEFAULT '' COMMENT '????????????IP',
  `login_date` datetime DEFAULT NULL COMMENT '??????????????????',
  `create_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) DEFAULT '' COMMENT '??????',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='???????????????';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '100', 'sa', '??????', '00', 'sa@lims.com', 'sa', '1', '', '8215ad24cb965ad02b75822dc22f3f52', 'da294d', '0', '0', '127.0.0.1', '2020-01-09 11:01:17', 'sys', '2019-08-07 19:00:08', 'sys', '2020-01-09 11:01:17', '???????????????');
INSERT INTO `sys_user` VALUES ('2', '100', 'admin', '??????', '00', 'admin@lims.com', 'admin', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-08-31 15:14:21', 'sys', '2019-08-07 19:00:08', 'sys', '2021-08-31 15:14:21', '???????????????');
INSERT INTO `sys_user` VALUES ('3', '101', 'user', 'user', '00', 'user@lims.com', '1387100000', '0', '', '9a0e984960b9a71a7ede7ad6ac43aa0c', 'f015c0', '0', '0', '127.0.0.1', '2021-08-28 16:09:21', 'admin', '2021-08-28 16:03:43', 'admin', '2021-08-28 16:09:21', '');

-- ----------------------------
-- Table structure for `sys_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '????????????id',
  `login_name` varchar(50) DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(50) DEFAULT '' COMMENT '????????????',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '??????IP??????',
  `login_location` varchar(255) DEFAULT '' COMMENT '????????????',
  `browser` varchar(50) DEFAULT '' COMMENT '???????????????',
  `os` varchar(50) DEFAULT '' COMMENT '????????????',
  `status` varchar(10) DEFAULT '' COMMENT '????????????on_line??????off_line??????',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session????????????',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session??????????????????',
  `expire_time` int(5) DEFAULT '0' COMMENT '??????????????????????????????',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('1c806146-75b8-483e-b25e-31b0aa8ab9d5', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 20:12:30', '2021-08-31 14:59:44', '1800000');
INSERT INTO `sys_user_online` VALUES ('1e818826-ec0b-4b66-8def-c55739434ed1', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 17:47:28', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('26ed6382-8463-4fee-80f7-f44ae160ed40', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-13 22:06:53', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('2c04e3b3-54bb-4af8-b793-07e60a025544', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-24 20:34:20', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('335ff592-41b1-46ab-98a8-682efa793aa4', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-21 15:07:33', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('34d836ca-319e-404b-90c8-d7a8dff1e21a', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-31 14:42:13', '2021-08-31 15:14:05', '1800000');
INSERT INTO `sys_user_online` VALUES ('4280f61c-e23c-41a2-aef4-5e39b09cbbe9', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-19 21:18:27', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('4dea73c6-1675-4629-a706-d88422fd0d0a', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 20:08:29', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('6da93072-5a69-4a95-be34-614fa64dc279', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:36:12', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('a0e7c911-d4f2-4ea3-8018-bb8cc580ebd6', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:31:33', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('addc7e45-0e3a-47cf-b6b6-2f50e11c915d', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:24:45', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('b276e00a-92b6-4ce1-bc64-a35e785fc68f', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-31 15:14:03', '2021-08-31 15:14:21', '1800000');
INSERT INTO `sys_user_online` VALUES ('dab810c2-c7f5-43f9-b6f9-22196550ed4e', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-28 14:15:30', '2021-08-31 15:14:04', '1800000');
INSERT INTO `sys_user_online` VALUES ('efa3a3a3-c3f8-4bf8-b4d6-026efcc6f634', 'admin', '???????????????', '127.0.0.1', '??????IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 21:37:37', '2021-08-31 15:14:05', '1800000');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '??????ID',
  `post_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '??????ID',
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '4');

-- ----------------------------
-- Table structure for `t_newwork_model_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_newwork_model_data`;
CREATE TABLE `t_newwork_model_data` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `days` datetime DEFAULT NULL COMMENT '????????????',
  `water` int(10) DEFAULT NULL COMMENT '???',
  `electric` int(10) DEFAULT NULL COMMENT '???',
  `gas` int(10) DEFAULT NULL COMMENT '???',
  `yield` double(10,2) DEFAULT NULL COMMENT '??????',
  `speed` int(10) DEFAULT NULL COMMENT '??????',
  `temperature` int(10) DEFAULT NULL COMMENT '??????',
  `humidity` int(10) DEFAULT NULL COMMENT '??????',
  `oven` double(20,11) DEFAULT NULL COMMENT '??????',
  `hotair` double(20,11) DEFAULT NULL COMMENT '????????????',
  `low` double(20,11) DEFAULT NULL COMMENT '?????????',
  `hight` double(20,11) DEFAULT NULL COMMENT '?????????',
  `centrifuge` double(20,11) DEFAULT NULL COMMENT '?????????',
  `create_by` varchar(20) DEFAULT NULL COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COMMENT='????????????????????????';

-- ----------------------------
-- Records of t_newwork_model_data
-- ----------------------------
INSERT INTO `t_newwork_model_data` VALUES ('5', '2021-01-15 00:00:00', '1116', '14937', '5615', '0.00', '0', '10', '48', '3453.23836768054', '1352.51836067488', '2256.11573355128', '2532.37480296573', '35.49161655672', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('6', '2021-01-16 00:00:00', '561', '20880', '6242', '0.00', '0', '8', '45', '4827.18197209411', '1890.64627240353', '3153.75888843481', '3539.93344620235', '49.61270360208', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('7', '2021-01-17 00:00:00', '1108', '26324', '10515', '4.50', '50', '8', '43', '6085.76332535466', '2383.59063576391', '3976.03203923170', '4462.89310526009', '62.54812306615', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('8', '2021-01-18 00:00:00', '1231', '30997', '12453', '13.14', '75', '9', '49', '7166.09959717438', '2806.72234222663', '4681.85173682058', '5255.13970459455', '73.65157919318', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('9', '2021-01-19 00:00:00', '1290', '26618', '10499', '10.08', '75', '9', '48', '6153.73226691576', '2410.21180454201', '4020.43841438495', '4512.73699573822', '63.24669274330', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('10', '2021-01-20 00:00:00', '1400', '36798', '16089', '25.02', '82', '10', '47', '8507.21466518769', '3331.99241053185', '5558.04691458928', '6238.62408780430', '87.43526183665', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('11', '2021-01-21 00:00:00', '1314', '38392', '17998', '22.68', '87', '11', '48', '8875.72654562438', '3476.32623036955', '5798.80800980791', '6508.86613345787', '91.22274505225', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('12', '2021-01-22 00:00:00', '1365', '37418', '16277', '24.30', '88', '12', '47', '8650.55052834375', '3388.13229026797', '5651.69301185123', '6343.73705411874', '88.90843598576', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('13', '2021-01-23 00:00:00', '1301', '31108', '12162', '15.12', '76', '12', '45', '7191.76134041684', '2816.77319166326', '4698.61740907232', '5273.95831630568', '73.91532488762', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('14', '2021-01-24 00:00:00', '1268', '38242', '18685', '28.62', '97', '13', '37', '8841.04851421566', '3462.74400140113', '5776.15169595422', '6483.43557709148', '90.86633195166', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('15', '2021-01-25 00:00:00', '1368', '38813', '18622', '23.76', '94', '13', '46', '8973.05622044486', '3514.44701967424', '5862.39673069063', '6580.24122832623', '92.22307782124', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('16', '2021-01-26 00:00:00', '1310', '37163', '18517', '21.24', '99', '9', '48', '8591.59787494892', '3365.04250102166', '5613.17727829995', '6300.50510829587', '88.30253371475', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('17', '2021-01-27 00:00:00', '1318', '36977', '18938', '26.46', '98', '14', '45', '8548.59711600210', '3348.20053710083', '5585.08344912136', '6268.97121840154', '87.86058147002', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('18', '2021-01-28 00:00:00', '1324', '26424', '13023', '14.94', '97', '15', '43', '6108.88201296048', '2392.64545507619', '3991.13624846750', '4479.84680950435', '62.78573179987', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('19', '2021-01-29 00:00:00', '1327', '30860', '17441', '27.36', '89', '11', '49', '7134.42699515442', '2794.31723976881', '4661.15897016754', '5231.91312977990', '73.32605522798', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('20', '2021-01-30 00:00:00', '1353', '22981', '10990', '7.74', '32', '9', '48', '5312.90559869228', '2080.88802615448', '3471.09832447894', '3896.13077237433', '54.60486309767', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('21', '2021-01-31 00:00:00', '1339', '30254', '17946', '26.82', '102', '8', '47', '6994.32774826318', '2739.44503473641', '4569.62746219860', '5129.17368205966', '71.88614630159', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('22', '2021-02-01 00:00:00', '1343', '33993', '19145', '32.40', '103', '12', '53', '7858.73547784459', '3078.00472882247', '5134.37384552512', '5763.07268375270', '80.77033685563', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('23', '2021-02-02 00:00:00', '1336', '32539', '19084', '28.08', '104', '13', '55', '7522.58976005605', '2946.34765602195', '4914.75864323660', '5516.56582404110', '77.31550586724', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('24', '2021-02-03 00:00:00', '1329', '32276', '19421', '30.42', '101', '11', '57', '7461.78761165275', '2922.53348123066', '4875.03457294645', '5471.97758187868', '76.69059489754', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('25', '2021-02-04 00:00:00', '1276', '33318', '18113', '29.16', '102', '10', '56', '7702.68433650534', '3016.88469846459', '5032.42043318348', '5648.63518010391', '79.16647790297', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('26', '2021-02-05 00:00:00', '1258', '29833', '18562', '26.82', '103', '10', '58', '6896.99807344270', '2701.32424543173', '4506.03874131589', '5057.79858719131', '70.88581353261', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('27', '2021-02-23 00:00:00', '1395', '24047', '15049', '8.82', '52', '14', '55', '5559.35080857026', '2177.41240002335', '3632.10919493256', '4076.85725961819', '57.13777219919', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('28', '2021-02-24 00:00:00', '1347', '30045', '18737', '24.66', '88', '11', '47', '6946.00969116703', '2720.52046237375', '4538.05966489578', '5093.74044018915', '71.38954404811', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('29', '2021-02-25 00:00:00', '1453', '31899', '20313', '27.18', '104', '11', '56', '7374.63015937883', '2888.39681242338', '4818.09170412749', '5408.06211687781', '75.79480997139', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('30', '2021-02-26 00:00:00', '1243', '32929', '20814', '29.70', '102', '12', '58', '7612.75264171872', '2981.66145133983', '4973.66505925622', '5582.68527059373', '78.24217992878', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('31', '2021-02-27 00:00:00', '1416', '32192', '19759', '29.34', '103', '13', '55', '7442.36791406387', '2914.92743300835', '4862.34703718838', '5457.73647031350', '76.49100356121', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('32', '2021-02-28 00:00:00', '1354', '32464', '21725', '29.52', '103', '11', '53', '7505.25074435169', '2939.55654153775', '4903.43048630975', '5503.85054585790', '77.13729931695', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('33', '2021-03-01 00:00:00', '1353', '31912', '20053', '27.90', '105', '12', '53', '7377.63558876759', '2889.57393893397', '4820.05525132814', '5410.26609842956', '75.82569910678', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('34', '2021-03-02 00:00:00', '1414', '32307', '20275', '29.88', '107', '13', '55', '7468.95440481056', '2925.34047521747', '4879.71687780955', '5477.23323019440', '76.76425360500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('35', '2021-03-03 00:00:00', '1416', '32052', '21703', '30.42', '108', '11', '57', '7410.00175141573', '2902.25068597116', '4841.20114425826', '5434.00128437153', '76.15835133400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('36', '2021-03-04 00:00:00', '1263', '26492', '15490', '20.70', '106', '10', '56', '6124.60272053243', '2398.80273220854', '4001.40711074784', '4491.37532839045', '62.94730573881', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('37', '2021-03-05 00:00:00', '1396', '32223', '20692', '32.40', '107', '9', '58', '7449.53470722167', '2917.73442699516', '4867.02934205148', '5462.99211862922', '76.56466226867', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('38', '2021-03-06 00:00:00', '1396', '32822', '20390', '32.04', '107', '8', '55', '7588.01564598050', '2971.97279467570', '4957.50355537391', '5564.54480705236', '77.98793858369', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('39', '2021-03-07 00:00:00', '1268', '31672', '20483', '29.16', '109', '9', '53', '7322.15073851363', '2867.84237258451', '4783.80514916224', '5369.57720824333', '75.25543814583', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('40', '2021-03-08 00:00:00', '1379', '28284', '19371', '21.96', '107', '9', '59', '6538.88960242863', '2561.06509428455', '4272.07454025337', '4795.18570844766', '67.20525424718', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('41', '2021-03-09 00:00:00', '1438', '32923', '21885', '32.04', '107', '8', '58', '7611.36552046237', '2981.11816218110', '4972.75880670208', '5581.66804833907', '78.22792340475', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('42', '2021-03-10 00:00:00', '1423', '30969', '20932', '31.50', '107', '7', '56', '7159.62636464476', '2804.18699281920', '4677.62255823457', '5250.39266740615', '73.58504874774', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('43', '2021-03-11 00:00:00', '1335', '32400', '21676', '31.14', '107', '7', '53', '7490.45478428396', '2933.76145717789', '4893.76379239886', '5493.00017514157', '76.98522972736', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('44', '2021-03-12 00:00:00', '1404', '31270', '19693', '27.72', '103', '5', '55', '7229.21361433826', '2831.44199894915', '4723.08622803433', '5301.42331718138', '74.30025103625', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('45', '2021-03-13 00:00:00', '1299', '32531', '22027', '30.60', '102', '7', '57', '7520.74026504758', '2945.62327047697', '4913.55030649775', '5515.20952770155', '77.29649716854', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('46', '2021-03-14 00:00:00', '1375', '33148', '21364', '32.04', '105', '6', '56', '7663.38256757546', '3001.49150563372', '5006.74327748263', '5619.81388288866', '78.76254305564', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('47', '2021-03-15 00:00:00', '1352', '32212', '21438', '31.32', '107', '6', '58', '7446.99165158503', '2916.73839687081', '4865.36787903555', '5461.12721116235', '76.53852530796', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('48', '2021-03-16 00:00:00', '1331', '32364', '19379', '30.06', '107', '8', '55', '7482.13205674587', '2930.50172222547', '4888.32627707396', '5486.89684161363', '76.89969058322', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('49', '2021-03-26 00:00:00', '1343', '9356', '4041', '0.00', '58', '14', '58', '2162.98441240002', '847.16889485668', '1413.14981610134', '1586.18856909335', '22.23067312744', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('50', '2021-03-27 00:00:00', '1669', '23503', '13323', '6.12', '95', '11', '55', '5433.58514799463', '2128.15418296456', '3549.94229668982', '3984.62910852939', '55.84518068772', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('51', '2021-03-28 00:00:00', '1630', '32246', '17985', '27.72', '102', '11', '53', '7454.85200537101', '2919.81703543698', '4870.50331017571', '5466.89147060540', '76.61931227742', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('52', '2021-03-29 00:00:00', '1624', '30785', '17426', '28.08', '96', '11', '49', '7117.08797945006', '2787.52612528461', '4649.83081324069', '5219.19785159670', '73.14784867768', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('53', '2021-03-30 00:00:00', '1647', '32235', '19599', '32.76', '107', '9', '48', '7452.30894973437', '2918.82100531263', '4868.84184715978', '5465.02656313853', '76.59317531671', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('54', '2021-03-31 00:00:00', '1507', '32508', '19553', '33.84', '107', '8', '47', '7515.42296689824', '2943.54066203515', '4910.07633837351', '5511.31017572537', '77.24184715979', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('55', '2021-04-01 00:00:00', '1637', '26539', '14143', '18.54', '105', '12', '53', '6135.46850370716', '2403.05849728531', '4008.50608908867', '4499.34356938525', '63.05898184366', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('56', '2021-04-02 00:00:00', '1631', '32412', '19979', '33.12', '106', '13', '55', '7493.22902679666', '2934.84803549536', '4895.57629750714', '5495.03461965088', '77.01374277541', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('57', '2021-04-03 00:00:00', '1576', '32709', '18691', '31.86', '107', '11', '57', '7561.89152898593', '2961.74084885282', '4940.43579893746', '5545.38712125634', '77.71944071458', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('58', '2021-04-04 00:00:00', '1565', '32839', '19187', '31.50', '107', '10', '56', '7591.94582287349', '2973.51211395879', '4960.07127094400', '5567.42693677389', '78.02833206842', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('59', '2021-04-05 00:00:00', '1552', '32588', '19173', '31.32', '108', '9', '58', '7533.91791698290', '2950.78451748497', '4922.15970576214', '5524.87313912078', '77.43193414677', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('60', '2021-04-06 00:00:00', '1627', '33562', '18993', '30.24', '109', '8', '55', '7759.09393426353', '3038.97845758655', '5069.27470371883', '5690.00221845992', '79.74624321326', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('61', '2021-04-07 00:00:00', '1501', '18395', '10223', '10.62', '61', '9', '53', '4252.68258508961', '1665.63401249343', '2778.41928892521', '3118.63389573238', '43.70812656898', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('62', '2021-04-08 00:00:00', '1632', '32101', '18321', '26.64', '101', '9', '59', '7421.32990834258', '2906.68754743418', '4848.60220678380', '5442.30859945122', '76.27477961352', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('63', '2021-04-09 00:00:00', '1598', '31341', '18988', '29.52', '105', '8', '58', '7245.62788253839', '2837.87092066087', '4733.81021659173', '5313.46044719481', '74.46895323720', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('64', '2021-04-10 00:00:00', '1638', '32597', '17873', '30.96', '104', '7', '56', '7535.99859886742', '2951.59945122307', '4923.51908459337', '5526.39897250277', '77.45331893280', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('65', '2021-04-11 00:00:00', '1555', '32380', '19644', '30.96', '108', '7', '53', '7485.83104676280', '2931.95049331543', '4890.74295055168', '5489.60943429272', '76.93770798062', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('66', '2021-04-12 00:00:00', '1629', '33401', '18188', '27.18', '108', '5', '55', '7721.87284721817', '3024.40019849378', '5044.95692684919', '5662.70675462665', '79.36369315196', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('67', '2021-04-13 00:00:00', '1629', '32538', '17589', '31.14', '107', '7', '57', '7522.35857317999', '2946.25710782883', '4914.60760114425', '5516.39628699865', '77.31312977991', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('68', '2021-04-14 00:00:00', '1587', '32197', '18705', '31.32', '107', '6', '56', '7443.52384844416', '2915.38017397396', '4863.10224765017', '5458.58415552571', '76.50288399790', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('69', '2021-04-15 00:00:00', '1634', '29964', '17321', '27.00', '105', '6', '58', '6927.28355420632', '2713.18605873081', '4525.82525541478', '5080.00793975130', '71.19708097379', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('70', '2021-04-16 00:00:00', '1613', '32111', '18121', '30.06', '105', '8', '55', '7423.64177710316', '2907.59302936541', '4850.11262770738', '5444.00396987565', '76.29854048689', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('71', '2021-04-17 00:00:00', '1639', '30724', '18299', '31.14', '107', '8', '53', '7102.98558001051', '2782.00268550412', '4640.61724560685', '5208.85609200770', '73.00290735011', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('72', '2021-04-18 00:00:00', '1582', '32221', '18263', '28.62', '108', '9', '59', '7449.07233346956', '2917.55333060891', '4866.72725786676', '5462.65304454434', '76.55991009399', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('73', '2021-04-19 00:00:00', '1670', '31485', '18560', '32.04', '109', '8', '58', '7278.91879269076', '2850.90986047055', '4755.56027789128', '5337.87378130655', '74.81110981377', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('74', '2021-04-20 00:00:00', '1521', '29456', '16592', '23.40', '108', '10', '57', '6809.84062116878', '2667.18757662444', '4449.09587249692', '4993.88312219043', '69.99002860646', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('75', '2021-04-21 00:00:00', '1631', '30775', '17873', '29.34', '107', '12', '58', '7114.77611068947', '2786.62064335338', '4648.32039231711', '5217.50248117228', '73.12408780431', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('76', '2021-04-22 00:00:00', '1588', '31948', '18650', '30.06', '107', '14', '57', '7385.95831630568', '2892.83367388639', '4825.49276665303', '5416.36943195750', '75.91123825092', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('77', '2021-04-23 00:00:00', '1604', '31366', '17466', '31.14', '109', '16', '55', '7251.40755443984', '2840.13462548894', '4737.58626890068', '5317.69887325588', '74.52835542063', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('78', '2021-04-24 00:00:00', '1572', '28667', '16492', '25.38', '109', '18', '47', '6627.43417595890', '2595.74505225057', '4329.92366162647', '4860.11839570319', '68.11529569736', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('79', '2021-04-25 00:00:00', '1559', '31622', '18794', '34.02', '110', '15', '56', '7310.59139471073', '2863.31496292837', '4776.25304454433', '5361.10035612119', '75.13663377897', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('80', '2021-04-26 00:00:00', '1579', '31718', '18484', '30.78', '108', '14', '58', '7332.78533481231', '2872.00758946816', '4790.75308541069', '5377.37591219569', '75.36473816335', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('81', '2021-04-27 00:00:00', '1597', '32119', '18064', '31.50', '108', '11', '55', '7425.49127211162', '2908.31741491039', '4851.32096444625', '5445.36026621519', '76.31754918559', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('82', '2021-04-28 00:00:00', '1631', '32400', '17266', '31.50', '108', '11', '53', '7490.45478428396', '2933.76145717789', '4893.76379239884', '5493.00017514157', '76.98522972736', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('83', '2021-04-29 00:00:00', '1576', '28733', '15461', '27.18', '110', '11', '49', '6642.69250977874', '2601.72123299667', '4339.89243972210', '4871.30784050440', '68.27211746161', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('84', '2021-05-05 00:00:00', '659', '9732', '5760', '8.10', '90', '18', '56', '2249.91067779789', '881.21501547084', '1469.94164282795', '1649.93449705178', '23.12408196626', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('85', '2021-05-06 00:00:00', '1798', '31442', '18821', '29.16', '101', '17', '58', '7268.97775702026', '2847.01628816627', '4749.06546791989', '5330.58368848152', '74.70893805826', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('86', '2021-05-07 00:00:00', '1726', '32526', '18328', '30.24', '107', '18', '55', '7519.58433066729', '2945.17052951136', '4912.79509603595', '5514.36184248934', '77.28461673186', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('87', '2021-05-08 00:00:00', '1816', '33785', '18123', '30.96', '110', '18', '53', '7810.64860762450', '3059.17070465293', '5102.95709031466', '5727.80897892463', '80.27611068947', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('88', '2021-05-09 00:00:00', '1771', '32870', '18184', '30.06', '109', '17', '49', '7599.11261603129', '2976.31910794559', '4964.75357580710', '5572.68258508961', '78.10199077588', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('89', '2021-05-10 00:00:00', '1737', '32557', '19066', '28.08', '108', '16', '48', '7526.75112382509', '2947.97752349816', '4917.47740089905', '5519.61749080506', '77.35827543931', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('90', '2021-05-11 00:00:00', '1709', '25239', '14252', '16.20', '101', '16', '58', '5834.92556483157', '2285.34584622570', '3812.15136902328', '4278.94541420982', '59.97006830521', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('91', '2021-05-12 00:00:00', '1824', '31614', '19549', '33.66', '105', '14', '55', '7308.74189970226', '2862.59057738339', '4775.04470780546', '5359.74405978165', '75.11762508027', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('92', '2021-05-13 00:00:00', '1540', '32839', '18086', '29.70', '103', '16', '53', '7591.94582287349', '2973.51211395879', '4960.07127094400', '5567.42693677389', '78.02833206842', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('93', '2021-05-14 00:00:00', '1696', '32376', '17108', '30.24', '102', '15', '49', '7484.90629925857', '2931.58830054294', '4890.13878218225', '5488.93128612295', '76.92820363127', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('94', '2021-05-15 00:00:00', '1765', '32967', '18260', '30.06', '105', '15', '48', '7621.53774300893', '2985.10228267850', '4979.40465876582', '5589.12767820655', '78.33247124759', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('95', '2021-05-16 00:00:00', '1765', '31474', '17351', '30.78', '105', '17', '47', '7276.37573705412', '2849.91383034620', '4753.89881487535', '5336.00887383968', '74.78497285306', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('96', '2021-05-17 00:00:00', '1742', '32147', '18644', '30.24', '108', '17', '55', '7431.96450464125', '2910.85276431783', '4855.55014303227', '5450.10730340358', '76.38407963104', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('97', '2021-05-18 00:00:00', '1682', '32992', '17981', '30.60', '108', '18', '57', '7627.31741491039', '2987.36598750657', '4983.18071107477', '5593.36610426761', '78.39187343102', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('98', '2021-05-19 00:00:00', '1766', '26609', '14018', '22.14', '108', '17', '56', '6151.65158503123', '2409.39687080390', '4019.07903555373', '4511.21116235623', '63.22530795727', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('99', '2021-05-20 00:00:00', '1815', '31804', '18130', '29.88', '110', '19', '58', '7352.66740615331', '2879.79473407671', '4803.74270535348', '5391.95609784575', '75.56908167435', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('100', '2021-05-21 00:00:00', '1779', '32751', '17431', '33.30', '109', '21', '58', '7571.60137778037', '2965.54387296398', '4946.77956681650', '5552.50767703894', '77.81923638274', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('101', '2021-05-22 00:00:00', '1704', '33197', '18353', '32.58', '111', '23', '57', '7674.71072450231', '3005.92836709674', '5014.14434000816', '5628.12119796835', '78.87897133516', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('102', '2021-05-23 00:00:00', '1732', '33292', '19100', '32.40', '110', '25', '55', '7696.67347772783', '3014.53044544340', '5028.49333878217', '5644.22721700040', '79.10469963220', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('103', '2021-05-24 00:00:00', '1713', '33262', '18430', '31.68', '111', '27', '47', '7689.73787144609', '3011.81399964972', '5023.96207601143', '5639.14110572713', '79.03341701208', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('104', '2021-05-25 00:00:00', '1789', '31836', '18321', '31.50', '110', '24', '56', '7360.06538618717', '2882.69227625664', '4808.57605230894', '5397.38128320392', '75.64511646915', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('105', '2021-05-26 00:00:00', '1729', '34084', '19259', '32.04', '110', '23', '58', '7879.77348356588', '3086.24461439664', '5148.11867592970', '5778.50055461498', '80.98656080332', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('106', '2021-05-27 00:00:00', '1763', '33859', '18795', '31.68', '110', '20', '55', '7827.75643645280', '3065.87127094402', '5114.13420514915', '5740.35472006538', '80.45194115243', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('107', '2021-05-28 00:00:00', '1761', '33102', '18197', '31.86', '110', '20', '53', '7652.74797127678', '2997.32628875008', '4999.79534123415', '5612.01517893630', '78.65324303812', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('108', '2021-05-29 00:00:00', '1704', '33466', '18205', '32.04', '110', '20', '49', '7736.89999416195', '3030.28583104677', '5054.77466285246', '5673.72666238542', '79.51813882889', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('109', '2021-05-30 00:00:00', '1791', '33716', '17780', '32.22', '110', '18', '48', '7794.69671317648', '3052.92287932746', '5092.53518594196', '5716.11092299608', '80.11216066320', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('110', '2021-05-31 00:00:00', '1680', '32949', '17569', '31.32', '110', '17', '47', '7617.37637923989', '2983.47241520229', '4976.68590110338', '5586.07601144258', '78.28970167552', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('111', '2021-06-01 00:00:00', '1784', '21454', '10634', '10.08', '101', '27', '55', '4959.88323895149', '1942.62093525600', '3240.45704944830', '3637.24770856442', '50.97657773367', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('112', '2021-06-02 00:00:00', '1727', '32306', '16982', '28.08', '99', '26', '46', '7468.72321793450', '2925.24992702435', '4879.56583571719', '5477.06369315196', '76.76187751766', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('113', '2021-06-03 00:00:00', '1748', '32709', '17532', '30.60', '103', '27', '51', '7561.89152898593', '2961.74084885282', '4940.43579893746', '5545.38712125634', '77.71944071458', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('114', '2021-06-04 00:00:00', '1742', '31709', '18051', '32.58', '108', '27', '54', '7330.70465292778', '2871.19265573005', '4789.39370657947', '5375.85007881370', '75.34335337731', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('115', '2021-06-05 00:00:00', '1759', '33366', '17444', '30.78', '107', '27', '55', '7713.78130655613', '3021.23101173449', '5039.67045361666', '5656.77295814116', '79.28053009516', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('116', '2021-06-06 00:00:00', '1783', '33889', '17355', '34.20', '108', '27', '51', '7834.69204273454', '3068.58771673770', '5118.66546791989', '5745.44083133866', '80.52322377255', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('117', '2021-06-07 00:00:00', '1747', '34184', '17785', '32.04', '110', '27', '48', '7902.89217117170', '3095.29943370892', '5163.22288516550', '5795.45425885924', '81.22416953704', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('118', '2021-06-08 00:00:00', '1819', '33623', '16970', '32.40', '107', '29', '50', '7773.19633370308', '3044.50189736704', '5078.48827135266', '5700.34397804892', '79.89118454084', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('119', '2021-06-09 00:00:00', '1762', '34466', '16812', '31.32', '110', '27', '45', '7968.08687022010', '3120.83402416954', '5205.81675521045', '5843.26370482806', '81.89422616615', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('120', '2021-06-10 00:00:00', '2372', '44053', '22434', '40.68', '110', '25', '47', '10184.47545098960', '3988.91955163758', '6653.85729464649', '7468.61533072566', '104.67377546850', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('121', '2021-06-11 00:00:00', '1736', '34772', '17388', '32.76', '110', '27', '48', '8038.83005429389', '3148.54177126511', '5252.03563547199', '5895.14203981551', '82.62130889135', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('122', '2021-06-12 00:00:00', '1710', '34160', '17118', '30.78', '109', '28', '50', '7897.34368614630', '3093.12627707397', '5159.59787494890', '5791.38536984062', '81.16714344095', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('123', '2021-06-13 00:00:00', '1738', '34202', '17536', '33.66', '110', '25', '48', '7907.05353494074', '3096.92930118513', '5165.94164282794', '5798.50592562321', '81.26693910911', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('124', '2021-06-14 00:00:00', '1679', '27600', '12342', '19.44', '110', '25', '51', '6380.75777920486', '2499.13013018857', '4168.76174908050', '4679.22237141689', '65.58001050849', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('125', '2021-06-15 00:00:00', '1729', '33288', '17110', '29.70', '107', '29', '46', '7695.74873022360', '3014.16825267091', '5027.88917041274', '5643.54906883063', '79.09519528285', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('126', '2021-06-16 00:00:00', '1796', '34262', '17203', '32.04', '109', '29', '51', '7920.92474750423', '3102.36219277249', '5175.00416836942', '5808.67814816977', '81.40950434935', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('127', '2021-06-17 00:00:00', '1786', '33229', '17618', '31.14', '108', '25', '55', '7682.10870453617', '3008.82590927667', '5018.97768696362', '5633.54638332652', '78.95500612996', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('128', '2021-06-18 00:00:00', '1680', '33798', '17803', '31.32', '109', '24', '46', '7813.65403701325', '3060.34783116353', '5104.92063751531', '5730.01296047638', '80.30699982486', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('129', '2021-06-19 00:00:00', '1797', '32978', '18134', '32.58', '109', '27', '51', '7624.08079864557', '2986.09831280285', '4981.06612178176', '5590.99258567342', '78.35860820830', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('130', '2021-06-20 00:00:00', '1748', '32941', '16800', '29.16', '108', '22', '54', '7615.52688423142', '2982.74802965731', '4975.47756436452', '5584.71971510304', '78.27069297682', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('131', '2021-06-21 00:00:00', '1780', '32363', '17782', '31.14', '108', '23', '55', '7481.90086986981', '2930.41117403234', '4888.17523498160', '5486.72730457119', '76.89731449588', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('132', '2021-06-22 00:00:00', '1794', '33316', '17874', '31.86', '109', '25', '51', '7702.22196275323', '3016.70360207835', '5032.11834899876', '5648.29610601903', '79.16172572830', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('133', '2021-06-23 00:00:00', '1775', '34115', '18471', '32.04', '109', '29', '48', '7886.94027672369', '3089.05160838345', '5152.80098079279', '5783.75620293070', '81.06021951077', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('134', '2021-06-24 00:00:00', '1224', '23967', '12032', '21.78', '110', '30', '50', '5540.85585848561', '2170.16854457353', '3620.02582754392', '4063.29429622278', '56.94768521221', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('137', '2021-07-01 00:00:00', '1448', '34258', '16306', '30.00', '105', '30', '54', '7920.00000000000', '3102.00000000000', '5174.40000000000', '5808.00000000000', '81.40000000000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('138', '2021-07-02 00:00:00', '1379', '33713', '16029', '30.00', '105', '28', '47', '7794.00315250000', '3052.65123470000', '5092.08205970000', '5715.60231190000', '80.10503240100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('139', '2021-07-03 00:00:00', '1290', '29960', '14302', '30.00', '105', '26', '48', '6926.35880670000', '2712.82386600000', '4525.22108700000', '5079.32979160000', '71.18757662400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('140', '2021-07-04 00:00:00', '1182', '23845', '10191', '30.00', '100', '25', '46', '5512.65105960000', '2159.12166500000', '3601.59869230000', '4042.61077700000', '56.65780255700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('141', '2021-07-05 00:00:00', '1363', '34441', '16604', '30.00', '105', '27', '50', '7962.30719830000', '3118.57031930000', '5202.04070290000', '5839.02527880000', '81.83482398300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('142', '2021-07-06 00:00:00', '1379', '33655', '16709', '30.00', '105', '26', '47', '7780.59431370000', '3047.39943950000', '5083.32161830000', '5705.76916340000', '79.96721933600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('143', '2021-07-07 00:00:00', '1445', '35262', '16767', '30.00', '107', '26', '47', '8152.11162360000', '3192.91038590000', '5326.04626070000', '5978.21519060000', '83.78559168700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('144', '2021-07-08 00:00:00', '1399', '34292', '17027', '30.00', '106', '27', '49', '7927.86035380000', '3105.07863860000', '5179.53543110000', '5813.76425940000', '81.48078696900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('145', '2021-07-09 00:00:00', '1500', '33482', '16561', '30.00', '105', '26', '49', '7740.59898420000', '3031.73460210000', '5057.19133630000', '5676.43925510000', '79.55615622600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('146', '2021-07-10 00:00:00', '1396', '33377', '16243', '30.00', '105', '26', '51', '7716.32436220000', '3022.22704190000', '5041.33191660000', '5658.63786560000', '79.30666705600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('147', '2021-07-11 00:00:00', '1329', '27361', '12216', '30.00', '105', '28', '64', '6325.50411580000', '2477.48911200000', '4132.66268900000', '4638.70301830000', '65.01212563500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('148', '2021-07-12 00:00:00', '1326', '33245', '16160', '30.00', '105', '27', '53', '7685.80769460000', '3010.27468040000', '5021.39436040000', '5636.25897600000', '78.99302352700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('149', '2021-07-13 00:00:00', '1590', '34005', '16398', '30.00', '105', '32', '46', '7861.50972040000', '3079.09130710000', '5136.18635060000', '5765.10712830000', '80.79884990400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('150', '2021-07-14 00:00:00', '1406', '33880', '16594', '30.00', '106', '32', '46', '7832.61136090000', '3067.77278300000', '5117.30608910000', '5743.91499800000', '80.50183898700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('151', '2021-07-15 00:00:00', '1584', '34698', '16337', '30.00', '105', '30', '50', '8021.72222550000', '3141.84120500000', '5240.85852060000', '5882.59629870000', '82.44547842800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('152', '2021-07-16 00:00:00', '1396', '34635', '16219', '30.00', '105', '28', '43', '8007.15745230000', '3136.13666880000', '5231.34286880000', '5871.91546500000', '82.29578492600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('153', '2021-07-17 00:00:00', '1408', '34842', '16365', '30.00', '105', '26', '47', '8055.01313560000', '3154.88014480000', '5262.60858190000', '5907.00963280000', '82.78763500500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('154', '2021-07-18 00:00:00', '1321', '27170', '12749', '30.00', '105', '26', '52', '6281.34742250000', '2460.19440710000', '4103.81364940000', '4606.32144320000', '64.55829295300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('155', '2021-07-19 00:00:00', '1362', '34497', '16004', '30.00', '105', '28', '50', '7975.25366340000', '3123.64101820000', '5210.49906010000', '5848.51935310000', '81.96788487400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('156', '2021-07-20 00:00:00', '1330', '33615', '16009', '30.00', '105', '31', '54', '7771.34683870000', '3043.77751180000', '5077.27993460000', '5698.98768170000', '79.87217584200', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('157', '2021-07-21 00:00:00', '1333', '32418', '15464', '30.00', '105', '30', '49', '7494.61614810000', '2935.39132470000', '4896.48255010000', '5496.05184190000', '77.02799929900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('158', '2021-07-22 00:00:00', '1387', '34217', '15807', '30.00', '105', '33', '48', '7910.52133810000', '3098.28752410000', '5168.20727420000', '5801.04898130000', '81.30258041900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('159', '2021-07-23 00:00:00', '1379', '34641', '16222', '30.00', '106', '34', '48', '8008.54457350000', '3136.67995800000', '5232.24912140000', '5872.93268730000', '82.31004145000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('160', '2021-07-24 00:00:00', '1462', '34259', '15968', '30.00', '106', '34', '50', '7920.23118690000', '3102.09054820000', '5174.55104210000', '5808.16953700000', '81.40237608700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('161', '2021-07-25 00:00:00', '1480', '35080', '16129', '30.00', '105', '33', '45', '8110.03561210000', '3176.43061470000', '5298.55659990000', '5947.35944890000', '83.35314379100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('162', '2021-07-26 00:00:00', '1495', '34269', '15957', '30.00', '100', '38', '47', '7922.54305560000', '3102.99603010000', '5176.06146300000', '5809.86490750000', '81.42613696100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('163', '2021-07-27 00:00:00', '1403', '33990', '16533', '30.00', '105', '37', '48', '7858.04191720000', '3077.73308420000', '5133.92071920000', '5762.56407260000', '80.76320859400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('164', '2021-07-28 00:00:00', '1457', '34644', '16409', '30.00', '105', '36', '50', '8009.23813420000', '3136.95160250000', '5232.70224770000', '5873.44129840000', '82.31716971200', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('165', '2021-07-29 00:00:00', '1400', '29921', '14982', '30.00', '105', '35', '48', '6917.34251850000', '2709.29248640000', '4519.33044540000', '5072.71784690000', '71.09490921800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('166', '2021-08-19 00:00:00', '1206', '24960', '11048', '30.00', '90', '35', '52', '5770.42442640000', '2260.08290030000', '3770.01062530000', '4231.64457940000', '59.30713993800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('167', '2021-08-20 00:00:00', '1191', '31559', '16024', '30.00', '101', '34', '48', '7296.02662150000', '2857.61042680000', '4766.73739270000', '5350.41952240000', '74.98694027700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('168', '2021-08-21 00:00:00', '1206', '32578', '15903', '30.00', '100', '31', '48', '7531.60604820000', '2949.87903560000', '4920.64928480000', '5523.17776870000', '77.40817327300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('169', '2021-08-22 00:00:00', '1355', '33935', '16328', '30.00', '106', '33', '50', '7845.32663900000', '3072.75293360000', '5125.61340420000', '5753.23953530000', '80.63252379000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('170', '2021-08-23 00:00:00', '1881', '40325', '19417', '30.00', '106', '34', '54', '9322.61077700000', '3651.35588770000', '6090.77237430000', '6836.58123650000', '95.81572187500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('171', '2021-08-24 00:00:00', '580', '5043', '2260', '30.00', '52', '35', '50', '1165.87541600000', '456.63453792000', '761.70527176000', '854.97530504000', '11.98260844200', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('172', '2021-08-25 00:00:00', '1378', '33373', '16268', '30.00', '107', '30', '42', '7715.39961470000', '3021.86484910000', '5040.72774830000', '5657.95971740000', '79.29716270700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('173', '2021-08-26 00:00:00', '1429', '34775', '16427', '30.00', '115', '34', '42', '8039.52361490000', '3148.81341580000', '5252.48876170000', '5895.65065090000', '82.62843715300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('174', '2021-08-27 00:00:00', '1429', '34824', '17101', '30.00', '115', '34', '42', '8050.85177180000', '3153.25027730000', '5259.88982430000', '5903.95796600000', '82.74486543300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('175', '2021-08-28 00:00:00', '1416', '34206', '16980', '30.00', '115', '34', '44', '7907.97828240000', '3097.29149400000', '5166.54581120000', '5799.18407380000', '81.27644345800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('176', '2021-08-29 00:00:00', '1491', '33960', '17362', '30.00', '115', '34', '44', '7851.10631090000', '3075.01663840000', '5129.38945650000', '5757.47796140000', '80.69192597300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('177', '2021-08-30 00:00:00', '1340', '33300', '16767', '30.00', '115', '34', '46', '7698.52297270000', '3015.25483100000', '5029.70167550000', '5645.58351330000', '79.12370833100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('178', '2021-09-01 00:00:00', '1322', '33311', '16959', '30.00', '115', '33', '53', '7701.06602840000', '3016.25086110000', '5031.36313850000', '5647.44842080000', '79.14984529200', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('179', '2021-09-02 00:00:00', '1297', '29162', '14428', '30.00', '115', '33', '51', '6741.87167960000', '2640.56640780000', '4404.68949730000', '4944.03923170000', '69.29145892900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('180', '2021-09-03 00:00:00', '1359', '27290', '13895', '30.00', '115', '33', '50', '6309.08984760000', '2471.06019030000', '4121.93870040000', '4626.66588830000', '64.84342343400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('181', '2021-09-05 00:00:00', '2249', '49097', '24282', '30.00', '115', '32', '51', '11350.58205400000', '4445.64463770000', '7415.71360850000', '8323.76017280000', '116.65876000000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('182', '2021-09-06 00:00:00', '1427', '32920', '16856', '30.00', '110', '31', '51', '7610.67195980000', '2980.84651760000', '4972.30568040000', '5581.15943720000', '78.22079514300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('183', '2021-09-07 00:00:00', '1486', '33224', '16965', '30.00', '110', '33', '52', '7680.95277020000', '3008.37316830000', '5018.22247650000', '5632.69869810000', '78.94312569300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('184', '2021-09-08 00:00:00', '1414', '33833', '16593', '30.00', '112', '34', '51', '7821.74557770000', '3063.51701790000', '5110.20711070000', '5735.94675700000', '80.39016288200', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('185', '2021-09-09 00:00:00', '1484', '33629', '17660', '30.00', '110', '32', '54', '7774.58345500000', '3045.04518650000', '5079.39452390000', '5701.36120030000', '79.90544106500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('186', '2021-09-10 00:00:00', '1461', '34861', '17103', '30.00', '110', '21', '50', '8059.40568630000', '3156.60056050000', '5265.47838170000', '5910.23083660000', '82.83278066400', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('187', '2021-09-11 00:00:00', '1480', '34117', '17129', '30.00', '113', '29', '41', '7887.40265050000', '3089.23270480000', '5153.10306500000', '5784.09527700000', '81.06497168500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('188', '2021-09-12 00:00:00', '1462', '35071', '16979', '30.00', '115', '30', '50', '8107.95493020000', '3175.61568100000', '5297.19722110000', '5945.83361550000', '83.33175900500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('189', '2021-09-13 00:00:00', '1501', '34088', '17490', '30.00', '115', '29', '46', '7880.69823110000', '3086.60680720000', '5148.72284430000', '5779.17870280000', '80.99606515300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('190', '2021-09-14 00:00:00', '1455', '34927', '18059', '30.00', '120', '24', '54', '8074.66402010000', '3162.57674120000', '5275.44715980000', '5921.42028140000', '82.98960242900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('191', '2021-09-15 00:00:00', '1502', '34775', '17862', '30.00', '120', '23', '56', '8039.52361490000', '3148.81341580000', '5252.48876170000', '5895.65065090000', '82.62843715300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('192', '2021-09-16 00:00:00', '1561', '34545', '18756', '30.00', '120', '25', '56', '7986.35063340000', '3127.98733140000', '5217.74908050000', '5856.65713120000', '82.08193706600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('193', '2021-09-17 00:00:00', '1544', '33858', '18475', '30.00', '118', '22', '56', '7827.52524960000', '3065.78072280000', '5113.98316310000', '5740.18518300000', '80.44956506500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('194', '2021-09-18 00:00:00', '1315', '24232', '11730', '30.00', '115', '26', '46', '5602.12038060000', '2194.16381580000', '3660.05198200000', '4108.22161250000', '57.57734835700', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('195', '2021-09-19 00:00:00', '1520', '30904', '16872', '30.00', '105', '20', '47', '7144.59921770000', '2798.30136030000', '4667.80482220000', '5239.37275960000', '73.43060307100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('196', '2021-09-20 00:00:00', '1447', '31195', '16887', '30.00', '103', '19', '56', '7211.87459860000', '2824.65088450000', '4711.75807110000', '5288.70803900000', '74.12204448600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('197', '2021-09-21 00:00:00', '1462', '32460', '16646', '30.00', '105', '18', '54', '7504.32599680000', '2939.19434880000', '4902.82631790000', '5503.17239770000', '77.12779496800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('198', '2021-09-22 00:00:00', '1529', '32155', '16675', '30.00', '105', '20', '56', '7433.81399960000', '2911.57714990000', '4856.75847980000', '5451.46359970000', '76.40308833000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('199', '2021-09-23 00:00:00', '1436', '33638', '17706', '30.00', '108', '21', '54', '7776.66413680000', '3045.86012030000', '5080.75390270000', '5702.88703370000', '79.92682585100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('200', '2021-09-24 00:00:00', '1448', '33791', '17128', '30.00', '110', '26', '47', '7812.03572890000', '3059.71399380000', '5103.86334290000', '5728.82620120000', '80.29036721300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('201', '2021-09-25 00:00:00', '1322', '27865', '13569', '30.00', '110', '24', '57', '6442.02230140000', '2523.12540140000', '4208.78790360000', '4724.14968770000', '66.20967365300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('202', '2021-09-26 00:00:00', '1512', '33858', '17841', '30.00', '110', '26', '47', '7827.52524960000', '3065.78072280000', '5113.98316310000', '5740.18518300000', '80.44956506500', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('203', '2021-09-27 00:00:00', '1469', '33362', '17692', '30.00', '110', '27', '48', '7712.85655910000', '3020.86881900000', '5039.06628520000', '5656.09481000000', '79.27102574600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('204', '2021-09-28 00:00:00', '1514', '34314', '16648', '30.00', '115', '27', '49', '7932.94646510000', '3107.07069880000', '5182.85835720000', '5817.49407440000', '81.53306089100', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('205', '2021-09-29 00:00:00', '1503', '35375', '17510', '30.00', '110', '21', '47', '8178.23574060000', '3203.14233170000', '5343.11401720000', '5997.37287640000', '84.05408955600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('206', '2021-09-30 00:00:00', '716', '16834', '8489', '30.00', '113', '27', '48', '3891.79987160000', '1524.28828300000', '2542.64258280000', '2853.98657250000', '39.99905423600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('207', '2021-10-01 00:00:00', '1518', '33703', '17336', '30.00', '115', '28', '53', '7791.69128380000', '3051.74575280000', '5090.57163870000', '5713.90694140000', '80.08127152800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('208', '2021-10-02 00:00:00', '1508', '33362', '16447', '30.00', '115', '24', '51', '7712.85655910000', '3020.86881900000', '5039.06628520000', '5656.09481000000', '79.27102574600', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('209', '2021-10-03 00:00:00', '1487', '30689', '14668', '30.00', '115', '16', '50', '7094.89403930000', '2778.83349870000', '4635.33077240000', '5202.92229550000', '72.91974429300', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('210', '2021-10-04 00:00:00', '1550', '34709', '16998', '30.00', '115', '15', '52', '8024.26528110000', '3142.83723510000', '5242.51998370000', '5884.46120610000', '82.47161538900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('211', '2021-10-05 00:00:00', '1548', '35535', '17086', '30.00', '115', '15', '51', '8215.22564070000', '3217.63004260000', '5367.28075190000', '6024.49880320000', '84.43426353000', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('212', '2021-10-06 00:00:00', '1507', '33181', '17070', '30.00', '110', '12', '51', '7671.01173450000', '3004.47959600000', '5011.72766650000', '5625.40860530000', '78.84095393800', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('213', '2021-10-07 00:00:00', '1544', '33680', '17271', '30.00', '110', '15', '52', '7786.37398560000', '3049.66314440000', '5087.09767060000', '5710.00758950000', '80.02662151900', null, null, null, null);
INSERT INTO `t_newwork_model_data` VALUES ('214', '2021-10-08 00:00:00', '1399', '29998', '14678', '30.00', '110', '23', '51', '6935.14390800000', '2716.26469730000', '4530.96068660000', '5085.77219920000', '71.27786794300', null, null, null, null);

-- ----------------------------
-- Table structure for `t_produce`
-- ----------------------------
DROP TABLE IF EXISTS `t_produce`;
CREATE TABLE `t_produce` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `times` datetime DEFAULT NULL COMMENT '??????',
  `banci` varchar(32) DEFAULT NULL COMMENT '??????',
  `name` varchar(32) DEFAULT NULL COMMENT '????????????',
  `plan` int(10) DEFAULT NULL COMMENT '????????????',
  `actual` float(10,2) DEFAULT NULL COMMENT '????????????',
  `batchno` varchar(10) DEFAULT NULL COMMENT '??????',
  `output` int(10) DEFAULT NULL COMMENT '?????????',
  `solid` float(10,2) DEFAULT NULL COMMENT '?????????',
  `beauty` float(10,2) DEFAULT NULL COMMENT '??????',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='ssssd';

-- ----------------------------
-- Records of t_produce
-- ----------------------------
INSERT INTO `t_produce` VALUES ('29', '2020-05-28 13:10:00', '???', '991', '30', '6.09', '5', '505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('30', '2020-05-28 13:20:00', '???', '991', '30', '6.30', '5', '1005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('31', '2020-05-28 13:30:00', '???', '991', '30', '6.51', '5', '1505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('32', '2020-05-28 13:40:00', '???', '991', '30', '6.72', '5', '2005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('33', '2020-05-28 13:50:00', '???', '991', '30', '6.93', '5', '2505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('34', '2020-05-28 14:00:00', '???', '991', '30', '7.14', '5', '3005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('35', '2020-05-28 14:10:00', '???', '991', '30', '7.35', '5', '3505', '8.31', '6.50', null, null);
INSERT INTO `t_produce` VALUES ('36', '2020-05-28 14:20:00', '???', '991', '30', '7.56', '6', '505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('37', '2020-05-28 14:30:00', '???', '991', '30', '7.77', '6', '1005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('38', '2020-05-28 14:40:00', '???', '991', '30', '7.98', '6', '1505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('39', '2020-05-28 14:50:00', '???', '991', '30', '8.19', '6', '2005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('40', '2020-05-28 15:00:00', '???', '991', '30', '8.40', '6', '2505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('41', '2020-05-28 15:10:00', '???', '991', '30', '8.61', '6', '3005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('42', '2020-05-28 15:20:00', '???', '991', '30', '8.82', '6', '3505', '8.31', '6.50', null, null);
INSERT INTO `t_produce` VALUES ('43', '2020-05-28 15:30:00', '???', '991', '30', '9.03', '7', '505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('44', '2020-05-28 15:40:00', '???', '991', '30', '9.24', '7', '1005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('45', '2020-05-28 15:50:00', '???', '991', '30', '9.45', '7', '1505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('46', '2020-05-28 16:00:00', '???', '991', '30', '9.66', '7', '2005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('47', '2020-05-28 16:10:00', '???', '991', '30', '9.87', '7', '2505', null, null, null, null);
INSERT INTO `t_produce` VALUES ('48', '2020-05-28 16:20:00', '???', '991', '30', '10.08', '7', '3005', null, null, null, null);
INSERT INTO `t_produce` VALUES ('49', '2020-05-28 16:30:00', '???', '991', '30', '10.29', '7', '3505', '8.31', '6.50', null, null);
INSERT INTO `t_produce` VALUES ('50', '2020-05-28 16:40:00', '???', '991', '30', '10.50', '8', '505', null, null, null, null);

-- ----------------------------
-- Table structure for `t_record_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_record_data`;
CREATE TABLE `t_record_data` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `days` datetime DEFAULT NULL COMMENT '????????????',
  `machine` varchar(32) DEFAULT NULL COMMENT '???????????????',
  `feeding_time` int(10) DEFAULT NULL COMMENT '????????????',
  `water_addition` int(10) DEFAULT NULL COMMENT '?????????',
  `water1_temperature` int(10) DEFAULT NULL COMMENT '???/????????????',
  `water2_temperature` int(10) DEFAULT NULL COMMENT '???/????????????',
  `extract_time` int(10) DEFAULT NULL COMMENT '????????????',
  `centrifuge1_speed` double(10,2) DEFAULT NULL COMMENT '?????????1#??????/??????',
  `centrifuge2_speed` double(10,2) DEFAULT NULL COMMENT '?????????2#??????/??????',
  `centrifuge3_speed` double(10,2) DEFAULT NULL COMMENT '?????????3#??????/??????',
  `centrifuge4_speed` double(10,2) DEFAULT NULL COMMENT '?????????4#??????/??????',
  `centrifuge1_current` double(10,2) DEFAULT NULL COMMENT '?????????1#??????',
  `centrifuge2_current` double(10,2) DEFAULT NULL COMMENT '?????????2#??????',
  `centrifuge3_current` double(10,0) DEFAULT NULL COMMENT '?????????3#??????',
  `centrifuge4_current` double(10,2) DEFAULT NULL COMMENT '?????????4#??????',
  `extrusion_time` int(10) DEFAULT NULL COMMENT '????????????',
  `slag_discharge_time` int(10) DEFAULT NULL COMMENT '????????????',
  `screw1_frequency` int(10) DEFAULT NULL COMMENT '?????????1#??????',
  `screw2_frequency` int(10) DEFAULT NULL COMMENT '?????????2#??????',
  `screw3_frequency` int(10) DEFAULT NULL COMMENT '?????????3#??????',
  `screw4_frequency` int(10) DEFAULT NULL COMMENT '?????????4#??????',
  `screw5_frequency` int(10) DEFAULT NULL COMMENT '?????????5#??????',
  `screw6_frequency` int(10) DEFAULT NULL COMMENT '?????????6#??????',
  `extruding1_dryness` double(10,2) DEFAULT NULL COMMENT '????????????',
  `extruding2_dryness` double(10,2) DEFAULT NULL COMMENT '????????????',
  `mixing_frequency` int(10) DEFAULT NULL COMMENT '????????????',
  `liquid1_output` double(10,2) DEFAULT NULL COMMENT '??????????????????',
  `liquid1_beauty` double(10,2) DEFAULT NULL COMMENT '???????????????',
  `solid1_content` double(10,2) DEFAULT NULL COMMENT '?????????',
  `liquid2_output` int(10) DEFAULT NULL,
  `liquid2_beauty` double(10,2) DEFAULT NULL,
  `solid2_content` double(10,2) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='132423';

-- ----------------------------
-- Records of t_record_data
-- ----------------------------
INSERT INTO `t_record_data` VALUES ('1', '2019-07-01 00:00:00', '3', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.17', null, '187', '3650.00', '6.00', '5.36', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('2', '2019-07-01 00:00:00', '2', null, '6360', '80', null, null, '35.00', null, null, null, null, null, null, null, null, null, '25', null, null, null, null, null, '32.14', null, '187', '3650.00', '7.00', '8.32', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('3', '2019-07-01 00:00:00', '1', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '27', null, null, null, null, null, '31.66', null, '187', '3650.00', '6.50', '7.18', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('4', '2019-07-02 00:00:00', '3', null, '6360', '71', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '25.35', null, '187', '3650.00', '6.00', '5.17', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('5', '2019-07-02 00:00:00', '1', null, '6360', '71', null, null, '35.00', null, null, null, null, null, null, null, null, null, '33', null, null, null, null, null, '29.29', null, '187', '3650.00', '5.50', '5.66', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('6', '2019-07-02 00:00:00', '2', null, '6360', '65', null, null, '35.00', null, null, null, null, null, null, null, null, null, '35', null, null, null, null, null, '28.75', null, '187', '3650.00', '4.50', '4.78', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('7', '2019-07-03 00:00:00', '1', null, '6360', '72', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.10', null, '187', '3650.00', '5.50', '5.81', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('8', '2019-07-03 00:00:00', '3', null, '6360', '65', null, null, '35.00', null, null, null, null, null, null, null, null, null, '33', null, null, null, null, null, '29.18', null, '187', '3650.00', '5.50', '6.21', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('9', '2019-07-03 00:00:00', '2', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '31.67', null, '187', '3650.00', '6.50', '7.23', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('10', '2019-07-04 00:00:00', '3', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.50', null, '187', '3650.00', '6.00', '6.31', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('11', '2019-07-04 00:00:00', '2', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.29', null, '187', '3650.00', '6.00', '6.16', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('12', '2019-07-04 00:00:00', '1', null, '6360', '74', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.11', null, '187', '3650.00', '5.50', '5.98', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('13', '2019-07-05 00:00:00', '3', null, '6360', '70', null, null, '35.00', null, null, null, null, null, null, null, null, null, '33', null, null, null, null, null, '29.80', null, '187', '3650.00', '5.50', '5.65', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('14', '2019-07-05 00:00:00', '2', null, '6360', '77', null, null, '35.00', null, null, null, null, null, null, null, null, null, '28', null, null, null, null, null, '31.09', null, '187', '3650.00', '6.00', '6.67', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('15', '2019-07-05 00:00:00', '1', null, '6360', '68', null, null, '35.00', null, null, null, null, null, null, null, null, null, '33', null, null, null, null, null, '29.14', null, '187', '3650.00', '5.50', '5.88', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('16', '2019-07-06 00:00:00', '3', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.58', null, '187', '3650.00', '6.00', '6.75', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('17', '2019-07-06 00:00:00', '2', null, '6360', '73', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, null, null, '187', '3650.00', '5.50', '5.89', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('18', '2019-07-06 00:00:00', '1', null, '6360', '73', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, null, null, '187', '3650.00', '5.50', '5.76', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('19', '2019-07-07 00:00:00', '1', null, '6360', '73', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '29.96', null, '187', '3650.00', '5.50', '5.52', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('20', '2019-07-07 00:00:00', '3', null, '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.54', null, '187', '3650.00', '6.00', '6.21', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('21', '2020-05-27 17:10:00', '??????', '9', '6360', '74', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.18', null, '187', '3650.00', '6.00', '6.08', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('22', '2020-05-27 18:20:00', '??????', '8', '6360', '65', null, null, '35.00', null, null, null, null, null, null, null, null, null, '35', null, null, null, null, null, '28.76', null, '187', '3650.00', '4.50', '4.59', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('23', '2020-05-27 19:30:00', '??????', '9', '6360', '80', null, null, '35.00', null, null, null, null, null, null, null, null, null, '25', null, null, null, null, null, '32.54', null, '187', '3650.00', '7.00', '7.35', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('24', '2020-05-27 20:40:00', '??????', '9', '6360', '77', null, null, '35.00', null, null, null, null, null, null, null, null, null, '27', null, null, null, null, null, '31.22', null, '187', '3650.00', '6.50', '7.17', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('25', '2020-05-27 21:50:00', '??????', '8', '6360', '75', null, null, '35.00', null, null, null, null, null, null, null, null, null, '30', null, null, null, null, null, '30.87', null, '187', '3650.00', '6.00', '6.29', null, null, null, 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('26', '2020-05-27 23:00:00', '??????', '6', '6360', '82', null, null, '35.00', null, null, null, null, null, null, null, null, null, '25', '1', '1', '1', '1', '123', '32.98', null, '187', '3650.00', '7.00', '8.25', null, null, null, 'admin', '2019-12-27 16:16:57', '', '0');
INSERT INTO `t_record_data` VALUES ('27', '2020-05-28 00:10:00', '??????', '9', '0', '80', '77', '80', '35.00', null, '35.00', '38.00', null, null, null, null, null, null, '32', null, null, null, null, null, '29.78', null, '187', '3650.00', '6.70', '7.90', null, null, '6.50', 'admin', '2019-12-27 16:16:57', null, '0');
INSERT INTO `t_record_data` VALUES ('28', '2020-05-28 01:20:00', '??????', '7', '500', '70', '72', '60', null, '35.34', null, '37.60', null, '35.00', null, '38.00', '53', '51', null, '50', null, null, '35', null, '31.22', '31.97', '187', '3525.00', '7.00', '7.80', '2200', '6.40', '6.40', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('29', '2020-05-28 02:30:00', '??????', '9', '1000', '73', '80', '90', null, null, '35.00', '38.00', null, null, '35', '38.00', '41', '46', null, null, '50', null, null, '30', '28.81', '32.10', '187', '3625.00', '7.00', '8.10', '2200', '6.50', '6.50', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('30', '2020-05-28 03:40:00', '??????', '9', '1500', '85', '85', '90', '35.00', null, null, '38.00', '35.00', null, null, '38.00', '42', '41', '40', null, null, '40', null, null, '32.31', '32.76', '187', '3602.00', '7.00', '7.90', '2200', '6.40', '6.60', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('31', '2020-05-28 04:50:00', '??????', '8', '2000', '90', '91', '49', null, '35.00', null, '38.00', null, '35.00', null, '38.00', '48', '49', null, '50', null, null, '35', null, '30.75', '30.86', '187', '3511.00', '6.50', '8.20', '2200', '6.60', '6.40', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('32', '2020-05-28 06:00:00', '??????', '9', '2500', '90', '90', '66', null, null, '35.00', '38.00', null, null, '35', '38.00', '50', '42', null, null, '50', null, null, '30', '26.96', '27.92', '187', '3596.00', '6.50', '7.90', '2200', '6.40', '6.50', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('33', '2020-05-28 07:10:00', '??????', '9', '3000', '88', '92', '55', '35.00', null, null, '38.00', '35.00', null, null, '38.00', '41', '42', '40', null, null, '40', null, null, '31.01', '31.01', '187', '3563.00', '7.00', '7.50', '2200', '6.30', '6.60', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('34', '2020-05-28 08:20:00', '??????', '8', '3500', '89', '90', '40', null, '35.00', null, '38.00', null, '35.00', null, '38.00', '45', '47', null, '50', null, null, '35', null, '32.47', '32.11', '187', '3527.00', '6.30', '7.70', '2200', '6.50', '6.70', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('35', '2020-05-28 09:30:00', '??????', '6', '4000', '85', '72', '60', null, '35.34', null, '37.60', null, '35.00', null, '38.00', '53', '51', null, '50', null, null, '35', null, '31.22', '31.97', '187', '3525.00', '7.20', '8.00', '2200', '6.40', '3.30', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('36', '2020-05-28 10:40:00', '??????', '9', '4500', '86', '80', '99', null, null, '35.00', '38.00', null, null, '35', '38.00', '41', '46', null, null, '50', null, null, '30', '28.81', '32.10', '187', '3625.00', '7.00', '8.20', '2200', '6.30', '3.40', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('37', '2020-05-28 11:50:00', '??????', '7', '5000', '85', '85', '90', '35.00', null, null, '38.00', '35.00', null, null, '38.00', '42', '41', '40', null, null, '40', null, null, '32.31', '32.76', '187', '3602.00', '7.00', '8.00', '2200', '6.50', '3.30', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('38', '2020-05-28 13:00:00', '??????', '9', '5500', '90', '91', '60', null, '35.00', null, '38.00', null, '35.00', null, '38.00', '48', '49', null, '50', null, null, '35', null, '30.75', '30.86', '187', '3511.00', '7.00', '7.80', '2200', '6.40', '3.40', 'admin', '2020-01-14 16:05:06', null, '0');
INSERT INTO `t_record_data` VALUES ('39', '2020-05-28 14:10:00', '??????', '9', '6000', '90', '90', '66', null, null, '35.00', '38.00', null, null, '35', '38.00', '55', '42', null, null, '50', null, null, '30', '30.96', '30.92', '187', '3596.00', '6.50', '7.95', '2200', '6.60', '3.50', 'admin', '2020-01-14 16:05:06', null, '0');
