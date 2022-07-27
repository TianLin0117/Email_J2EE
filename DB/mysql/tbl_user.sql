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

 Date: 27/04/2020 17:46:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `NAME` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `PASS` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  PRIMARY KEY (`NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

Insert into TBL_USER (name,pass) values ('abc','abc');
Insert into TBL_USER (name,pass) values ('njust','njust');
Insert into TBL_USER (name,pass) values ('sun','sun');
Insert into TBL_USER (name,pass) values ('test','test');
Insert into TBL_USER (name,pass) values ('winter','winter');
Insert into TBL_USER (name,pass) values ('°¡','a');

SET FOREIGN_KEY_CHECKS = 1;
