DROP DATABASE IF EXISTS ssh;
CREATE DATABASE ssh DEFAULT CHARSET=gbk;

use ssh;


SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `adminname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����Ա',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
INSERT INTO `admin` VALUES ('1007092141', '������', '1007092141');
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(4) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1007092141', '��', '����', '23');
INSERT INTO `user` VALUES ('1007092152', '��', '����', '23');
INSERT INTO `user` VALUES ('1007092160', '��', '��', '22');
-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `bookName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('001', 'Core Java', 'HR', 'HR', '0', '�ѽ��');
INSERT INTO `book` VALUES ('002', 'JavaEE', 'hr', 'HR', '25', '�ѽ��');
INSERT INTO `book` VALUES ('004', 'MySQL', 'HR', 'HR', '30', '�ѽ��');