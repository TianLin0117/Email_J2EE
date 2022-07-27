/*
 Navicat Premium Data Transfer

 Source Server         : sms
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : sms

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 27/04/2020 17:47:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`  (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOTE` varchar(200) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `SENDUNAME` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `RECEIVEUNAME` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `POSTTIME` datetime(0) NOT NULL,
  `READSIGN` decimal(1, 0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------
INSERT INTO `tbl_message` VALUES (NULL, '最近怎么样啊？', 'njust', 'abc', '2016-08-15 00:00:00', 1);
INSERT INTO `tbl_message` VALUES (NULL, '我们好久没聚了，啥时候有空出来，我请你吃饭！', 'njust', 'abc', '2016-08-16 00:00:00', 1);
INSERT INTO `tbl_message` VALUES (NULL, 'a', 'njust', '啊', '2016-08-17 00:00:00', 1);
INSERT INTO `tbl_message` VALUES (NULL, '你好，我们交朋友吧', 'winter', 'njust', '2016-08-27 00:00:00', 0);
INSERT INTO `tbl_message` VALUES (NULL, '上次你提出的那个问题，我想明白了，有时间过来探讨一下。', 'sun', 'njust', '2016-08-27 00:00:00', 1);
INSERT INTO `tbl_message` VALUES (NULL, '好的，下周末我过去你那。', 'njust', 'sun', '2016-08-27 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
