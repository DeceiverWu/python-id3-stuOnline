# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: stu_online
# Generation Time: 2018-05-21 04:45:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can add group',3,'add_group'),
	(9,'Can change group',3,'change_group'),
	(10,'Can delete group',3,'delete_group'),
	(11,'Can view group',3,'view_group'),
	(12,'Can view permission',2,'view_permission'),
	(13,'Can add content type',4,'add_contenttype'),
	(14,'Can change content type',4,'change_contenttype'),
	(15,'Can delete content type',4,'delete_contenttype'),
	(16,'Can view content type',4,'view_contenttype'),
	(17,'Can add session',5,'add_session'),
	(18,'Can change session',5,'change_session'),
	(19,'Can delete session',5,'delete_session'),
	(20,'Can view session',5,'view_session'),
	(21,'Can add Bookmark',6,'add_bookmark'),
	(22,'Can change Bookmark',6,'change_bookmark'),
	(23,'Can delete Bookmark',6,'delete_bookmark'),
	(24,'Can add User Setting',7,'add_usersettings'),
	(25,'Can change User Setting',7,'change_usersettings'),
	(26,'Can delete User Setting',7,'delete_usersettings'),
	(27,'Can add User Widget',8,'add_userwidget'),
	(28,'Can change User Widget',8,'change_userwidget'),
	(29,'Can delete User Widget',8,'delete_userwidget'),
	(30,'Can add log entry',9,'add_log'),
	(31,'Can change log entry',9,'change_log'),
	(32,'Can delete log entry',9,'delete_log'),
	(33,'Can view Bookmark',6,'view_bookmark'),
	(34,'Can view log entry',9,'view_log'),
	(35,'Can view User Setting',7,'view_usersettings'),
	(36,'Can view User Widget',8,'view_userwidget'),
	(37,'Can add 用户数据',10,'add_account'),
	(38,'Can change 用户数据',10,'change_account'),
	(39,'Can delete 用户数据',10,'delete_account'),
	(40,'Can see available userlist',10,'view_users'),
	(41,'Can add 组',11,'add_accountgroup'),
	(42,'Can change 组',11,'change_accountgroup'),
	(43,'Can delete 组',11,'delete_accountgroup'),
	(44,'Can add student',12,'add_student'),
	(45,'Can change student',12,'change_student'),
	(46,'Can delete student',12,'delete_student'),
	(47,'Can add stu info',13,'add_stuinfo'),
	(48,'Can change stu info',13,'change_stuinfo'),
	(49,'Can delete stu info',13,'delete_stuinfo');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_student`;

CREATE TABLE `content_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuNo` int(11) NOT NULL,
  `stuName` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nation` varchar(10) NOT NULL,
  `academy` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `stuClass` varchar(10) NOT NULL,
  `stuGrade` varchar(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `content_student` WRITE;
/*!40000 ALTER TABLE `content_student` DISABLE KEYS */;

INSERT INTO `content_student` (`id`, `stuNo`, `stuName`, `age`, `gender`, `nation`, `academy`, `major`, `stuClass`, `stuGrade`)
VALUES
	(1,140002001,'丁聪华',19,'男','汉','生命科学学院','生物科学','154','大二'),
	(2,140002002,'夏潇琦',23,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(3,140002003,'曾帛员',20,'男','汉','法学院','法学','143','大三'),
	(4,140002004,'韩松',22,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(5,140002005,'孙蝶妃',23,'女','汉','法学院','法学','143','大三'),
	(6,140002006,'江浩华',22,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(7,140002007,'田宇旺',17,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(8,140002008,'孔良超',21,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(9,140002009,'许娇翔',18,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(10,140002010,'庞妍',17,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(11,140002011,'陈莲眉',20,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(12,140002012,'冉迪振',18,'男','汉','生命科学学院','生物科学','154','大二'),
	(13,140002013,'崔子希',19,'男','汉','生命科学学院','生物科学','154','大二'),
	(14,140002014,'曹娅娴',20,'女','汉','法学院','法学','143','大三'),
	(15,140002015,'张红',19,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(16,140002016,'陈寿渊',21,'男','汉','法学院','法学','143','大三'),
	(17,140002017,'樊瑶芳',18,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(18,140002018,'唐亚升',22,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(19,140002019,'马桂蓓',21,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(20,140002020,'徐经岚',21,'男','汉','法学院','法学','143','大三'),
	(21,140002021,'阮恭琴',22,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(22,140002022,'任希',18,'男','汉','生命科学学院','生物科学','154','大二'),
	(23,140002023,'孙花',20,'女','汉','生命科学学院','生物科学','154','大二'),
	(24,140002024,'赵美珍',23,'女','汉','法学院','法学','143','大三'),
	(25,140002025,'姚道益',18,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(26,140002026,'汪冰蕴',17,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(27,140002027,'何彦',19,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(28,140002028,'米泽升',22,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(29,140002029,'朱咏娴',20,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(30,140002030,'陆银兴',21,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(31,140002031,'宋牡馨',23,'女','汉','生命科学学院','生物科学','154','大二'),
	(32,140002032,'邓材民',20,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(33,140002033,'郭秀晶',22,'女','汉','法学院','法学','143','大三'),
	(34,140002034,'康天鹏',18,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(35,140002035,'钱亚凤',20,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(36,140002036,'龚蓝莹',20,'女','汉','数学与统计学院','数学与应用数学','132','大四'),
	(37,140002037,'古璐',20,'女','汉','生命科学学院','生物科学','154','大二'),
	(38,140002038,'严秋伶',20,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(39,140002039,'范坤',20,'男','汉','生命科学学院','生物科学','154','大二'),
	(40,140002040,'阮龙',20,'男','汉','生命科学学院','生物科学','154','大二'),
	(41,140002041,'袁庆轩',19,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(42,140002042,'曹欣丹',23,'女','汉','法学院','法学','143','大三'),
	(43,140002043,'田婕灵',21,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(44,140002044,'程杏倚',22,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(45,140002045,'戴敏',20,'男','汉','生命科学学院','生物科学','154','大二'),
	(46,140002046,'顾良龙',19,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(47,140002047,'熊月辰',22,'女','汉','生命科学学院','生物科学','154','大二'),
	(48,140002048,'许永岚',18,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(49,140002049,'邹雁',20,'女','汉','法学院','法学','143','大三'),
	(50,140002050,'程双民',21,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(51,140002051,'陆道根',21,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(52,140002052,'寇瑞生',22,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(53,140002053,'马庆炳',20,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(54,140002054,'龚元才',21,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(55,140002055,'黄敬甫',22,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(56,140002056,'魏怡玉',21,'女','汉','生命科学学院','生物科学','154','大二'),
	(57,140002057,'孔睫薇',17,'女','汉','数学与统计学院','数学与应用数学','132','大四'),
	(58,140002058,'崔喻晶',17,'女','汉','法学院','法学','143','大三'),
	(59,140002059,'阮菊斐',21,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(60,140002060,'康晓',19,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(61,140002061,'江斌',22,'男','汉','法学院','法学','143','大三'),
	(62,140002062,'曾勇',20,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(63,140002063,'孔苇',21,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(64,140002064,'冯添桂',19,'女','汉','法学院','法学','143','大三'),
	(65,140002065,'伍兆斌',22,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(66,140002066,'方艾健',18,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(67,140002067,'米希雨',21,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(68,140002068,'王瑶伶',18,'女','汉','生命科学学院','生物科学','154','大二'),
	(69,140002069,'成萍娴',17,'女','汉','数学与统计学院','数学与应用数学','132','大四'),
	(70,140002070,'余卓超',17,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(71,140002071,'严登武',18,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(72,140002072,'宋安璨',23,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(73,140002073,'江美婕',18,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(74,140002074,'谢晓香',19,'女','汉','数学与统计学院','数学与应用数学','132','大四'),
	(75,140002075,'杨甚璨',19,'男','汉','生命科学学院','生物科学','154','大二'),
	(76,140002076,'郑前岚',19,'男','汉','生命科学学院','生物科学','154','大二'),
	(77,140002077,'樊革民',17,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(78,140002078,'伍一雨',20,'女','汉','法学院','法学','143','大三'),
	(79,140002079,'吴潇凤',18,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(80,140002080,'周益',23,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(81,140002081,'寇荔',20,'女','汉','生命科学学院','生物科学','154','大二'),
	(82,140002082,'毛倚娴',17,'女','汉','法学院','法学','143','大三'),
	(83,140002083,'樊颖',20,'女','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(84,140002084,'沈天根',18,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(85,140002085,'吴均武',21,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(86,140002086,'冉欣彦',23,'女','汉','法学院','法学','143','大三'),
	(87,140002087,'罗娟',20,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(88,140002088,'孟家鹏',21,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三'),
	(89,140002089,'叶致玉',18,'女','汉','生命科学学院','生物科学','154','大二'),
	(90,140002090,'陆琴',18,'女','汉','数学与统计学院','数学与应用数学','132','大四'),
	(91,140002091,'米昆',21,'男','汉','生命科学学院','生物科学','154','大二'),
	(92,140002092,'蒋瑜馨',17,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(93,140002093,'钱富武',22,'男','汉','生命科学学院','生物科学','154','大二'),
	(94,140002094,'钟苇娇',23,'女','汉','生命科学学院','生物科学','154','大二'),
	(95,140002095,'唐远先',20,'男','汉','数学与统计学院','数学与应用数学','132','大四'),
	(96,140002096,'钱嘉澜',17,'女','汉','法学院','法学','143','大三'),
	(97,140002097,'赵竣',22,'男','汉','新闻与传播学院','新闻学','165','大一'),
	(98,140002098,'孔静香',19,'女','汉','新闻与传播学院','新闻学','165','大一'),
	(99,140002099,'井剑',17,'男','汉','生命科学学院','生物科学','154','大二'),
	(100,140002100,'蒋天振',23,'男','汉','信息科学与工程学院','电气工程与计算机科学','141','大三');

/*!40000 ALTER TABLE `content_student` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content_stuinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content_stuinfo`;

CREATE TABLE `content_stuinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuNo` int(11) NOT NULL,
  `stuName` varchar(32) DEFAULT NULL,
  `entrance_score` varchar(10) DEFAULT NULL,
  `family_status` varchar(10) DEFAULT NULL,
  `attendance` varchar(10) DEFAULT NULL,
  `learn_time` int(11) DEFAULT NULL,
  `grade_point` varchar(10) DEFAULT NULL,
  `last_term_score` varchar(10) DEFAULT NULL,
  `now_term_score` varchar(10) DEFAULT NULL,
  `warning` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `content_stuinfo` WRITE;
/*!40000 ALTER TABLE `content_stuinfo` DISABLE KEYS */;

INSERT INTO `content_stuinfo` (`id`, `stuNo`, `stuName`, `entrance_score`, `family_status`, `attendance`, `learn_time`, `grade_point`, `last_term_score`, `now_term_score`, `warning`)
VALUES
	(1,140002001,'丁聪华','C','Poor','Poor',2,'C','C','C','是'),
	(2,140002002,'夏潇琦','A','Average','Poor',0,'B','C','A','是'),
	(3,140002003,'曾帛员','C','Average','Average',4,'C','C','A','否'),
	(4,140002004,'韩松','C','Good','Average',0,'B','B','B','否'),
	(5,140002005,'孙蝶妃','A','Poor','Good',0,'C','C','C','是'),
	(6,140002006,'江浩华','C','Good','Good',3,'A','B','C','否'),
	(7,140002007,'田宇旺','C','Poor','Good',1,'C','C','C','是'),
	(8,140002008,'孔良超','C','Average','Poor',4,'B','B','A','否'),
	(9,140002009,'许娇翔','A','Average','Poor',3,'C','A','A','否'),
	(10,140002010,'庞妍','B','Average','Poor',1,'B','C','C','是'),
	(11,140002011,'陈莲眉','B','Poor','Good',2,'B','A','A','否'),
	(12,140002012,'冉迪振','C','Poor','Good',3,'C','C','B','否'),
	(13,140002013,'崔子希','C','Poor','Average',2,'B','C','B','否'),
	(14,140002014,'曹娅娴','B','Good','Average',3,'B','A','A','否'),
	(15,140002015,'张红','B','Poor','Poor',0,'C','D','B','是'),
	(16,140002016,'陈寿渊','C','Good','Poor',2,'C','C','A','是'),
	(17,140002017,'樊瑶芳','A','Average','Poor',3,'C','A','C','是'),
	(18,140002018,'唐亚升','C','Good','Average',1,'B','A','B','否'),
	(19,140002019,'马桂蓓','A','Good','Good',4,'C','C','B','否'),
	(20,140002020,'徐经岚','C','Poor','Average',3,'C','C','A','否'),
	(21,140002021,'阮恭琴','B','Good','Average',4,'B','B','A','否'),
	(22,140002022,'任希','C','Average','Poor',4,'C','D','C','是'),
	(23,140002023,'孙花','B','Average','Poor',0,'B','C','B','是'),
	(24,140002024,'赵美珍','A','Poor','Poor',2,'C','D','A','是'),
	(25,140002025,'姚道益','C','Poor','Average',0,'C','C','C','是'),
	(26,140002026,'汪冰蕴','C','Average','Average',3,'A','A','C','否'),
	(27,140002027,'何彦','B','Average','Average',2,'C','C','B','否'),
	(28,140002028,'米泽升','A','Good','Good',1,'B','C','C','否'),
	(29,140002029,'朱咏娴','C','Poor','Average',0,'B','B','B','是'),
	(30,140002030,'陆银兴','B','Average','Poor',4,'C','B','C','否'),
	(31,140002031,'宋牡馨','A','Good','Good',0,'A','A','A','否'),
	(32,140002032,'邓材民','A','Average','Average',4,'B','B','C','否'),
	(33,140002033,'郭秀晶','B','Average','Good',1,'B','C','C','否'),
	(34,140002034,'康天鹏','B','Poor','Good',3,'C','A','C','否'),
	(35,140002035,'钱亚凤','C','Poor','Good',1,'A','C','C','否'),
	(36,140002036,'龚蓝莹','A','Poor','Average',2,'C','A','C','否'),
	(37,140002037,'古璐','C','Good','Average',4,'D','B','D','是'),
	(38,140002038,'严秋伶','C','Good','Poor',0,'C','B','C','是'),
	(39,140002039,'范坤','A','Average','Good',4,'B','B','C','否'),
	(40,140002040,'阮龙','B','Poor','Good',4,'C','B','C','是'),
	(41,140002041,'袁庆轩','B','Good','Good',4,'B','C','A','否'),
	(42,140002042,'曹欣丹','A','Good','Poor',0,'B','B','C','否'),
	(43,140002043,'田婕灵','C','Poor','Average',4,'C','D','C','是'),
	(44,140002044,'程杏倚','C','Good','Good',4,'D','C','D','是'),
	(45,140002045,'戴敏','A','Average','Good',2,'B','A','C','否'),
	(46,140002046,'顾良龙','B','Average','Average',2,'C','B','C','是'),
	(47,140002047,'熊月辰','C','Poor','Poor',4,'C','D','A','是'),
	(48,140002048,'许永岚','B','Good','Good',0,'B','B','A','否'),
	(49,140002049,'邹雁','C','Poor','Good',0,'A','C','B','否'),
	(50,140002050,'程双民','B','Poor','Average',1,'B','B','A','否'),
	(51,140002051,'陆道根','A','Poor','Poor',3,'B','A','A','否'),
	(52,140002052,'寇瑞生','C','Good','Good',2,'B','C','B','否'),
	(53,140002053,'马庆炳','B','Average','Good',2,'A','A','B','否'),
	(54,140002054,'龚元才','A','Average','Poor',2,'C','D','B','是'),
	(55,140002055,'黄敬甫','B','Good','Poor',3,'C','B','C','是'),
	(56,140002056,'魏怡玉','C','Good','Average',0,'B','B','B','否'),
	(57,140002057,'孔睫薇','A','Good','Poor',2,'C','C','B','是'),
	(58,140002058,'崔喻晶','B','Poor','Good',4,'B','B','B','否'),
	(59,140002059,'阮菊斐','B','Good','Average',4,'B','B','A','否'),
	(60,140002060,'康晓','C','Good','Average',1,'B','A','B','否'),
	(61,140002061,'江斌','A','Good','Poor',3,'A','A','B','否'),
	(62,140002062,'曾勇','A','Average','Poor',3,'C','D','B','是'),
	(63,140002063,'孔苇','C','Poor','Average',1,'B','B','C','否'),
	(64,140002064,'冯添桂','C','Average','Good',4,'A','A','C','否'),
	(65,140002065,'伍兆斌','B','Good','Average',2,'B','B','C','否'),
	(66,140002066,'方艾健','B','Poor','Average',4,'B','B','A','否'),
	(67,140002067,'米希雨','B','Poor','Average',2,'B','C','B','否'),
	(68,140002068,'王瑶伶','A','Good','Good',4,'A','C','B','否'),
	(69,140002069,'成萍娴','B','Average','Good',0,'B','C','A','否'),
	(70,140002070,'余卓超','A','Average','Average',0,'A','A','A','否'),
	(71,140002071,'严登武','B','Poor','Good',4,'C','C','B','否'),
	(72,140002072,'宋安璨','C','Poor','Good',0,'C','C','B','否'),
	(73,140002073,'江美婕','A','Good','Good',1,'B','B','C','否'),
	(74,140002074,'谢晓香','C','Good','Good',1,'A','A','B','否'),
	(75,140002075,'杨甚璨','A','Good','Good',3,'A','B','A','否'),
	(76,140002076,'郑前岚','C','Good','Poor',1,'B','A','A','否'),
	(77,140002077,'樊革民','C','Poor','Poor',2,'A','B','C','是'),
	(78,140002078,'伍一雨','A','Poor','Average',3,'C','A','D','是'),
	(79,140002079,'吴潇凤','B','Average','Average',2,'A','A','A','否'),
	(80,140002080,'周益','B','Average','Poor',3,'B','B','A','否'),
	(81,140002081,'寇荔','A','Average','Poor',4,'D','B','D','是'),
	(82,140002082,'毛倚娴','C','Poor','Poor',3,'C','C','B','是'),
	(83,140002083,'樊颖','A','Good','Poor',0,'C','D','C','是'),
	(84,140002084,'沈天根','A','Poor','Average',0,'C','B','C','是'),
	(85,140002085,'吴均武','A','Average','Good',3,'B','A','B','否'),
	(86,140002086,'冉欣彦','C','Poor','Average',2,'B','B','C','否'),
	(87,140002087,'罗娟','A','Poor','Average',3,'C','C','C','是'),
	(88,140002088,'孟家鹏','C','Good','Good',3,'B','C','A','否'),
	(89,140002089,'叶致玉','B','Good','Average',2,'C','C','A','否'),
	(90,140002090,'陆琴','C','Average','Average',4,'C','C','A','否'),
	(91,140002091,'米昆','C','Average','Poor',1,'C','A','D','是'),
	(92,140002092,'蒋瑜馨','A','Good','Good',2,'B','B','B','否'),
	(93,140002093,'钱富武','B','Average','Poor',1,'B','C','C','是'),
	(94,140002094,'钟苇娇','B','Poor','Poor',2,'C','B','C','是'),
	(95,140002095,'唐远先','A','Good','Good',3,'B','C','C','否'),
	(96,140002096,'钱嘉澜','B','Good','Good',2,'B','B','A','否'),
	(97,140002097,'赵竣','C','Good','Good',2,'B','B','B','否'),
	(98,140002098,'孔静香','B','Poor','Average',2,'C','C','B','否'),
	(99,140002099,'井剑','A','Average','Poor',2,'B','B','C','是'),
	(100,140002100,'蒋天振','A','Average','Good',1,'B','A','B','否');

/*!40000 ALTER TABLE `content_stuinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_users_account_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2018-05-01 09:20:02','1','admin',2,'[{\"changed\": {\"fields\": [\"name\", \"last_login\"]}}]',10,1),
	(2,'2018-05-01 09:20:20','1','admin',2,'[{\"changed\": {\"fields\": [\"is_delete\"]}}]',10,1),
	(3,'2018-05-01 09:20:25','1','admin',2,'[{\"changed\": {\"fields\": [\"is_delete\"]}}]',10,1),
	(4,'2018-05-14 23:19:26','3','wudefeng',1,'[{\"added\": {}}]',10,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(12,'content','student'),
	(13,'content','stuinfo'),
	(4,'contenttypes','contenttype'),
	(5,'sessions','session'),
	(10,'users','account'),
	(11,'users','accountgroup'),
	(6,'xadmin','bookmark'),
	(9,'xadmin','log'),
	(7,'xadmin','usersettings'),
	(8,'xadmin','userwidget');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'users','0001_initial','2018-04-30 23:41:09'),
	(2,'contenttypes','0001_initial','2018-04-30 23:41:09'),
	(3,'admin','0001_initial','2018-04-30 23:41:09'),
	(4,'admin','0002_logentry_remove_auto_add','2018-04-30 23:41:09'),
	(5,'contenttypes','0002_remove_content_type_name','2018-04-30 23:41:09'),
	(6,'auth','0001_initial','2018-04-30 23:41:09'),
	(7,'auth','0002_alter_permission_name_max_length','2018-04-30 23:41:09'),
	(8,'auth','0003_alter_user_email_max_length','2018-04-30 23:41:09'),
	(9,'auth','0004_alter_user_username_opts','2018-04-30 23:41:09'),
	(10,'auth','0005_alter_user_last_login_null','2018-04-30 23:41:09'),
	(11,'auth','0006_require_contenttypes_0002','2018-04-30 23:41:09'),
	(12,'auth','0007_alter_validators_add_error_messages','2018-04-30 23:41:09'),
	(13,'auth','0008_alter_user_username_max_length','2018-04-30 23:41:09'),
	(14,'auth','0009_alter_user_last_name_max_length','2018-04-30 23:41:09'),
	(15,'sessions','0001_initial','2018-04-30 23:41:09'),
	(16,'xadmin','0001_initial','2018-04-30 23:41:09'),
	(17,'xadmin','0002_log','2018-04-30 23:41:09'),
	(18,'xadmin','0003_auto_20160715_0100','2018-04-30 23:41:09'),
	(19,'content','0001_initial','2018-05-06 18:10:29'),
	(20,'content','0002_auto_20180506_1813','2018-05-06 18:13:39'),
	(21,'content','0003_student_age','2018-05-06 22:17:09'),
	(22,'content','0004_stuinfo_warning','2018-05-06 22:26:12'),
	(23,'content','0005_auto_20180506_2243','2018-05-06 22:43:20'),
	(24,'content','0006_auto_20180508_1003','2018-05-08 10:03:45');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('2bemc7qxcaocyh5n28h4izaz46jsm04r','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 21:58:57'),
	('33jdx6bz60yvnob3dupapyopi2tj7038','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 23:22:19'),
	('3xpusqgawwoedxkduvrjdg3hefjstcdm','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-07 11:53:34'),
	('40to21pwb583gmvtjdtr9b7pdjmag89l','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 23:16:48'),
	('440jqlezefnwlwrdaw3y50flw1lec4ng','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-04 19:43:58'),
	('4j3b3bp9nb6770jyl38qbrhj0y18omol','YWU5NjFjYmUzODI0MjYxYzY0NTFiMGJmODE1M2M4ZTg0NGIyYTljYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzg2ODM3ZTQ3MTQxMTAzOTkyODlmNGIwOTI5MTU2MGQ0MmU0ZjMxIiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-15 00:56:55'),
	('4sthdxfoboohu8y0yldcf6njbg4s6myy','YWU5NjFjYmUzODI0MjYxYzY0NTFiMGJmODE1M2M4ZTg0NGIyYTljYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzg2ODM3ZTQ3MTQxMTAzOTkyODlmNGIwOTI5MTU2MGQ0MmU0ZjMxIiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-17 11:03:27'),
	('5ne5sszzrf7cro316ibt27yotvb8km0o','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-14 17:42:47'),
	('5yhad977kr4g3njw69uosq2g6tedkx8m','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 14:40:32'),
	('74827qnecnb77nhdo1676bk16mentxag','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-07 19:55:36'),
	('7t6a81qqpsblvlxolrq1xgbqmel34rci','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 17:32:18'),
	('ai61g0mo0yvvjjfv3iiiclouzqcuf7i0','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-04 00:42:06'),
	('bbup92l03uar051u6cwpwtc4k603igye','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 19:30:34'),
	('bu5jd5oyl3m5ax8go3iuxul57cc825qc','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-03 17:48:21'),
	('f3qocagtyyvold2tr32z9rt289ivxtf3','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-14 20:46:34'),
	('f75ohgk7pnodmuntxgwhdxq9xjp6fnp4','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-13 00:27:34'),
	('fomq46gja0cxdcefflw7j30nw3vwbd1c','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-09 12:47:07'),
	('gh2rrwx6u84xq6dtr1z3utesn6lb9e5k','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-06 01:12:10'),
	('giujkdxrqlxqtgmtymqblek4v3wozibd','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-04 20:00:30'),
	('gp6htpurzq6h3waom4iznf6ajv9xa0w0','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-07 14:38:57'),
	('guydbr3lwmk9360cwrwndsub3qfwbeeu','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-04 11:09:15'),
	('jorj9bqn38ymll3dckjunxzpd1m6ghqt','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 23:00:33'),
	('k2ybliqghv6hbqt6p89upu7782emwhm3','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-14 20:54:15'),
	('kyjfzhvhw5mmr13el2uyemuhycm2nlkh','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-03 17:44:26'),
	('m3acg9nkpiccrtq8qccwhlfbyw42f6nz','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 00:42:45'),
	('mk3fvk0vkmeuztfp6jztuklvzv92y4ok','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 14:23:32'),
	('oxe29zxbbpjmhod2e5njyxjch0nsmuls','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-03 13:15:25'),
	('p4moitc6sl6zrpzmiv5jsfa568btoib7','YWU5NjFjYmUzODI0MjYxYzY0NTFiMGJmODE1M2M4ZTg0NGIyYTljYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzg2ODM3ZTQ3MTQxMTAzOTkyODlmNGIwOTI5MTU2MGQ0MmU0ZjMxIiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-15 00:41:59'),
	('pn9xlvso4le2sxerncelqkh2sui5yzr4','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 11:03:56'),
	('pplcjkx8izubyv2se1gaao31md5a5lt1','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 14:42:13'),
	('q0quduiz5b2dtl06xiyia5zub2e4yxoc','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-07 11:49:38'),
	('qffohtuexde9dyvb4s5m0j9lax35vxbk','ZjY3N2FjNzlmODMzMmU5MmYxMTcxNWUyNmJiZGNjZTc2OWQwYTVkZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5In0=','2018-05-13 10:14:22'),
	('qqxjf2vb81p25w0prbue6u2w1gas9lk8','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-14 18:03:40'),
	('r4erva4z8mm3uve2nu166pdx86k1nw9j','YWU5NjFjYmUzODI0MjYxYzY0NTFiMGJmODE1M2M4ZTg0NGIyYTljYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzg2ODM3ZTQ3MTQxMTAzOTkyODlmNGIwOTI5MTU2MGQ0MmU0ZjMxIiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-20 23:28:46'),
	('rtc3qw1va9uuj1thenyw7kgs5pdgu60m','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-12 21:51:11'),
	('s15aofk1mj8i00jhilcujflooluw2co9','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 21:01:25'),
	('spw517emvcf5bk2jyhfu98jflzkqlwx0','YWU5NjFjYmUzODI0MjYxYzY0NTFiMGJmODE1M2M4ZTg0NGIyYTljYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzg2ODM3ZTQ3MTQxMTAzOTkyODlmNGIwOTI5MTU2MGQ0MmU0ZjMxIiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-15 10:43:31'),
	('tyhzu7upmnf2a0m49uzo1x5jhv5qz735','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-14 01:07:22'),
	('u6sl5gq0tybes3hnib8enputyc47d6wk','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-06 10:35:49'),
	('uyaijusdpf1qdplyomz6vg0979rtdxbb','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-05 00:31:42'),
	('wc6zhhytknk5qegn038g9hekutfzak7y','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-06 22:23:00'),
	('wr252ocdktmsqfrgk96lc2b5wqeo96oh','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-15 00:03:52'),
	('wyuqv72ochty4furb0c7emlob9j7mo3o','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 23:28:05'),
	('xw6wl3mz4th3y5gkk3kgoa17l0jjb2q2','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-08 19:10:08'),
	('xxvmgqfzmh21xg55tvp18svg0i6orucq','Njc5YzYzYWRkN2ZkMjc4MTU2YjFjNWJkZDJmZTMzYzNhOGJmODYzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTgwOTg0NjkyYWQwOTRjM2QzMmJiMWZiMWMwNGQwZjMwZDUyMDQ5IiwidXNlcm5hbWUiOiJhZG1pbiJ9','2018-05-03 16:37:38');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_account`;

CREATE TABLE `users_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_join` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `users_account` WRITE;
/*!40000 ALTER TABLE `users_account` DISABLE KEYS */;

INSERT INTO `users_account` (`id`, `password`, `last_login`, `username`, `email`, `name`, `gender`, `date_join`, `is_delete`, `is_active`, `is_admin`)
VALUES
	(1,'pbkdf2_sha256$100000$9N6qAfJ0Ocqw$Rr0Sd2on3AMbjp18LEjV0F5VTAGdXgTI8pPuCuNL9jo=','2018-05-20 22:27:23','admin','deceiverwu@gmail.com','吴德锋',NULL,'2018-05-14',0,1,1),
	(3,'pbkdf2_sha256$100000$57ulxLUk2CsW$ITmkr3f0J8/O9pw+g7WVL0gXbZkSMTKVbkvQERqaNbA=',NULL,'wudefeng','wudefeng@yahoo.com','吴德锋',NULL,'2018-05-14',0,1,1);

/*!40000 ALTER TABLE `users_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_account_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_account_group`;

CREATE TABLE `users_account_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `accountgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_account_group_account_id_accountgroup_id_71ae446b_uniq` (`account_id`,`accountgroup_id`) USING BTREE,
  KEY `users_account_group_accountgroup_id_18da1f43_fk_users_acc` (`accountgroup_id`) USING BTREE,
  CONSTRAINT `users_account_group_account_id_36848ed4_fk_users_account_id` FOREIGN KEY (`account_id`) REFERENCES `users_account` (`id`),
  CONSTRAINT `users_account_group_accountgroup_id_18da1f43_fk_users_acc` FOREIGN KEY (`accountgroup_id`) REFERENCES `users_accountgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table users_accountgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_accountgroup`;

CREATE TABLE `users_accountgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `remarks` varchar(64) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_accountgroup_owner_id_a3e6ddf3_fk_users_account_id` (`owner_id`) USING BTREE,
  CONSTRAINT `users_accountgroup_owner_id_a3e6ddf3_fk_users_account_id` FOREIGN KEY (`owner_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table xadmin_bookmark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_account_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table xadmin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_log`;

CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_user_id_bb16a176_fk_users_account_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



# Dump of table xadmin_usersettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_account_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;

INSERT INTO `xadmin_usersettings` (`id`, `key`, `value`, `user_id`)
VALUES
	(1,'dashboard:home:pos','',1);

/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xadmin_userwidget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_account_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
