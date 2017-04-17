/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-17 17:51:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tab_applygood
-- ----------------------------
DROP TABLE IF EXISTS `tab_applygood`;
CREATE TABLE `tab_applygood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyer` varchar(50) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `good` varchar(200) DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `audit_man` varchar(50) DEFAULT NULL,
  `audit_opinion` varchar(500) DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_applygood
-- ----------------------------
INSERT INTO `tab_applygood` VALUES ('1', '彭新成', 'A04-N426', '拖把', '2017-04-17 15:56:58', '王二', null, '2017-04-14 17:33:13', '待提交', '原来的拖把坏了');
INSERT INTO `tab_applygood` VALUES ('2', '彭新成', 'A04-N426', '扫把', '2017-04-17 12:17:12', '王二', '', '2017-04-17 12:17:19', '审核通过', '原来的坏了');
INSERT INTO `tab_applygood` VALUES ('3', '彭新成', 'A04-N426', '扫把', '2017-04-14 17:40:44', '王二', '同意，来领吧', '2017-04-14 17:40:44', '审核通过', '原来的坏了');
INSERT INTO `tab_applygood` VALUES ('4', '彭新成', 'A04-N426', '扫把', '2017-04-14 17:42:47', '王二', '不同意', '2017-04-14 17:42:47', '审核不通过', '原来的坏了');
INSERT INTO `tab_applygood` VALUES ('5', '彭新成', 'A04-N426', '拖把', '2017-04-17 12:17:39', '王二', '上周你们宿舍才领取了一个', '2017-04-17 14:45:10', '审核不通过', '原来的拖把坏了');
INSERT INTO `tab_applygood` VALUES ('8', '彭新成', 'A04-N426', '垃圾篓', '2017-04-17 16:07:02', '王二', null, '2017-04-17 15:53:58', '待审核', '没有垃圾篓');
INSERT INTO `tab_applygood` VALUES ('11', '彭新成', 'A04-N426', '额威威', '2017-04-17 16:04:59', '王二', null, '2017-04-17 15:36:02', '待提交', '额我发');

-- ----------------------------
-- Table structure for tab_area
-- ----------------------------
DROP TABLE IF EXISTS `tab_area`;
CREATE TABLE `tab_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) DEFAULT NULL,
  `build_time` date DEFAULT NULL,
  `area_describe` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_area
-- ----------------------------
INSERT INTO `tab_area` VALUES ('1', 'A区', '2010-03-01', '学生宿舍A区');
INSERT INTO `tab_area` VALUES ('2', 'B区', '2010-03-01', '学生宿舍B区');
INSERT INTO `tab_area` VALUES ('4', 'D区', '2010-03-01', '学生宿舍D区');
INSERT INTO `tab_area` VALUES ('5', 'E区', '2010-03-01', '学生宿舍E区');
INSERT INTO `tab_area` VALUES ('6', 'F区', '2010-03-01', '学生宿舍F区');
INSERT INTO `tab_area` VALUES ('7', 'G区', '2010-03-01', '学生宿舍G区');
INSERT INTO `tab_area` VALUES ('11', 'C区', '2017-04-05', '学生宿舍C区');

-- ----------------------------
-- Table structure for tab_building
-- ----------------------------
DROP TABLE IF EXISTS `tab_building`;
CREATE TABLE `tab_building` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `manager_name` varchar(11) DEFAULT NULL,
  `total_stu_num` int(11) DEFAULT NULL,
  `current_stu_num` int(11) DEFAULT NULL,
  `is_full` varchar(10) DEFAULT NULL,
  `building_name` varchar(255) DEFAULT NULL,
  `introduct` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_building
-- ----------------------------
INSERT INTO `tab_building` VALUES ('1', '1', '2010-01-01', '2070-01-01', '王二', '100', '90', '1', 'A-04', '男生宿舍');
INSERT INTO `tab_building` VALUES ('4', '1', '2017-04-05', '2087-04-05', '王二', '999', null, null, 'A-01', '11111');
INSERT INTO `tab_building` VALUES ('5', '1', '2017-04-05', '2087-04-05', '王二', '21', null, null, 'A-03', '女生宿舍');
INSERT INTO `tab_building` VALUES ('6', '1', '2017-04-05', '2087-04-05', '王二', '999', null, null, 'A-02', '男生宿舍');
INSERT INTO `tab_building` VALUES ('7', '2', '2017-04-06', '2087-04-06', '王二', '1', null, null, 'B-01', '111');

-- ----------------------------
-- Table structure for tab_notify
-- ----------------------------
DROP TABLE IF EXISTS `tab_notify`;
CREATE TABLE `tab_notify` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_title` varchar(300) DEFAULT NULL,
  `notify_content` varchar(6000) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_notify
-- ----------------------------
INSERT INTO `tab_notify` VALUES ('1', '5月30日晚上7点2017届毕业晚会', '5月30日晚上7点2017届毕业晚会', '3', '2017-03-06 11:13:40', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('2', '6月15日全体毕业生离校', '6月15日全体毕业生离校', '3', '2017-03-06 11:13:42', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('3', '小明同学捡到校园卡一张', '小明同学捡到校园卡一张', '3', '2017-03-06 11:13:47', null, 'swzl');
INSERT INTO `tab_notify` VALUES ('5', '测试标题', '<div style=\"text-align: center;\"><font face=\"宋体\" size=\"5\"><b>测试标题</b></font></div>', '1', '2017-03-27 22:53:55', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('6', '123', '<ol><li>123<br></li><li>的出发点是</li><li>dsf dfs胜多负少</li><li>的说法是否</li></ol><div>的说法都是</div><!-- custom html data -->', '1', '2017-03-15 17:33:02', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('8', '万绮雯耳根闻', '而额外给惹火热个人和热好热很推荐热狗她会二个人和', '1', '2017-03-14 19:32:16', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('9', '度多喝水', '第三方第三方是', '1', '2017-03-14 19:35:07', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('10', '度多喝水', '第三方第三方是', '1', '2017-03-14 19:35:07', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('11', '走四方', '法定sign发给好加热好偶尔玩飞机富翁 欧迪芬凯哥自己二级 偶然经过加热管好竟然敢好哦热歌开个物品 绕哈鸡儿好 肉儿童加绒二级 蓉儿推荐人 邒；里面 我感觉如何 偶尔我就贴我那边配空调光荣配件 偶尔他恐怕人家个', '1', '2017-03-16 23:02:06', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('12', '小红捡到一张洗澡卡', '&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 下少弄点说过话不能 费打击报复<!-- custom html data --><div><ol><li>负担部分都<br></li><li>地方vnfjkd</li></ol><div>放到女方对你</div></div><div>法定vfdijb飞、d法定VB好ofdjfdjgerhgoi vefiohgoierhg8大四居高好工具好of多几个人 &nbsp;</div>', '1', '2017-03-19 23:31:21', null, 'swzl');
INSERT INTO `tab_notify` VALUES ('13', '3月16号K878淄博到菏泽遗失钱包一个', '<!-- custom html data --><!-- custom html data --><!-- custom html data --><!-- custom html data --><!-- custom html data --><!-- custom html data --><!-- custom html data --><!-- custom html data --><table cellpadding=\"0\" cellspacing=\"0\" style=\"color: rgb(102, 102, 102); font-family: arial, sans-serif; line-height: 24px; widows: 1; table-layout: fixed; margin-bottom: 5px; width: 704px; font-size: 11pt; background-image: url(&quot;/images/sy.png&quot;); background-position: 110px 100%; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;\"><tbody><tr><td colspan=\"4\" valign=\"top\" style=\"word-wrap: break-word; width: 484px; line-height: 25px; padding: 5px 5px 5px 10px; word-break: break-all; background-color: rgb(242, 252, 235);\">本人在3月16号K878淄博到菏泽的火车上遗失钱包一个，内有邓丽玉身份证一张，银行卡4张，住宿发票及购物收据，无现金，望捡到者和我联系，万分感谢！</td><td valign=\"top\"></td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>酬谢方式：</em>&nbsp;</td><td colspan=\"5\" style=\"color: red;\">通过失物招领平台发布感谢信+酬金[200]</td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>丢失地点：</em>&nbsp;</td><td colspan=\"3\">山东 菏泽市 牡丹区 K878 05车17上铺</td><td colspan=\"2\" rowspan=\"6\" style=\"word-break: break-all; padding-top: 1px;\"></td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>丢失时间：</em>&nbsp;</td><td colspan=\"3\">2017-03-20 04:20</td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>联系地址：</em>&nbsp;</td><td colspan=\"3\">山东 菏泽市 牡丹区 山东省菏泽市</td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>联系人：</em>&nbsp;</td><td>心梦无痕</td><td align=\"right\"><em>手机：</em>&nbsp;</td><td>1509484****</td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>E-mail：</em>&nbsp;</td><td>****@qq.com</td><td align=\"right\"><em>座机：</em>&nbsp;</td><td></td></tr><tr><td align=\"right\" style=\"height: 30px;\"><em>MSN：</em>&nbsp;</td><td></td><td align=\"right\"><em>QQ：</em>&nbsp;</td><td>3637660****</td></tr></tbody></table>\n                                        <!-- custom html data -->', '1', '2017-03-24 17:01:57', null, 'swzl');
INSERT INTO `tab_notify` VALUES ('20', '丢失手机', '<!-- custom html data -->烦不烦关闭覅金额外任何裂缝华为<div>符合晚饭后如何如何</div><div><b>房价大概一日而过 仍将二极管让那个风日俄跟家人<i>仍热几个仍荣溶解和软件和 二哥里偶尔你还热过几天你哦人工IE环境我二姐二维码GV</i></b></div>', '1', '2017-03-21 17:31:09', null, 'tzgg');
INSERT INTO `tab_notify` VALUES ('21', '丢失手机', '<!-- custom html data -->烦不烦关闭覅金额外任何裂缝华为<div>符合晚饭后如何如何</div><div><b>房价大概一日而过 仍将二极管让那个风日俄跟家人<i>仍热几个仍荣溶解和软件和 二哥里偶尔你还热过几天你哦人工IE环境我二姐二维码GV</i></b></div>', '1', '2017-03-21 17:32:23', null, 'swzl');
INSERT INTO `tab_notify` VALUES ('22', 'weqw', null, '1', '2017-04-04 00:50:32', null, null);

-- ----------------------------
-- Table structure for tab_repair
-- ----------------------------
DROP TABLE IF EXISTS `tab_repair`;
CREATE TABLE `tab_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporter` varchar(100) DEFAULT NULL,
  `report_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `repair_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `problem_des` varchar(500) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `deal_man` varchar(100) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_repair
-- ----------------------------
INSERT INTO `tab_repair` VALUES ('1', '彭新成', '2017-04-14 10:13:41', '2017-04-14 11:41:49', '宿舍灯坏了', 'A区04座A04-N426', '王二', '已修理');
INSERT INTO `tab_repair` VALUES ('2', '彭新成', '2017-04-14 10:13:43', '2017-04-14 10:13:43', '宿舍水龙头坏了', 'A区04座A04-N426', '王二', '已修理');
INSERT INTO `tab_repair` VALUES ('3', '彭新成', '2017-04-14 11:14:27', '2017-04-17 09:19:00', '宿舍灯坏了', 'A区04座A04-N426', '王二', '已修理');
INSERT INTO `tab_repair` VALUES ('4', '彭新成', '2017-04-14 11:32:40', '2017-04-14 13:50:09', '桌子坏了', 'A区04座A04-N426', '王二', '已修理');
INSERT INTO `tab_repair` VALUES ('5', '彭新成', null, null, '凳子坏了', 'A区04座A04-N426', null, '待提交');
INSERT INTO `tab_repair` VALUES ('6', '彭新成', '2017-04-14 11:33:26', '2017-04-14 13:44:56', '玻璃烂了', 'A区04座A04-N426', '王二', '已修理');
INSERT INTO `tab_repair` VALUES ('7', '彭新成', '2017-04-17 15:00:54', '2017-04-17 15:00:53', '灯坏了', 'A区04座A04-N426', '王二', '待修理');
INSERT INTO `tab_repair` VALUES ('8', '彭新成', null, null, '垃圾篓', 'A区04座A04-N426', null, '待提交');

-- ----------------------------
-- Table structure for tab_room
-- ----------------------------
DROP TABLE IF EXISTS `tab_room`;
CREATE TABLE `tab_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `introduct` varchar(500) DEFAULT NULL,
  `totalNum` int(11) DEFAULT NULL,
  `currentNum` int(11) DEFAULT NULL,
  `isFiled` varchar(20) DEFAULT NULL,
  `room_sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_room
-- ----------------------------
INSERT INTO `tab_room` VALUES ('1', '1', '1', '4', '啦啦啦啦啦', '4', '4', '0', 'A04-N426');
INSERT INTO `tab_room` VALUES ('3', '1', '6', '4', '优秀宿舍', '4', '0', '1', 'A02-S426');
INSERT INTO `tab_room` VALUES ('4', '2', '7', '4', '宿舍宿舍', '4', '0', '1', 'B01-N426');

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_no` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `stu_grade` varchar(50) DEFAULT NULL,
  `stu_class` varchar(50) DEFAULT NULL,
  `dorm_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `stu_img` varchar(100) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `is_alloted` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES ('1', '', '张三', '男', '21', null, null, null, '1', 'admin', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, null);
INSERT INTO `tab_user` VALUES ('2', '201316920422', '彭新成', '男', '21', '2013级', '软件1302', '1', '3', '201316920422', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '1', '1', '1');
INSERT INTO `tab_user` VALUES ('3', null, '王二', '女', '40', null, null, '1', '2', 'manager', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '1', '1', '1');
INSERT INTO `tab_user` VALUES ('4', '201316920419', '徐赛赛', '男', '22', '2013级', '软件1302', null, '3', '201316920419', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('6', '201316920422', '王磊', '男', '22', '2013级', '软件1302', null, '3', '201316920422', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');

-- ----------------------------
-- Table structure for tab_visit_enregister
-- ----------------------------
DROP TABLE IF EXISTS `tab_visit_enregister`;
CREATE TABLE `tab_visit_enregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gander` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `visit_reasion` varchar(200) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_visit_enregister
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
