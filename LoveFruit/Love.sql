/*
 Navicat MySQL Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : Love

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/04/2019 14:11:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Root
-- ----------------------------
DROP TABLE IF EXISTS `Root`;
CREATE TABLE `Root` (
  `rid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) NOT NULL,
  `adminPassWord` varchar(20) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Root
-- ----------------------------
BEGIN;
INSERT INTO `Root` VALUES (0000000001, 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid_c` int(30) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `pid` varchar(40) DEFAULT NULL,
  `uid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cid_c`),
  KEY `uid` (`uid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(30) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('0', '天天满鲜');
INSERT INTO `category` VALUES ('1', '热门水果');
INSERT INTO `category` VALUES ('2', '新鲜蔬菜');
INSERT INTO `category` VALUES ('3', '油盐酱醋');
INSERT INTO `category` VALUES ('4', '美味海鲜');
INSERT INTO `category` VALUES ('5', '速食冷冻');
INSERT INTO `category` VALUES ('6', '调料厨具');
INSERT INTO `category` VALUES ('7', '日用百货');
COMMIT;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `quantity` int(20) DEFAULT NULL,
  `total` double(30,2) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `pid` (`pid`),
  KEY `oid` (`oid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
BEGIN;
INSERT INTO `orderitem` VALUES ('0C5A2DDE3D7848C09EF31F9335BF0703', 2, 40.00, '1', '94EA99E5F9214500A57738DC847BF31A');
INSERT INTO `orderitem` VALUES ('122580532DFA4985ACAEFDE4292C1B85', 1, 25.00, 'qwe', '6B354DD624404AE6A35704A0D1F180A5');
INSERT INTO `orderitem` VALUES ('12A10CFB0FD045AA872EE3D4F28DB961', 1, 14.00, 'asd', 'AF2013AA8AC64890AAEFD4ED211833F2');
INSERT INTO `orderitem` VALUES ('13A6BAA32C6943DB8FBDC4827E49F014', 1, 25.00, 'qwe', '94EA99E5F9214500A57738DC847BF31A');
INSERT INTO `orderitem` VALUES ('14D4385464DF4152A32038F4AEB0637F', 1, 25.00, 'qwe', 'BEE35A27AC72421A8D150C8563991275');
INSERT INTO `orderitem` VALUES ('35DE51DAF0E54322887A4718CD2ECA04', 2, 40.00, '1', '955C243145974854A0A7BFC48F693B94');
INSERT INTO `orderitem` VALUES ('394CE11D3D064FE69C18F20356ED6104', 1, 20.00, '1', '02EA9666AA3948209D3D60876E05E389');
INSERT INTO `orderitem` VALUES ('5B67E540800E4CE58268D875C3CF97D9', 1, 30.00, '14tt', '6B354DD624404AE6A35704A0D1F180A5');
INSERT INTO `orderitem` VALUES ('67AC2368E556496FBD784427A4285C84', 1, 30.00, '14tt', '3D29CEB7FBA8442D9885BDE4A488ED6B');
INSERT INTO `orderitem` VALUES ('74ED5ABF97F041F79EFBF5F48FEA3D17', 2, 60.00, '14tt', '94EA99E5F9214500A57738DC847BF31A');
INSERT INTO `orderitem` VALUES ('90E4823DE65345D28D23ACD1883FF882', 1, 14.00, 'asd', '6B354DD624404AE6A35704A0D1F180A5');
INSERT INTO `orderitem` VALUES ('A7A6C54ECD8A4C57BA8D2F12FA0AC234', 1, 20.00, '1', '6B354DD624404AE6A35704A0D1F180A5');
INSERT INTO `orderitem` VALUES ('B697B706EA4E45A3A33BAE4C9483E390', 2, 40.00, '1', 'BEE35A27AC72421A8D150C8563991275');
INSERT INTO `orderitem` VALUES ('CEB8F301F7B14217945A9165DFB8192F', 1, 20.00, '1', 'EE3ABC893D4D4734802978A33737AAE8');
INSERT INTO `orderitem` VALUES ('E224078371104563B62FB69FAE6A51F7', 2, 28.00, 'asd', '94EA99E5F9214500A57738DC847BF31A');
INSERT INTO `orderitem` VALUES ('FAAFAB0C7C91414B9253CA0C85976655', 1, 14.00, 'asd', 'EE3ABC893D4D4734802978A33737AAE8');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` varchar(255) DEFAULT NULL,
  `total` double(20,2) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `telephone` int(13) unsigned DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('02EA9666AA3948209D3D60876E05E389', 'Sat Feb 16 20:46:11 CST 2019', 20.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('3D29CEB7FBA8442D9885BDE4A488ED6B', 'Sat Feb 23 15:11:45 CST 2019', 30.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('5A2165DDFD2B4F54B81A4980208C6A32', 'Sat Feb 16 20:43:00 CST 2019', 0.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('6B354DD624404AE6A35704A0D1F180A5', 'Tue Feb 12 14:35:09 CST 2019', 89.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('7F72E6DD79824FC48BE5B83E30169ACB', 'Sat Feb 16 20:54:37 CST 2019', 0.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('94EA99E5F9214500A57738DC847BF31A', 'Sat Feb 16 20:23:09 CST 2019', 153.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('955C243145974854A0A7BFC48F693B94', 'Sat Feb 16 20:41:04 CST 2019', 40.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('AF2013AA8AC64890AAEFD4ED211833F2', 'Sun Feb 17 21:16:40 CST 2019', 14.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('BEE35A27AC72421A8D150C8563991275', 'Sun Feb 17 21:31:11 CST 2019', 65.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('C1EDE703D42947E18C1851C7D1D5D6D9', 'Sat Feb 16 20:40:28 CST 2019', 0.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('DFA5BACA8DCA48FB8D8E5982F0BE4D1C', 'Sat Feb 16 20:54:04 CST 2019', 0.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('EE3ABC893D4D4734802978A33737AAE8', 'Sat Feb 16 20:26:01 CST 2019', 34.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
INSERT INTO `orders` VALUES ('F9CDC8C85DAD45918B96E9FB3C07CAD3', 'Sat Feb 16 20:45:45 CST 2019', 0.00, 1, '安徽大学', 'cser', 12345, '0E1945A453854081B451EDF7CC123C98');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `shop_price` decimal(10,2) DEFAULT NULL,
  `pimage` varchar(255) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT '0',
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', '橙子', 20.00, 'image/goods/goods001.jpg', '2019-01-01', 1, '麻叶 麻叶  太好吃了', 0, '1');
INSERT INTO `product` VALUES ('14tt', '草莓', 30.00, 'image/goods/goods003.jpg', '2018-01-01', 1, '麻叶 恋爱了', 0, '1');
INSERT INTO `product` VALUES ('asd', '橘子', 14.00, 'image/goods/goods013.jpg', '2019-01-01', 1, '超级 超级好吃', 0, '1');
INSERT INTO `product` VALUES ('qwe', '葡萄', 25.00, 'image/goods/goods002.jpg', '2017-01-01', 1, '哇，这么好吃 ', 0, '1');
INSERT INTO `product` VALUES ('qwer', '无花果', 10.00, 'image/goods/goods007.jpg', '2016-09-09', 1, '好好吃', 0, '1');
INSERT INTO `product` VALUES ('wniuf', '桃子', 15.00, 'image/goods/goods005.jpg', '2016-01-01', 1, '啧啧啧 这么好吃', 0, '1');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) CHARACTER SET utf8 NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `telephone` varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  `addrs` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `postcodes` int(10) DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `code` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('0E1945A453854081B451EDF7CC123C98', 'cser', '123', '3301461240@qq.com', '12345', '安徽大学', 12345, NULL, 1, NULL);
INSERT INTO `user` VALUES ('3B4D8BE2E1524D1298CE57EF002B22CF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'B01F345D468549BCBFF36B5480A3170E');
INSERT INTO `user` VALUES ('473847C475BB41C1BEFF7DB20271E5C8', 'cser', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 0, '4FE8ED477A0D492E9D331CEAB6292920');
INSERT INTO `user` VALUES ('7D12751EB7D3415C8CA5BE030D809176', '涵小书', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` VALUES ('7F3B9E6F8B33444E86043A24D51FCB3C', 'cser', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 0, '238D6DA054824CE580326A58E6D5A1D0');
INSERT INTO `user` VALUES ('86981F45BAFA47D99E2626ED20B6A059', '涵小书', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 0, 'D7A4F86804AA4366AC89645C57A1B008');
INSERT INTO `user` VALUES ('A2680BB8A25B4E6B999405A058383C7C', '123', '123', '1658642438@qq.com', NULL, NULL, NULL, NULL, 0, '4843BD568E564FD3A93BB3D5C8D31491');
INSERT INTO `user` VALUES ('A5CF514E096344229AE29FBA13FB8F52', 'cser', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 0, '4281BC0F465643C1B3FCCAFF3679F366');
INSERT INTO `user` VALUES ('AD110A519BDA4D4C864630FC540CB911', '123', '123', '1658642438@qq.com', NULL, NULL, NULL, NULL, 0, 'F2477E22604045F289C36482D7CE68EB');
INSERT INTO `user` VALUES ('BB034498DF794B35971822E7C3EBF6A5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'DAE2D25BE5D9462096901EF14B8807E0');
INSERT INTO `user` VALUES ('D092D04714C34C51BB2A141DBE363018', '123', '123', '1658642438@qq.com', NULL, NULL, NULL, NULL, 0, '133D60C28EA24BA3AF807F39B7D13062');
INSERT INTO `user` VALUES ('D7B86F16E06E4F139961A5480D382FA6', '琳小呆', '123', '3301461240@qq.com', NULL, NULL, NULL, NULL, 0, '8BEC940C0D494C4C80D3582C09FD941E');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;