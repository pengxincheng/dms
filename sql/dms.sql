/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-04 18:50:28
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_applygood
-- ----------------------------
INSERT INTO `tab_applygood` VALUES ('1', '彭新成', 'A04-N426', '拖把', '2017-04-25 15:02:32', '王二', null, '2017-04-25 15:02:32', '待提交', '拖把丢了');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_building
-- ----------------------------
INSERT INTO `tab_building` VALUES ('1', '1', '2010-01-01', '2070-01-01', '许少飞', '100', '1', '1', 'A-04', '男');
INSERT INTO `tab_building` VALUES ('4', '1', '2017-04-05', '2087-04-05', '王宝强', '999', null, null, 'A-01', '男');
INSERT INTO `tab_building` VALUES ('5', '1', '2017-04-05', '2087-04-05', '王二', '21', null, null, 'A-03', '男');
INSERT INTO `tab_building` VALUES ('6', '1', '2017-04-05', '2087-04-05', '吴京', '999', null, null, 'A-02', '男');
INSERT INTO `tab_building` VALUES ('7', '2', '2017-04-06', '2087-04-06', '徐晓东', '1', null, null, 'B-01', '女');
INSERT INTO `tab_building` VALUES ('8', '2', '2017-05-04', '2087-05-04', '欧阳菁', '10', null, null, 'B-02', '女');
INSERT INTO `tab_building` VALUES ('9', '11', '2017-05-04', '2087-05-04', '徐晓东', '12', null, null, 'C-01', '男');

-- ----------------------------
-- Table structure for tab_change_room
-- ----------------------------
DROP TABLE IF EXISTS `tab_change_room`;
CREATE TABLE `tab_change_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `reasion` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `audit_opinion` varchar(500) DEFAULT NULL,
  `target_room` varchar(50) DEFAULT NULL,
  `audit_man` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_change_room
-- ----------------------------
INSERT INTO `tab_change_room` VALUES ('1', '2', '他们宿舍安静', '睡觉睡的好', '2017-04-25 16:46:12', '2017-04-25 16:43:04', '待审核', '', 'A04-N425', '王二');
INSERT INTO `tab_change_room` VALUES ('2', '2', '他们宿舍赶紧', '', '2017-04-24 20:49:06', '2017-04-25 16:06:25', '审核通过', '好的，你一天内搬过去吧', 'A04-N425', '王二');
INSERT INTO `tab_change_room` VALUES ('3', '2', '他们宿舍凉爽', '', '2017-04-24 20:49:06', '2017-04-24 20:49:06', '审核通过', '', 'A04-N425', '王二');
INSERT INTO `tab_change_room` VALUES ('4', '2', '他们宿舍打游戏', '', '2017-04-24 20:49:06', '2017-04-24 20:49:06', '审核不通过', '', 'A04-N425', '王二');
INSERT INTO `tab_change_room` VALUES ('6', '2', '测试', '测试', null, null, '待提交', null, 'A04-N425', null);

-- ----------------------------
-- Table structure for tab_check_hygiene
-- ----------------------------
DROP TABLE IF EXISTS `tab_check_hygiene`;
CREATE TABLE `tab_check_hygiene` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chack_time` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_man` varchar(50) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `describes` varchar(500) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_check_hygiene
-- ----------------------------
INSERT INTO `tab_check_hygiene` VALUES ('1', '2017-04-25 17:14:49', '1', '张三', '4', '宿舍卫生好的很', '1');
INSERT INTO `tab_check_hygiene` VALUES ('2', '2017-04-26 09:30:38', '1', '侯亮平', '4', '宿舍很干净，很整洁', '1');
INSERT INTO `tab_check_hygiene` VALUES ('3', '2017-04-26 09:31:13', '5', '李四', '2', '宿舍地上全是垃圾', '1');

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
-- Table structure for tab_register
-- ----------------------------
DROP TABLE IF EXISTS `tab_register`;
CREATE TABLE `tab_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `return_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(50) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `reasion` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_register
-- ----------------------------
INSERT INTO `tab_register` VALUES ('1', '2', '2017-04-24 16:11:24', '2017-04-24 16:11:29', '晚归', '1', '出去打球了', null);
INSERT INTO `tab_register` VALUES ('2', '2', '2017-04-24 16:11:26', '2017-04-24 16:11:29', '晚归', '1', '路上堵车了', '堵车了');
INSERT INTO `tab_register` VALUES ('5', '2', '2017-04-24 00:00:00', '2017-04-24 16:16:10', '缺勤', '1', '去同学那里了', '。。');

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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_room
-- ----------------------------
INSERT INTO `tab_room` VALUES ('1', '1', '1', '4', '啦啦啦啦啦', '4', '4', '0', 'A04-N426');
INSERT INTO `tab_room` VALUES ('3', '1', '6', '4', '优秀宿舍', '4', '0', '1', 'A02-S426');
INSERT INTO `tab_room` VALUES ('4', '2', '7', '4', '宿舍宿舍', '4', '2', '1', 'B01-N426');
INSERT INTO `tab_room` VALUES ('5', '1', '1', '6', '哈哈哈', '6', '0', '1', 'A04-N425');
INSERT INTO `tab_room` VALUES ('6', '2', '7', '4', '女生宿舍', '4', '4', '0', 'B01-N101');
INSERT INTO `tab_room` VALUES ('7', '1', '4', '4', '男寝室', '4', '0', '1', 'A01-S101');
INSERT INTO `tab_room` VALUES ('8', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S101');
INSERT INTO `tab_room` VALUES ('9', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S102');
INSERT INTO `tab_room` VALUES ('10', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S103');
INSERT INTO `tab_room` VALUES ('11', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S104');
INSERT INTO `tab_room` VALUES ('12', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S105');
INSERT INTO `tab_room` VALUES ('13', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S201');
INSERT INTO `tab_room` VALUES ('14', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S202');
INSERT INTO `tab_room` VALUES ('15', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S203');
INSERT INTO `tab_room` VALUES ('16', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S204');
INSERT INTO `tab_room` VALUES ('17', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S205');
INSERT INTO `tab_room` VALUES ('18', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S301');
INSERT INTO `tab_room` VALUES ('19', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S302');
INSERT INTO `tab_room` VALUES ('20', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S303');
INSERT INTO `tab_room` VALUES ('21', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S304');
INSERT INTO `tab_room` VALUES ('22', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S305');
INSERT INTO `tab_room` VALUES ('23', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S401');
INSERT INTO `tab_room` VALUES ('24', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S402');
INSERT INTO `tab_room` VALUES ('25', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S403');
INSERT INTO `tab_room` VALUES ('26', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S404');
INSERT INTO `tab_room` VALUES ('27', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-S405');
INSERT INTO `tab_room` VALUES ('28', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N101');
INSERT INTO `tab_room` VALUES ('29', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N102');
INSERT INTO `tab_room` VALUES ('30', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N103');
INSERT INTO `tab_room` VALUES ('31', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N104');
INSERT INTO `tab_room` VALUES ('32', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N105');
INSERT INTO `tab_room` VALUES ('33', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N201');
INSERT INTO `tab_room` VALUES ('34', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N202');
INSERT INTO `tab_room` VALUES ('35', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N203');
INSERT INTO `tab_room` VALUES ('36', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N204');
INSERT INTO `tab_room` VALUES ('37', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N205');
INSERT INTO `tab_room` VALUES ('38', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N301');
INSERT INTO `tab_room` VALUES ('39', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N302');
INSERT INTO `tab_room` VALUES ('40', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N303');
INSERT INTO `tab_room` VALUES ('41', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N304');
INSERT INTO `tab_room` VALUES ('42', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N305');
INSERT INTO `tab_room` VALUES ('43', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N401');
INSERT INTO `tab_room` VALUES ('44', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N402');
INSERT INTO `tab_room` VALUES ('45', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N403');
INSERT INTO `tab_room` VALUES ('46', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N404');
INSERT INTO `tab_room` VALUES ('47', '1', '4', '4', '男宿舍', '4', '0', '1', 'A01-N405');
INSERT INTO `tab_room` VALUES ('48', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S101');
INSERT INTO `tab_room` VALUES ('49', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S102');
INSERT INTO `tab_room` VALUES ('50', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S103');
INSERT INTO `tab_room` VALUES ('51', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S104');
INSERT INTO `tab_room` VALUES ('52', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S105');
INSERT INTO `tab_room` VALUES ('53', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S201');
INSERT INTO `tab_room` VALUES ('54', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S202');
INSERT INTO `tab_room` VALUES ('55', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S203');
INSERT INTO `tab_room` VALUES ('56', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S204');
INSERT INTO `tab_room` VALUES ('57', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-S205');
INSERT INTO `tab_room` VALUES ('58', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N101');
INSERT INTO `tab_room` VALUES ('59', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N102');
INSERT INTO `tab_room` VALUES ('60', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N103');
INSERT INTO `tab_room` VALUES ('61', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N104');
INSERT INTO `tab_room` VALUES ('62', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N105');
INSERT INTO `tab_room` VALUES ('63', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N201');
INSERT INTO `tab_room` VALUES ('64', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N202');
INSERT INTO `tab_room` VALUES ('65', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N203');
INSERT INTO `tab_room` VALUES ('66', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N204');
INSERT INTO `tab_room` VALUES ('67', '1', '6', '6', '男宿舍', '6', '0', '1', 'A02-N205');
INSERT INTO `tab_room` VALUES ('68', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S101');
INSERT INTO `tab_room` VALUES ('69', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S102');
INSERT INTO `tab_room` VALUES ('70', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S103');
INSERT INTO `tab_room` VALUES ('71', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S104');
INSERT INTO `tab_room` VALUES ('72', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S105');
INSERT INTO `tab_room` VALUES ('73', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S106');
INSERT INTO `tab_room` VALUES ('74', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S107');
INSERT INTO `tab_room` VALUES ('75', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S108');
INSERT INTO `tab_room` VALUES ('76', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S109');
INSERT INTO `tab_room` VALUES ('77', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S110');
INSERT INTO `tab_room` VALUES ('78', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S201');
INSERT INTO `tab_room` VALUES ('79', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S202');
INSERT INTO `tab_room` VALUES ('80', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S203');
INSERT INTO `tab_room` VALUES ('81', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S204');
INSERT INTO `tab_room` VALUES ('82', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S205');
INSERT INTO `tab_room` VALUES ('83', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S206');
INSERT INTO `tab_room` VALUES ('84', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S207');
INSERT INTO `tab_room` VALUES ('85', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S208');
INSERT INTO `tab_room` VALUES ('86', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S209');
INSERT INTO `tab_room` VALUES ('87', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-S210');
INSERT INTO `tab_room` VALUES ('89', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N102');
INSERT INTO `tab_room` VALUES ('90', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N103');
INSERT INTO `tab_room` VALUES ('91', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N104');
INSERT INTO `tab_room` VALUES ('92', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N105');
INSERT INTO `tab_room` VALUES ('93', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N106');
INSERT INTO `tab_room` VALUES ('94', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N107');
INSERT INTO `tab_room` VALUES ('95', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N108');
INSERT INTO `tab_room` VALUES ('96', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N109');
INSERT INTO `tab_room` VALUES ('97', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N110');
INSERT INTO `tab_room` VALUES ('98', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N201');
INSERT INTO `tab_room` VALUES ('99', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N202');
INSERT INTO `tab_room` VALUES ('100', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N203');
INSERT INTO `tab_room` VALUES ('101', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N204');
INSERT INTO `tab_room` VALUES ('102', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N205');
INSERT INTO `tab_room` VALUES ('103', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N206');
INSERT INTO `tab_room` VALUES ('104', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N207');
INSERT INTO `tab_room` VALUES ('105', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N208');
INSERT INTO `tab_room` VALUES ('106', '2', '7', '4', '女宿舍', '4', '0', '1', 'B01-N209');
INSERT INTO `tab_room` VALUES ('107', '2', '8', '4', '女宿舍', '4', '0', '1', 'B01-N210');
INSERT INTO `tab_room` VALUES ('108', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S101');
INSERT INTO `tab_room` VALUES ('109', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S102');
INSERT INTO `tab_room` VALUES ('110', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S103');
INSERT INTO `tab_room` VALUES ('111', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S104');
INSERT INTO `tab_room` VALUES ('112', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S105');
INSERT INTO `tab_room` VALUES ('113', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S106');
INSERT INTO `tab_room` VALUES ('114', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S107');
INSERT INTO `tab_room` VALUES ('115', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S108');
INSERT INTO `tab_room` VALUES ('116', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S109');
INSERT INTO `tab_room` VALUES ('117', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S110');
INSERT INTO `tab_room` VALUES ('118', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S201');
INSERT INTO `tab_room` VALUES ('119', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S202');
INSERT INTO `tab_room` VALUES ('120', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S203');
INSERT INTO `tab_room` VALUES ('121', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S204');
INSERT INTO `tab_room` VALUES ('122', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S205');
INSERT INTO `tab_room` VALUES ('123', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S206');
INSERT INTO `tab_room` VALUES ('124', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S207');
INSERT INTO `tab_room` VALUES ('125', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S208');
INSERT INTO `tab_room` VALUES ('126', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S209');
INSERT INTO `tab_room` VALUES ('127', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-S210');
INSERT INTO `tab_room` VALUES ('128', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N101');
INSERT INTO `tab_room` VALUES ('129', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N102');
INSERT INTO `tab_room` VALUES ('130', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N103');
INSERT INTO `tab_room` VALUES ('131', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N104');
INSERT INTO `tab_room` VALUES ('132', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N105');
INSERT INTO `tab_room` VALUES ('133', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N106');
INSERT INTO `tab_room` VALUES ('134', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N107');
INSERT INTO `tab_room` VALUES ('135', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N108');
INSERT INTO `tab_room` VALUES ('136', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N109');
INSERT INTO `tab_room` VALUES ('137', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N110');
INSERT INTO `tab_room` VALUES ('138', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N201');
INSERT INTO `tab_room` VALUES ('139', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N202');
INSERT INTO `tab_room` VALUES ('140', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N203');
INSERT INTO `tab_room` VALUES ('141', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N204');
INSERT INTO `tab_room` VALUES ('142', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N205');
INSERT INTO `tab_room` VALUES ('143', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N206');
INSERT INTO `tab_room` VALUES ('144', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N207');
INSERT INTO `tab_room` VALUES ('145', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N208');
INSERT INTO `tab_room` VALUES ('146', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N209');
INSERT INTO `tab_room` VALUES ('147', '2', '8', '6', '女宿舍', '6', '0', '1', 'B02-N210');
INSERT INTO `tab_room` VALUES ('148', '11', '9', '6', '男生宿舍', '6', '0', '1', 'C01-N101');

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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO `tab_user` VALUES ('1', '', '张三', '男', '21', null, null, null, '1', 'admin', 'gdyb21LQTcIANtvYMT7QVQ==', null, '1', '1', '1', null);
INSERT INTO `tab_user` VALUES ('2', '201316920422', '彭新成', '男', '21', '2013级', '软件1302', '1', '3', '201316920422', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '1', '1', '1');
INSERT INTO `tab_user` VALUES ('3', null, '许少飞', '男', '40', null, null, '1', '2', 'manager', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '1', '1', '1');
INSERT INTO `tab_user` VALUES ('12', '201116040124', '李雨环', '男', '21', '2013', '软件1101', null, '3', '201116040124', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('13', '201216040102', '王文秋', '男', '21', '2013', '软件1201', null, '3', '201216040102', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('14', '201216040104', '张亚鹏', '男', '21', '2013', '软件1201', null, '3', '201216040104', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('15', '201316040101', '李展旭', '男', '21', '2013', '软件1301', null, '3', '201316040101', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('16', '201316920101', '黄卫东', '男', '21', '2013', '软件1301', null, '3', '201316920101', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('17', '201316920102', '尚金奎', '男', '21', '2013', '软件1301', null, '3', '201316920102', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('18', '201316920103', '郭云浩', '男', '21', '2013', '软件1301', null, '3', '201316920103', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('19', '201316920104', '王亚南', '男', '21', '2013', '软件1301', null, '3', '201316920104', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('20', '201316920106', '林文浩', '男', '21', '2013', '软件1301', null, '3', '201316920106', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('21', '201316920107', '王雷栋', '男', '21', '2013', '软件1301', null, '3', '201316920107', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('22', '201316920108', '柴方博', '男', '21', '2013', '软件1301', null, '3', '201316920108', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('23', '201316920110', '侯万万', '男', '21', '2013', '软件1301', null, '3', '201316920110', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('24', '201316920112', '杨旭浩', '男', '21', '2013', '软件1301', null, '3', '201316920112', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('25', '201316920113', '胡志旺', '男', '21', '2013', '软件1301', null, '3', '201316920113', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('26', '201316920114', '廖文哲', '男', '21', '2013', '软件1301', null, '3', '201316920114', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('27', '201316920115', '郭昊', '男', '21', '2013', '软件1301', null, '3', '201316920115', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('28', '201316920116', '黄帅', '男', '21', '2013', '软件1301', null, '3', '201316920116', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('29', '201316920118', '武星', '男', '21', '2013', '软件1301', null, '3', '201316920118', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('30', '201316920120', '张宗波', '男', '21', '2013', '软件1301', null, '3', '201316920120', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('31', '201316920121', '杨志君', '男', '21', '2013', '软件1301', null, '3', '201316920121', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('32', '201316920122', '张广武', '男', '21', '2013', '软件1301', null, '3', '201316920122', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('33', '201316920123', '母召', '男', '21', '2013', '软件1301', null, '3', '201316920123', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('34', '201316920124', '万莹', '男', '21', '2013', '软件1301', null, '3', '201316920124', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('35', '201316920125', '李超', '男', '21', '2013', '软件1301', null, '3', '201316920125', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('36', '201316920126', '理金龙', '男', '21', '2013', '软件1301', null, '3', '201316920126', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('37', '201316920127', '赵凯文', '女', '21', '2013', '软件1301', null, '3', '201316920127', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '6', '1');
INSERT INTO `tab_user` VALUES ('38', '201316920129', '李晓乐', '女', '21', '2013', '软件1301', null, '3', '201316920129', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '6', '1');
INSERT INTO `tab_user` VALUES ('39', '201316920130', '徐路路', '女', '21', '2013', '软件1301', null, '3', '201316920130', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '6', '1');
INSERT INTO `tab_user` VALUES ('40', '201316920202', '尹华涛', '男', '21', '2013', '软件1301', null, '3', '201316920202', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('41', '201316920204', '胡志俊', '男', '21', '2013', '软件1301', null, '3', '201316920204', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('42', '201316920205', '王召建', '男', '21', '2013', '软件1301', null, '3', '201316920205', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('43', '201316920206', '张凯', '男', '21', '2013', '软件1302', null, '3', '201316920206', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('44', '201316920208', '周金龙', '男', '21', '2013', '软件1302', null, '3', '201316920208', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('45', '201316920210', '沈红彬', '男', '21', '2013', '软件1302', null, '3', '201316920210', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('46', '201316920211', '王翌帆', '男', '21', '2013', '软件1302', null, '3', '201316920211', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('47', '201316920215', '张因鹏', '男', '21', '2013', '软件1302', null, '3', '201316920215', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('48', '201316920216', '邵亚坤', '男', '21', '2013', '软件1302', null, '3', '201316920216', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('49', '201316920217', '周密', '男', '21', '2013', '软件1302', null, '3', '201316920217', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('50', '201316920218', '傅锐', '男', '21', '2013', '软件1302', null, '3', '201316920218', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('51', '201316920219', '郝亚军', '男', '21', '2013', '软件1302', null, '3', '201316920219', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('52', '201316920220', '周宇', '男', '21', '2013', '软件1302', null, '3', '201316920220', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('53', '201316920221', '陈浩', '男', '21', '2013', '软件1302', null, '3', '201316920221', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('54', '201316920222', '陈哲', '男', '21', '2013', '软件1302', null, '3', '201316920222', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('55', '201316920223', '吴明超', '男', '21', '2013', '软件1302', null, '3', '201316920223', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('56', '201316920224', '张长胜', '男', '21', '2013', '软件1302', null, '3', '201316920224', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('57', '201316920225', '王小康', '男', '21', '2013', '软件1302', null, '3', '201316920225', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('58', '201316920301', '王新闯', '男', '21', '2013', '软件1305', null, '3', '201316920301', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('59', '201316920302', '李城', '男', '21', '2013', '软件1305', null, '3', '201316920302', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('60', '201316920304', '李继宇', '男', '21', '2013', '软件1305', null, '3', '201316920304', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('61', '201316920305', '杨超', '男', '21', '2013', '软件1305', null, '3', '201316920305', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('62', '201316920306', '马向苗', '男', '21', '2013', '软件1305', null, '3', '201316920306', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('63', '201316920307', '陆书航', '男', '21', '2013', '软件1305', null, '3', '201316920307', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('64', '201316920308', '马骁尧', '男', '21', '2013', '软件1305', null, '3', '201316920308', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('65', '201316920309', '王增辉', '男', '21', '2013', '软件1305', null, '3', '201316920309', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('66', '201316920310', '陈辉', '男', '21', '2013', '软件1305', null, '3', '201316920310', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('67', '201316920312', '王飞飞', '男', '21', '2013', '软件1305', null, '3', '201316920312', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('68', '201316920313', '钟军毅', '男', '21', '2013', '软件1305', null, '3', '201316920313', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('69', '201316920314', '郭嵩浩', '男', '21', '2013', '软件1305', null, '3', '201316920314', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('70', '201316920315', '邢志鹏', '男', '21', '2013', '软件1305', null, '3', '201316920315', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('71', '201316920316', '周亚辉', '男', '21', '2013', '软件1305', null, '3', '201316920316', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('72', '201316920317', '朱武威', '男', '21', '2013', '软件1305', null, '3', '201316920317', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('73', '201316920319', '庄建伟', '男', '21', '2013', '软件1305', null, '3', '201316920319', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('74', '201316920321', '李波', '男', '21', '2013', '软件1305', null, '3', '201316920321', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('75', '201316920322', '王献昭', '男', '21', '2013', '软件1305', null, '3', '201316920322', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('76', '201316920323', '李征', '男', '21', '2013', '软件1305', null, '3', '201316920323', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('77', '201316920324', '庞保亮', '男', '21', '2013', '软件1305', null, '3', '201316920324', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('78', '201316920327', '赵冰琪', '女', '21', '2013', '软件1305', null, '3', '201316920327', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '6', '1');
INSERT INTO `tab_user` VALUES ('79', '201316920329', '刘欢', '女', '21', '2013', '软件1305', null, '3', '201316920329', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '4', '1');
INSERT INTO `tab_user` VALUES ('80', '201316920401', '张念忠', '男', '21', '2013', '软件1303', null, '3', '201316920401', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('81', '201316920402', '刘懿宽', '男', '21', '2013', '软件1302', null, '3', '201316920402', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('82', '201316920403', '唐林', '男', '21', '2013', '软件1302', null, '3', '201316920403', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('83', '201316920404', '李永涛', '男', '21', '2013', '软件1303', null, '3', '201316920404', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('84', '201316920406', '王洋洋', '男', '21', '2013', '软件1302', null, '3', '201316920406', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('85', '201316920408', '段保涛', '男', '21', '2013', '软件1302', null, '3', '201316920408', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('86', '201316920409', '慕汇源', '男', '21', '2013', '软件1302', null, '3', '201316920409', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('87', '201316920411', '陶海强', '男', '21', '2013', '软件1303', null, '3', '201316920411', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('88', '201316920412', '雷嘉华', '男', '21', '2013', '软件1302', null, '3', '201316920412', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('89', '201316920413', '王浩浩', '男', '21', '2013', '软件1305', null, '3', '201316920413', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('90', '201316920414', '徐华伟', '男', '21', '2013', '软件1303', null, '3', '201316920414', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('91', '201316920415', '张建伟', '男', '21', '2013', '软件1303', null, '3', '201316920415', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('92', '201316920416', '张冶', '男', '21', '2013', '软件1305', null, '3', '201316920416', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('93', '201316920417', '滕小浩', '男', '21', '2013', '软件1303', null, '3', '201316920417', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('94', '201316920418', '徐赛赛', '男', '21', '2013', '软件1302', null, '3', '201316920418', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('95', '201316920419', '王磊', '男', '21', '2013', '软件1302', null, '3', '201316920419', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('96', '201316920420', '陈贵龙', '男', '21', '2013', '软件1302', null, '3', '201316920420', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('97', '201316920423', '徐名扬', '男', '21', '2013', '软件1303', null, '3', '201316920423', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('98', '201316920424', '熊凤武', '男', '21', '2013', '软件1302', null, '3', '201316920424', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('99', '201316920425', '李世杰', '男', '21', '2013', '软件1303', null, '3', '201316920425', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('100', '201316920426', '秦田甜', '女', '21', '2013', '软件1303', null, '3', '201316920426', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '4', '1');
INSERT INTO `tab_user` VALUES ('101', '201316920427', '关健', '女', '21', '2013', '软件1302', null, '3', '201316920427', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('102', '201316920428', '郑菲菲', '女', '21', '2013', '软件1302', null, '3', '201316920428', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('103', '201316920429', '勇智雯', '女', '21', '2013', '软件1302', null, '3', '201316920429', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('104', '201316920501', '郭付杰', '男', '21', '2013', '软件1303', null, '3', '201316920501', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('105', '201316920502', '杨帅贤', '男', '21', '2013', '软件1303', null, '3', '201316920502', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('106', '201316920503', '张春伟', '男', '21', '2013', '软件1303', null, '3', '201316920503', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('107', '201316920504', '吴照振', '男', '21', '2013', '软件1303', null, '3', '201316920504', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('108', '201316920506', '娄金亮', '男', '21', '2013', '软件1303', null, '3', '201316920506', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('109', '201316920507', '陈俊亘', '男', '21', '2013', '软件1304', null, '3', '201316920507', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('110', '201316920508', '杜康', '男', '21', '2013', '软件1303', null, '3', '201316920508', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('111', '201316920509', '臧天才', '男', '21', '2013', '软件1303', null, '3', '201316920509', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('112', '201316920511', '翟开放', '男', '21', '2013', '软件1303', null, '3', '201316920511', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('113', '201316920512', '秦广哲', '男', '21', '2013', '软件1303', null, '3', '201316920512', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('114', '201316920513', '郑洪建', '男', '21', '2013', '软件1303', null, '3', '201316920513', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('115', '201316920514', '王保华', '男', '21', '2013', '软件1303', null, '3', '201316920514', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('116', '201316920515', '罗刚龙', '男', '21', '2013', '软件1303', null, '3', '201316920515', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('117', '201316920516', '吴凯伟', '男', '21', '2013', '软件1303', null, '3', '201316920516', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('118', '201316920518', '李思稳', '男', '21', '2013', '软件1303', null, '3', '201316920518', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('119', '201316920521', '易先进', '男', '21', '2013', '软件1303', null, '3', '201316920521', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('120', '201316920526', '郝瑞敏', '女', '21', '2013', '软件1303', null, '3', '201316920526', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('121', '201316920527', '李丽莎', '女', '21', '2013', '软件1303', null, '3', '201316920527', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('122', '201316920528', '习媛玲', '女', '21', '2013', '软件1303', null, '3', '201316920528', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('123', '201316920529', '钱双双', '女', '21', '2013', '软件1303', null, '3', '201316920529', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('124', '201316920601', '刘世琦', '男', '21', '2013', '软件1304', null, '3', '201316920601', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('125', '201316920602', '刘帅洲', '男', '21', '2013', '软件1304', null, '3', '201316920602', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('126', '201316920603', '姚俊博', '男', '21', '2013', '软件1304', null, '3', '201316920603', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('127', '201316920605', '薛云龙', '男', '21', '2013', '软件1304', null, '3', '201316920605', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('128', '201316920607', '苏又山', '男', '21', '2013', '软件1304', null, '3', '201316920607', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('129', '201316920608', '王宁伟', '男', '21', '2013', '软件1304', null, '3', '201316920608', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('130', '201316920611', '赵朋亚', '男', '21', '2013', '软件1304', null, '3', '201316920611', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('131', '201316920612', '岳银涛', '男', '21', '2013', '软件1304', null, '3', '201316920612', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('132', '201316920615', '朱鑫磊', '男', '21', '2013', '软件1304', null, '3', '201316920615', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('133', '201316920616', '姜海波', '男', '21', '2013', '软件1304', null, '3', '201316920616', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('134', '201316920618', '王永森', '男', '21', '2013', '软件1304', null, '3', '201316920618', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('135', '201316920622', '张松晚', '男', '21', '2013', '软件1304', null, '3', '201316920622', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('136', '201316920623', '杨雨朋', '男', '21', '2013', '软件1304', null, '3', '201316920623', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('137', '201316920624', '陈海举', '男', '21', '2013', '软件1304', null, '3', '201316920624', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('138', '201316920625', '吴金灿', '男', '21', '2013', '软件1304', null, '3', '201316920625', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('139', '201316920626', '江鸣慧', '女', '21', '2013', '软件1304', null, '3', '201316920626', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('140', '201316920627', '高佳伟', '女', '21', '2013', '软件1304', null, '3', '201316920627', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('141', '201316920628', '赵亚鲜', '女', '21', '2013', '软件1304', null, '3', '201316920628', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('142', '201316920629', '贾子瑶', '女', '21', '2013', '软件1304', null, '3', '201316920629', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('143', '201316920701', '刘纪林', '男', '21', '2013', '软件1305', null, '3', '201316920701', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('144', '201316920702', '杨忠信', '男', '21', '2013', '软件1304', null, '3', '201316920702', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('145', '201316920703', '尹真杰', '男', '21', '2013', '软件1305', null, '3', '201316920703', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('146', '201316920705', '张楠', '男', '21', '2013', '软件1304', null, '3', '201316920705', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('147', '201316920706', '许晓东', '男', '21', '2013', '软件1304', null, '3', '201316920706', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('148', '201316920711', '张立新', '男', '21', '2013', '软件1305', null, '3', '201316920711', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('149', '201316920720', '赵富午', '男', '21', '2013', '软件1304', null, '3', '201316920720', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('150', '201316920721', '霍光恩', '男', '21', '2013', '软件1304', null, '3', '201316920721', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('151', '201316920727', '韩璐璐', '女', '21', '2013', '软件1304', null, '3', '201316920727', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('152', '201316920728', '赵瑞芝', '女', '21', '2013', '软件1304', null, '3', '201316920728', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('153', '201316920729', '何淑宁', '女', '21', '2013', '软件1304', null, '3', '201316920729', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null, null, null, '0');
INSERT INTO `tab_user` VALUES ('155', null, '赵丽颖', '女', '28', null, null, null, '2', 'zhaoliying', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '7', '4', '1');
INSERT INTO `tab_user` VALUES ('157', null, '王宝强', '男', '35', null, null, null, '2', 'wangbaoqiang', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '4', '7', '1');
INSERT INTO `tab_user` VALUES ('158', null, '吴京', '男', '36', null, null, null, '2', 'wujing', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '1', '6', '48', '1');
INSERT INTO `tab_user` VALUES ('159', null, '欧阳菁', '女', '39', null, null, null, '2', 'ouyangjing', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '2', '8', '107', '1');
INSERT INTO `tab_user` VALUES ('160', null, '徐晓东', '男', '37', null, null, null, '2', 'xuxiaodong', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '11', '9', '148', '1');

-- ----------------------------
-- Table structure for tab_visit_enregister
-- ----------------------------
DROP TABLE IF EXISTS `tab_visit_enregister`;
CREATE TABLE `tab_visit_enregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `visit_reasion` varchar(200) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `is_leave` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_visit_enregister
-- ----------------------------
INSERT INTO `tab_visit_enregister` VALUES ('1', '王林', '男', '13011230320', '2017-04-20 08:06:20', '2017-04-20 11:06:20', '找同学', '', '1', '已离开');
INSERT INTO `tab_visit_enregister` VALUES ('2', '李达康', '男', '13011255588', '2017-04-20 10:30:18', '2017-04-20 11:00:30', null, '京州市市委书记', '1', '已离开');
INSERT INTO `tab_visit_enregister` VALUES ('4', '季昌明', '男', '15738865718', '2017-04-20 10:20:20', '2017-04-20 10:58:20', '来看儿子', '检察长', '1', '未离开');
INSERT INTO `tab_visit_enregister` VALUES ('6', '陈海', '男', '13011255588', '2017-04-20 11:09:47', '2017-04-20 11:09:47', '来看小皮球啦', '反贪局长', '1', '未离开');
INSERT INTO `tab_visit_enregister` VALUES ('9', '高玉良', '男', '12345698778', '2017-04-20 11:23:54', null, '看儿子', '', '1', '未离开');
SET FOREIGN_KEY_CHECKS=1;
