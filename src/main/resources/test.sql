/*
Navicat MySQL Data Transfer

Source Server         : xu01
Source Server Version : 50611
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2015-05-13 22:05:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registerTime` datetime NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gex1lmaqpg0ir5g1f5eftyaa1` (`username`),
  KEY `IDX_account_roleId` (`roleId`),
  KEY `IDX_account_organizationId` (`organizationId`),
  KEY `FK_account_role` (`roleId`),
  KEY `FK_account_organization` (`organizationId`),
  CONSTRAINT `FK_account_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_account_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', 'MissWhen...', 'liukemng@sina.com', 'liukemng', '7FE8A1AE00C5C2A0785A5071DF996D8C', '2014-04-02 23:26:40', '1', '1');
INSERT INTO `account` VALUES ('2', '0', '0', 'AAA', '123@123.com', 'AAAA', '562363ED4A17A4894D4162A0E64DB7C4', '2014-04-03 14:38:38', null, null);
INSERT INTO `account` VALUES ('3', '0', '0', 'WWWWW', '123@123.com', 'FFFFFF', 'CFBDA3E623045D2C2130D653909397E0', '2014-04-03 14:39:00', null, null);
INSERT INTO `account` VALUES ('4', '0', '0', 'TTTT', '123@123.com', 'SSSDD', '50F86F5725447FE015467D74A7D7DB11', '2014-04-03 14:39:18', null, null);
INSERT INTO `account` VALUES ('5', '0', '0', 'OOOO', '123@123.com', 'LLLL', '1F5297672E6BF686ED906F69DBD9B509', '2014-04-03 14:39:36', null, null);
INSERT INTO `account` VALUES ('6', '0', '0', 'CCCCC', '123@123.com', 'RRRR', 'DDF8448BC7A6BEC245B7293CE4EBDA74', '2014-04-03 14:40:16', null, null);
INSERT INTO `account` VALUES ('7', '0', '0', 'NNNN', '123@123.com', 'MMMM', 'A9C51ACEFD41BB51F1A7546B358BF1BD', '2014-04-03 14:40:32', null, null);
INSERT INTO `account` VALUES ('8', '0', '0', 'ZZZZZ', '123@123.com', 'TTTTTT', '8B5CC63F5053E982AD5EB6A461F69209', '2014-04-03 14:40:49', null, null);
INSERT INTO `account` VALUES ('9', '0', '0', 'KKKKK', '123@123.com', 'PPPPP', '78EB5B2DDCC23A6E13A48AEF3B28C87D', '2014-04-03 14:41:10', null, null);
INSERT INTO `account` VALUES ('10', '0', '0', 'XXXXX', '123@123.com', 'DDDF', 'AF8B0A62C9844F4B4E339230D85ECBE0', '2014-04-03 14:41:49', null, null);
INSERT INTO `account` VALUES ('11', '0', '0', 'RTYV', '123@123.com', 'WWW', 'B04874C43B023CB87F753717D73C4D6D', '2014-04-03 14:42:07', null, null);
INSERT INTO `account` VALUES ('12', '1', '1', 'admin', 'admin@qq.com', 'admin', '6fc8facbdf38336c3fbe054e75dbb1fd', '2015-04-22 19:21:47', '1', '1');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `matchUrl` varchar(255) NOT NULL,
  `itemIcon` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_authority_parentId_authority` (`parentId`),
  CONSTRAINT `FK_authority_parentId_authority` FOREIGN KEY (`parentId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '3', '0', '欢迎使用', '1', '0', '1', '/home', '^/home$', 'icon-home', null);
INSERT INTO `authority` VALUES ('2', '2', '0', '首页', '1,2', '0', '1', '/home/index', '/home/index', '', '1');
INSERT INTO `authority` VALUES ('3', '2', '0', '系统设置', '3', '0', '2', '/setting', '^/setting$', 'icon-cogs', null);
INSERT INTO `authority` VALUES ('4', '4', '0', '用户管理', '3,4', '0', '1', '/account/list', '^/account$', '', '3');
INSERT INTO `authority` VALUES ('5', '1', '0', '用户列表', '3,4,5', '0', '1', '/account/list', '/account/list', '', '4');
INSERT INTO `authority` VALUES ('6', '2', '0', '账户绑定', '3,4,6', '0', '2', '/account/authorize', '/account/authorize', '', '4');
INSERT INTO `authority` VALUES ('7', '1', '0', '角色管理', '3,7', '0', '2', '/role/list', '^/role$', '', '3');
INSERT INTO `authority` VALUES ('8', '1', '0', '角色列表', '3,7,8', '0', '1', '/role/list', '/role/list', '', '7');
INSERT INTO `authority` VALUES ('9', '1', '0', '权限绑定', '3,7,9', '0', '2', '/role/bind', '/role/bind', '', '7');
INSERT INTO `authority` VALUES ('10', '1', '0', '权限管理', '3,10', '0', '3', '/authority/chain', '^/authority$', '', '3');
INSERT INTO `authority` VALUES ('11', '1', '0', '权限添加', '3,10,11', '0', '1', '/authority/add', '/authority/add', '', '10');
INSERT INTO `authority` VALUES ('12', '1', '0', '权限编辑', '3,10,12', '0', '2', '/authority/edit', '/authority/edit', '', '10');
INSERT INTO `authority` VALUES ('13', '1', '0', '权限删除', '3,10,13', '0', '3', '/authority/delete', '/authority/delete', '', '10');
INSERT INTO `authority` VALUES ('14', '1', '0', '组织机构管理', '3,14', '0', '4', '/organization/chain', '^/organization$', '', '3');
INSERT INTO `authority` VALUES ('15', '1', '0', '组织机构树', '3,14,15', '0', '1', '/organization/chain', '/organization/chain', '', '14');
INSERT INTO `authority` VALUES ('16', '1', '0', '组织机构添加', '3,14,16', '0', '2', '/organization/add', '/organization/add', '', '14');
INSERT INTO `authority` VALUES ('17', '1', '0', '组织机构编辑', '3,14,17', '0', '3', '/organization/edit', '/organization/edit', '', '14');
INSERT INTO `authority` VALUES ('18', '1', '0', '组织机构删除', '3,14,18', '0', '4', '/organization/delete', '/organization/delete', '', '14');
INSERT INTO `authority` VALUES ('19', '1', '0', '权限树', '3,10,19', '0', '4', '/authority/chain', '/authority/chain', '', '10');
INSERT INTO `authority` VALUES ('21', '1', '0', '微信管理', '21', '0', '3', '/weixinsend', '^/weixinsend$', 'icon-comments', null);
INSERT INTO `authority` VALUES ('22', '1', '0', '创建菜单', '21,22', '0', '1', '/weixinsend/createmenu', '/weixinsend/createmenu', '', '21');
INSERT INTO `authority` VALUES ('23', '4', '0', '查询菜单', '21,23', '0', '2', '/weixinsend/getmenu', '/weixinsend/getmenu', '', '21');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `levelCode` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `theValue` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_organization_parentId_organization` (`parentId`),
  CONSTRAINT `FK_organization_parentId_organization` FOREIGN KEY (`parentId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '1', '0', '总机构', '1', '0', '1', null);
INSERT INTO `organization` VALUES ('2', '1', '0', '分机构1-1', '1,2', '0', '1', '1');
INSERT INTO `organization` VALUES ('3', '1', '0', '分机构', '1,3', '0', '', '1');
INSERT INTO `organization` VALUES ('4', '1', '0', '总机构2', '4', '0', '2', null);
INSERT INTO `organization` VALUES ('5', '2', '0', '组织机构2-1', '4,5', '0', '1', '4');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '4', '系统管理员', '0');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `roleId` int(11) NOT NULL,
  `authorityId` int(11) NOT NULL,
  KEY `FK_sccf4fx8omb6jlsy2ra75xxer` (`authorityId`),
  KEY `FK_fftr98ew5vtbdpcfetn7xd715` (`roleId`),
  CONSTRAINT `FK_fftr98ew5vtbdpcfetn7xd715` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_sccf4fx8omb6jlsy2ra75xxer` FOREIGN KEY (`authorityId`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES ('1', '1');
INSERT INTO `role_authority` VALUES ('1', '2');
INSERT INTO `role_authority` VALUES ('1', '3');
INSERT INTO `role_authority` VALUES ('1', '4');
INSERT INTO `role_authority` VALUES ('1', '5');
INSERT INTO `role_authority` VALUES ('1', '6');
INSERT INTO `role_authority` VALUES ('1', '7');
INSERT INTO `role_authority` VALUES ('1', '8');
INSERT INTO `role_authority` VALUES ('1', '9');
INSERT INTO `role_authority` VALUES ('1', '10');
INSERT INTO `role_authority` VALUES ('1', '11');
INSERT INTO `role_authority` VALUES ('1', '12');
INSERT INTO `role_authority` VALUES ('1', '13');
INSERT INTO `role_authority` VALUES ('1', '19');
INSERT INTO `role_authority` VALUES ('1', '14');
INSERT INTO `role_authority` VALUES ('1', '15');
INSERT INTO `role_authority` VALUES ('1', '16');
INSERT INTO `role_authority` VALUES ('1', '17');
INSERT INTO `role_authority` VALUES ('1', '18');
INSERT INTO `role_authority` VALUES ('1', '21');
INSERT INTO `role_authority` VALUES ('1', '22');
INSERT INTO `role_authority` VALUES ('1', '23');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `TIME` varchar(32) DEFAULT NULL,
  `PLACE` varchar(32) DEFAULT NULL,
  `CREDIT` int(11) DEFAULT NULL,
  `SELNUM` int(11) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  `TEACHER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_x9rcisc7t477o0l9e4d6sgij` (`TEACHER_ID`),
  CONSTRAINT `FK_x9rcisc7t477o0l9e4d6sgij` FOREIGN KEY (`TEACHER_ID`) REFERENCES `t_teacher` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('2', '高等数学', '周一第一节(1~16周)', '主楼154', '1', '100', '其它', '1');
INSERT INTO `t_course` VALUES ('3', '大学英语', '周一第二节（1~8周）', '五号楼105', '3', '50', '其它', '47');
INSERT INTO `t_course` VALUES ('4', '数据库系统', '周一第三节（1~16周）', '五号楼107', '3', '150', '其它', '3');
INSERT INTO `t_course` VALUES ('5', '中国古代文学史', '周一第四节（1~12周）', '四号楼105', '2', '50', '其它', '4');
INSERT INTO `t_course` VALUES ('6', '语言学概论', '周一第五节（1~8周）', '五号楼101', '1', '50', '其它', '5');
INSERT INTO `t_course` VALUES ('7', '现代汉语', '周一第六节（3~9周）', '五号楼203', '1', '50', '其它', '6');
INSERT INTO `t_course` VALUES ('8', '中国当代文学史', '周二第一节（9~16周）', '五号楼204', '2', '100', '其它', '7');
INSERT INTO `t_course` VALUES ('9', '计算机应用基础', '周二第二节（1~16周）', '五号楼104', '2', '100', '其它', '8');
INSERT INTO `t_course` VALUES ('10', '中国文化概论', '周二第三节（2、4、6、8、10、12、14、16周）', '五号楼109', '1', '50', '其它', '9');
INSERT INTO `t_course` VALUES ('11', '新闻学概论', '周二第四节（1~8周）', '四号楼108', '1', '50', '其它', '10');
INSERT INTO `t_course` VALUES ('12', '平面广告设计与制作', '周二第五节（2、4、6、8、10、12、14、16周）', '五号楼207', '2', '100', '其它', '11');
INSERT INTO `t_course` VALUES ('13', '市场营销学', '周二第六节（1~16周）', '五号楼208', '3', '150', '其它', '12');
INSERT INTO `t_course` VALUES ('14', '大众传播学', '周三第一节（1~8周）', '五号楼202', '2', '100', '其它', '13');
INSERT INTO `t_course` VALUES ('15', '外贸英语', '周三第二节（1、3、5、7、9、11、13、15周）', '主楼153', '3', '150', '其它', '14');
INSERT INTO `t_course` VALUES ('16', '计算机信息处理', '周三第三节（9~16周）', '四号楼206', '1', '50', '其它', '15');
INSERT INTO `t_course` VALUES ('17', '银行与金融', '周三第四节（1~8周）', '四号楼308', '1', '50', '其它', '16');
INSERT INTO `t_course` VALUES ('18', '解析几何', '周三第五节（1~16周）', '五号楼301', '3', '150', '其它', '17');
INSERT INTO `t_course` VALUES ('19', '计算机网络', '周三第六节（9~16周）', '五号楼303', '1', '50', '其它', '18');
INSERT INTO `t_course` VALUES ('20', 'C程序语言设计', '周四第一节（1~8周）', '五号楼305', '2', '100', '其它', '19');
INSERT INTO `t_course` VALUES ('21', '汇编语言', '周四第二节（3~12周）', '五号楼306', '2', '100', '其它', '20');
INSERT INTO `t_course` VALUES ('22', '线性代数', '周四第五节（1~16周）', '五号楼307', '3', '150', '其它', '21');
INSERT INTO `t_course` VALUES ('23', '管理信息系统', '周四第六节（3~9周）', '四号楼306', '1', '50', '其它', '22');
INSERT INTO `t_course` VALUES ('24', '运筹学', '周五第一节（9~16周）', '四号路405', '1', '50', '其它', '23');
INSERT INTO `t_course` VALUES ('25', '普通物理', '周五第二节（9~13周）', '四号楼106', '1', '50', '其它', '24');
INSERT INTO `t_course` VALUES ('26', '无机化学及实验', '周五第三节（9~16周）', '四号楼107', '1', '50', '其它', '25');
INSERT INTO `t_course` VALUES ('27', '机械制图', '周五第四节（1~16周）', '五号楼401', '3', '150', '其它', '26');
INSERT INTO `t_course` VALUES ('28', '无机材料学概论', '周五第五节（10~16周）', '五号楼403', '1', '50', '其它', '27');
INSERT INTO `t_course` VALUES ('29', '财务管理', '周五第六（1~13周）', '五号楼405', '2', '100', '其它', '28');
INSERT INTO `t_course` VALUES ('30', '食品微生物学', '周六第一节（2、4、6、8、10、12、14、16周）', '五号楼406', '1', '50', '其它', '29');
INSERT INTO `t_course` VALUES ('31', '食品工程原理', '周六第二节（9~16周）', '五号楼308', '1', '50', '其它', '30');
INSERT INTO `t_course` VALUES ('32', '食品包装', '周六第三节（9~16周）', '五号楼407', '1', '50', '其它', '31');
INSERT INTO `t_course` VALUES ('33', '无机化学', '周六第四节（7~15周）', '五号楼408', '1', '50', '其它', '32');
INSERT INTO `t_course` VALUES ('34', '数学逻辑与实验', '周六第五节（1~16周）', '五号楼409', '3', '150', '其它', '33');
INSERT INTO `t_course` VALUES ('35', '计算机原理与设计', '周六第六节（1~8周）', '四号楼301', '1', '50', '其它', '34');
INSERT INTO `t_course` VALUES ('36', '人工智能', '周一第二节（9~16周）', '四号楼302', '1', '50', '其它', '35');
INSERT INTO `t_course` VALUES ('37', '软件工程', '周二第四节（9~16周）', '四号楼303', '1', '50', '其它', '36');
INSERT INTO `t_course` VALUES ('38', '图像信息原理', '周二第五节（1、3、5、7、9、11、13、15周）', '四号楼304', '2', '100', '其它', '37');
INSERT INTO `t_course` VALUES ('39', '审计学', '周三第三节（1~8周）', '四号楼305', '2', '100', '其它', '38');
INSERT INTO `t_course` VALUES ('40', '经济学', '周三第六节（1~8周）', '四号楼307', '2', '100', '其它', '39');
INSERT INTO `t_course` VALUES ('41', '管理会计', '周四第一节（9~16周）', '四号楼401', '2', '100', '其它', '40');
INSERT INTO `t_course` VALUES ('42', '企业财务会计', '周四第四节（2、4、6、8、10、12、14、16周）', '四号楼402', '2', '100', '其它', '41');
INSERT INTO `t_course` VALUES ('43', '会计电算化', '周四第四节（1、3、5、7、9、11、13、15周）', '四号楼403', '2', '100', '其它', '42');
INSERT INTO `t_course` VALUES ('44', '管理学原理', '周四第三节（1~16周）', '四号楼405', '3', '150', '其它', '43');
INSERT INTO `t_course` VALUES ('45', '成本会计', '周五第二节（1~5周）', '四号楼406', '1', '50', '其它', '44');
INSERT INTO `t_course` VALUES ('46', '经济数学', '周五第三节（1~8周）', '五号楼205', '2', '100', '其它', '45');
INSERT INTO `t_course` VALUES ('47', '税收原理', '周五第五节（3~9周）', '五号楼208', '1', '50', '其它', '46');
INSERT INTO `t_course` VALUES ('48', '数据通信原理与技术', '周六第一节（1、3、5、7、9、11、13、15）', '五号楼206', '2', '100', '其它', '47');
INSERT INTO `t_course` VALUES ('49', '微机原理与应用', '周六第二节（1~8周）', '五号楼102', '2', '100', '其它', '48');
INSERT INTO `t_course` VALUES ('50', '数学电路与逻辑设计', '周六第四节（1~5周）', '五号楼106', '1', '50', '其它', '49');
INSERT INTO `t_course` VALUES ('51', '马克思主义哲学', '周三第六节（9~16周）', '五号楼304', '2', '100', '其它', '50');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMBER` varchar(32) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `SEX` varchar(8) DEFAULT NULL,
  `BIRTHDAY` varchar(32) DEFAULT NULL,
  `STATE` varchar(32) DEFAULT NULL,
  `TELEPHONE` varchar(32) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '20110401', '潘峰', '100', '男', '1993-03-09', '团员', '18235412234', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('2', '20110402', '王硕', '101', '男', '1992-02-22', '团员', '18235411928', '辽宁盘锦', '其它');
INSERT INTO `t_student` VALUES ('3', '20110403', '张磊', '102', '男', '1993-01-30', '团员', '18235419025', '山西晋中', '其它');
INSERT INTO `t_student` VALUES ('4', '20110404', '张红霞', '103', '女', '1993-07-06', '团员', '18235412712', '黑龙江牡丹江', '其它');
INSERT INTO `t_student` VALUES ('5', '20110405', '徐冰浩', '104', '男', '1992-03-09', '党员', '13466897926', '河南洛阳', '其它');
INSERT INTO `t_student` VALUES ('6', '20110406', '张哲', '105', '男', '1994-11-23', '团员', '18235416898', '山西运城', '其它');
INSERT INTO `t_student` VALUES ('7', '20110407', '郭睿', '106', '男', '1991-10-15', '团员', '13466883470', '山西晋中', '其它');
INSERT INTO `t_student` VALUES ('8', '20110408', '张雪', '107', '女', '1993-08-30', '团员', '18235419036', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('9', '20110409', '李佳航', '108', '男', '1993-04-16', '团员', '18651967128', '辽宁葫芦岛', '其它');
INSERT INTO `t_student` VALUES ('10', '20110410', '董明', '109', '男', '1993-08-22', '团员', '13810199125', '辽宁抚顺', '其它');
INSERT INTO `t_student` VALUES ('11', '20110411', '罗乃畅', '110', '女', '1992-05-26', '团员', '15120018247', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('12', '20110412', '李涛', '111', '男', '1992-07-18', '团员', '18234426974', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('13', '20110413', '石鸿日', '112', '女', '1992-04-22', '团员', '13651321030', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('14', '20110414', '石丽伟', '113', '女', '1994-03-27', '团员', '18634935526', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('15', '20110415', '张娟', '114', '女', '1992-05-06', '团员', '15110621485', '山西晋城', '其它');
INSERT INTO `t_student` VALUES ('16', '20110416', '黄帅', '115', '男', '1993-08-10', '团员', '15235414027', '山西晋中', '其它');
INSERT INTO `t_student` VALUES ('17', '20110417', '史杰', '116', '男', '1992-02-28', '团员', '15652178835', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('18', '20110418', '佟雪', '117', '女', '1993-05-20', '团员', '18790663212', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('19', '20110419', '杨宁', '118', '男', '1993-08-29', '党员', '15810340347', '河南洛阳', '其它');
INSERT INTO `t_student` VALUES ('20', '20110420', '高翔', '119', '男', '1992-04-24', '党员', '18235417185', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('21', '20110421', '黄振', '120', '男', '1993-10-12', '团员', '18285115086', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('22', '20110422', '王东', '121', '男', '1991-03-12', '团员', '18224523773', '辽宁铁岭', '其它');
INSERT INTO `t_student` VALUES ('23', '20110423', '任大力', '122', '男', '1992-05-24', '团员', '13213968055', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('24', '20110424', '王莉', '123', '男', '1992-11-21', '团员', '18935444686', '山西大同', '其它');
INSERT INTO `t_student` VALUES ('25', '20110425', '陈东', '124', '男', '1992-10-19', '党员', '18003851925', '辽宁盘锦', '其它');
INSERT INTO `t_student` VALUES ('26', '20110426', '杨俊', '125', '男', '1992-12-11', '团员', '15544212777', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('27', '20110427', '黄强', '126', '男', '1991-09-30', '团员', '15138916114', '辽宁大连', '其它');
INSERT INTO `t_student` VALUES ('28', '20110428', '李贺', '127', '女', '1991-07-25', '团员', '18734444028', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('29', '20110429', '孙颖', '128', '女', '1992-09-28', '团员', '18235417343', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('30', '20110430', '张建', '129', '男', '1993-04-12', '团员', '13835441073', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('31', '20110431', '周昊', '130', '男', '1993-08-21', '团员', '18234401075', '辽宁阜新', '其它');
INSERT INTO `t_student` VALUES ('32', '20110432', '刘莹莹', '131', '女', '1993-10-24', '团员', '18235417702', '辽宁盘锦', '其它');
INSERT INTO `t_student` VALUES ('33', '20110433', '于秀', '132', '女', '1993-06-17', '团员', '15538533615', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('34', '20110434', '张庄', '133', '男', '1993-04-30', '团员', '15935681610', '辽宁铁岭', '其它');
INSERT INTO `t_student` VALUES ('35', '20110435', '刘弟', '134', '女', '1993-06-20', '团员', '18234425267', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('36', '20110436', '卢畅', '135', '女', '1992-09-18', '团员', '13643886982', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('37', '20110437', '韩东', '136', '男', '1992-05-27', '党员', '15237120410', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('38', '20110438', '刘冰', '137', '女', '1992-03-19', '团员', '18937103023', '辽宁铁岭', '其它');
INSERT INTO `t_student` VALUES ('39', '20110439', '宋飞', '138', ' 女', '1993-05-06', '团员', '13941545488', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('40', '20110440', '王雪', '139', '女', '1993-04-18', '团员', '18241891244', '山东青岛', '其它');
INSERT INTO `t_student` VALUES ('41', '20110441', '王小岩', '140', '男', '1992-09-24', '团员', '18234475174', '辽宁盘锦', '其它');
INSERT INTO `t_student` VALUES ('42', '20110442', '谭琼', '141', '女', '1992-07-13', '团员', '15699921517', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('43', '20110443', '张宁', '142', '女', '1992-05-28', '团员', '18235412668', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('44', '20110444', '佟慧慧', '143', '女', '1992-11-23', '团员', '18235417789', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('45', '20110445', '王晓淳', '144', '女', '1992-03-22', '团员', '18397430368', '辽宁盘锦', '其它');
INSERT INTO `t_student` VALUES ('46', '20110446', '栾琨', '145', '女', '1993-10-21', '党员', '18630171129', '辽宁抚顺', '其它');
INSERT INTO `t_student` VALUES ('47', '20110447', '王楠', '146', '男', '1993-09-12', '团员', '18235400979', '山西大同', '其它');
INSERT INTO `t_student` VALUES ('48', '20110448', '胡忱', '147', '男', '1992-12-10', '团员', '18735428209', '辽宁本溪', '其它');
INSERT INTO `t_student` VALUES ('49', '20110449', '宋强', '148', '男', '1992-04-23', '团员', '18235412163', '辽宁沈阳', '其它');
INSERT INTO `t_student` VALUES ('50', '20110450', '张岚清', '149', '男', '1991-05-03', '团员', '13569845618', '辽宁丹东', '其它');
INSERT INTO `t_student` VALUES ('52', '232', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '其它');

-- ----------------------------
-- Table structure for t_studentcourse_r
-- ----------------------------
DROP TABLE IF EXISTS `t_studentcourse_r`;
CREATE TABLE `t_studentcourse_r` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int(11) DEFAULT NULL,
  `COURSE_ID` int(11) DEFAULT NULL,
  `SCORE` float DEFAULT NULL,
  `EVALUATE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_k5qbf1x2540pl0d688rvs3wqg` (`STUDENT_ID`),
  KEY `FK_58e5ph6gc09o59nma8hfmyhn2` (`COURSE_ID`),
  CONSTRAINT `FK_58e5ph6gc09o59nma8hfmyhn2` FOREIGN KEY (`COURSE_ID`) REFERENCES `t_course` (`ID`),
  CONSTRAINT `FK_k5qbf1x2540pl0d688rvs3wqg` FOREIGN KEY (`STUDENT_ID`) REFERENCES `t_student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_studentcourse_r
-- ----------------------------
INSERT INTO `t_studentcourse_r` VALUES ('1', '1', '3', '85', '好');
INSERT INTO `t_studentcourse_r` VALUES ('2', '1', '2', '90', '良');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `SEX` varchar(8) DEFAULT NULL,
  `BIRTHDAY` varchar(32) DEFAULT NULL,
  `ARRIVEDATE` varchar(32) DEFAULT NULL,
  `TELEPHONE` varchar(32) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', '孙俪', '111', '女', '1985-01-03', '2011-07-10', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('2', '邓超', '112', '男', '1980-03-09', '2008-11-20', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('3', '郑爽', '113', '女', '1983-07-11', '2010-10-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('4', '张翰', '114', '男', '1982-06-12', '2009-08-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('5', '井柏然', '115', '男', '1975-03-10', '2005-12-11', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('6', '杨洋', '116', '男', '1991-9-9', '2013-08-12', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('7', '陈伟霆', '117', '男', '1985-11-21', '2008-07-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('8', '许晴', '118', '女', '1976-06-11', '2005-06-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('9', '包贝尔', '119', '男', '1984-05-03', '2007-11-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('10', '李晨', '120', '男', '1978-11-24', '2003-08-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('11', '王祖蓝', '121', '男', '1980-01-09', '2005-06-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('12', '范冰冰', '122', '女', '1981-09-16', '2004-08-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('13', '郑凯', '123', '男', '1986-03-11', '2009-07-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('14', '陈赫', '124', '男', '1985-11-09', '2008-05-20', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('15', '马天宇', '125', '男', '1986-07-12', '2012-11-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('16', '唐嫣', '126', '女', '1983-12-06', '2009-12-11', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('17', '杨幂', '127', '女', '1986-09-12', '2012-07-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('18', '李冰冰', '128', '女', '1973-02-27', '2005-06-22', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('19', '高圆圆', '129', '女', '1979-10-05', '2009-08-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('20', '赵又廷', '130', '男', '1984-09-25', '2009-03-11', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('21', '谭维维', '131', '女', '1982-10-08', '2007-11-12', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('22', '胜利', '132', '男', '1990-12-12', '2013-11-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('23', '金秀贤', '133', '男', '1988-02-16', '2012-09-18', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('24', '全智贤', '134', '女', '1981-10-30', '2006-03-19', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('25', '刘在石', '135', '男', '1972-08-14', '1997-09-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('26', '宋智孝', '136', '女', '1981-08-15', '2007-08-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('27', '张靓颖', '137', ' 女', '1984-10-11', '2010-07-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('28', '李易峰', '138', '男', '1987-05-04', '2012-11-22', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('29', '谢娜', '139', '女', '1981-05-06', '2006-10-11', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('30', '吴昕', '140', '女', '1983-01-29', '2008-12-11', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('31', '李维嘉', '141', '男', '1976-11-04', '2006-09-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('32', '金钟国', '142', '男', '1976-04-25', '2006-09-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('33', '李光洙', '143', '男', '1985-07-14', '2010-03-09', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('34', '林志玲', '144', '女', '1973-11-29', '1998-06-19', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('35', '章泽天', '145', '女', '1990-11-18', '2014-11-16', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('36', '林俊杰', '146', '男', '1981-03-27', '2006-09-30', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('37', '周杰伦', '147', '男', '1979-01-18', '2004-07-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('38', '苏有朋', '148', '男', '1973-09-11', '2000-11-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('39', '吴奇隆', '149', '男', '1970-10-31', '1998-02-22', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('40', '袁姗姗', '150', '女', '1987-02-22', '2012-12-25', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('41', '陈晓', '151', '男', '1987-07-05', '2012-12-25', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('42', '孙杨', '152', '男', '1888-11-21', '2014-09-23', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('43', '黄雅莉', '153', '女', '1989-03-22', '2013-11-22', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('44', '刘涛', '154', '女', '1978-07-12', '2003-06-12', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('45', '张凯丽', '155', '女', '1962-09-26', '1992-08-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('46', '华晨宇', '156', '男', '1990-02-07', '2014-11-13', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('47', '郭采洁', '157', '女', '1986-02-19', '2012-03-14', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('48', '魏晨', '158', '男', '1986-02-22', '2012-03-14', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('49', '吴京', '159', '男', '1974-04-03', '2000-12-25', '18235407855', '其它');
INSERT INTO `t_teacher` VALUES ('50', '李想', '160', '女', '1981-10-26', '2011-06-27', '18235407855', '其它');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `REALNAME` varchar(32) DEFAULT NULL,
  `GENDER` varchar(8) DEFAULT NULL,
  `ADDRESS` varchar(32) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `POSTCODE` varchar(32) DEFAULT NULL,
  `MOBIL` varchar(32) DEFAULT NULL,
  `SCORE` float DEFAULT NULL,
  `BIRTHDAY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '4', '4', '4', '4', '4', '4', '4', '4', '4');
INSERT INTO `t_user` VALUES ('2', '123', '123', '4', '4', '4', '4', '4', '4', '4', '4', '4');
INSERT INTO `t_user` VALUES ('3', '456', '456', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('4', '789', '789', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('5', '147', '147', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('6', '258', '258', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('7', '369', '369', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('8', '111', '111', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('9', '222', '222', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('10', '333', '333', '6', '6', '6', '6', '8', '8', '8', '8', '8');
INSERT INTO `t_user` VALUES ('11', '444', '444', '55', '5', '5', '5', '5', '5', '5', '5', '5');
