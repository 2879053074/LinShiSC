/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.7.12-log : Database - linssc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`linssc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `linssc`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `m_time` date DEFAULT NULL COMMENT '注册时间',
  `m_type` varchar(255) DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` varchar(255) DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `account` */

insert  into `account`(`m_id`,`u_id`,`m_time`,`m_type`,`m_amoney`) values (1,1,'2018-03-05','消费','-100'),(2,1,'2018-03-06','提现','-100'),(3,1,'2018-03-07','充值','+100');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `ad_username` varchar(255) DEFAULT NULL COMMENT '管理员名称',
  `ad_password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin` */

insert  into `admin`(`ad_id`,`ad_username`,`ad_password`,`role_id`) values (1,'客服','123456',3),(2,'admin','admin',1),(3,'库管小仕','123456',3),(4,'蟹蟹','123456',1),(5,'小灰灰','123456',3),(6,'xiaoxiao','123456',2),(7,'小猪猪','123456',3),(8,'小呼呼','123456',2),(9,'小飞飞','123456',3),(10,'仕仕','123456',2),(11,'大壮','123456',2);

/*Table structure for table `admin_menu` */

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理一级目录ID',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '管理一级目录名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`menu_name`) values (1,'个人信息'),(2,'人员管理'),(3,'图片管理'),(4,'订单管理'),(5,'图表统计'),(6,'商品管理');

/*Table structure for table `admin_menu_child` */

DROP TABLE IF EXISTS `admin_menu_child`;

CREATE TABLE `admin_menu_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理二级目录ID',
  `child_menu_name` varchar(255) DEFAULT NULL COMMENT '管理二级目录名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父级目录ID',
  `child_menu_url` varchar(255) DEFAULT NULL COMMENT '子级目录地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin_menu_child` */

insert  into `admin_menu_child`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (1,'用户管理',2,'/admin/user/mainToUserinfo'),(2,'员工管理',2,'/admin/user/mainToAdmin'),(3,'订单管理',4,'/admin/order/mainToAdminOrder'),(4,'上传图片',3,'/admin/img/mainToAdminImg'),(5,'商品管理',6,'/admin/snackinfo/mainToAdminSnackinfo'),(6,'饼图统计',5,'/admin/map/mainToPieMap'),(7,'个人信息',1,'/user/mainToAdminuser');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `e_parentId` int(11) DEFAULT NULL COMMENT '追评',
  `s_id` int(11) DEFAULT NULL COMMENT '点心ID',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `e_pictureName` varchar(255) DEFAULT NULL COMMENT '上传的图片名字',
  `e_type` int(11) DEFAULT NULL COMMENT '1=好评，0，-1差评',
  `e_score` int(11) DEFAULT NULL COMMENT '评分',
  `info` varchar(255) DEFAULT NULL COMMENT '评语',
  `e_date` date DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`e_id`) USING BTREE,
  KEY `u_idpre` (`u_id`) USING BTREE,
  KEY `s_idpre` (`s_id`) USING BTREE,
  CONSTRAINT `s_idpre` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`),
  CONSTRAINT `u_idpre` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `comment` */

/*Table structure for table `integral` */

DROP TABLE IF EXISTS `integral`;

CREATE TABLE `integral` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分ID',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `i_number` int(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` date DEFAULT NULL COMMENT '操作时间',
  `i_dese` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `integral` */

insert  into `integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (1,1,6,'2018-03-01','每天登录送积分'),(2,1,5,'2018-02-28','每天登录送积分'),(3,1,4,'2018-02-27','每天登录送积分'),(4,1,3,'2018-03-02','每天登录送积分'),(5,1,2,'2018-03-03','每天登录送积分'),(6,1,1,'2018-03-04','每天登录送积分'),(7,1,7,'2018-03-25','每天登录送积分'),(8,1,8,'2018-03-24','每天登录送积分'),(9,1,9,'2018-03-23','每天登录送积分'),(10,1,10,'2018-03-22','每天登录送积分'),(11,1,11,'2018-03-21','每天登录送积分');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `e_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` date DEFAULT NULL COMMENT '订单出单时间',
  `o_type` int(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `order` */

insert  into `order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (84,'201803272559',12,2,'2018-03-27',1),(125,'201811024234',17,1,'2018-11-02',0),(126,'201811045281',18,2,'2018-11-04',0),(127,'201812053444',19,2,'2018-12-05',1),(128,'201812074630',20,2,'2018-12-07',0),(129,'201812075605',20,2,'2018-12-07',0),(132,'201812078303',20,2,'2018-12-07',1),(133,'202012117469',24,2,'2020-12-11',1),(134,'202012117087',24,2,'2020-12-11',1),(135,'202012117832',24,2,'2020-12-11',1),(136,'202012113404',24,2,'2020-12-11',1),(138,'202012118795',24,10,'2020-12-11',0),(139,'202012114262',24,NULL,'2020-12-11',-2),(140,'202012112991',24,10,'2020-12-11',0),(141,'202012154090',18,NULL,'2020-12-15',-2);

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详细ID',
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单ID',
  `s_id` int(11) DEFAULT NULL COMMENT '积分ID',
  `o_num` int(11) DEFAULT NULL COMMENT '订单数量',
  `o_money` double DEFAULT NULL COMMENT '订单总额',
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (94,'201803272559',20,2,10),(154,'201811024234',26,1,16),(155,'201811024234',25,1,1),(156,'201811045281',82,2,10),(157,'201812053444',39,2,20),(158,'201812053444',32,3,10),(159,'201812074630',67,3,16),(160,'201812074630',55,2,9),(161,'201812074630',39,1,20),(162,'201812075605',49,1,14),(163,'201812075605',45,1,27),(164,'201812075605',30,1,8),(168,'201812078303',66,1,16),(169,'201812078303',34,1,12),(170,'202012117469',26,9,16),(171,'202012117469',47,1,27),(172,'202012117087',81,9,2.1),(173,'202012117832',56,131,12),(174,'202012113404',23,100,80),(176,'202012118795',40,15,12),(177,'202012118795',51,19,27),(178,'202012118795',37,7,60),(179,'202012118795',54,6,24),(180,'202012118795',24,19,50),(181,'202012118795',76,20,9),(182,'202012118795',34,10,12),(183,'202012114262',34,2,12),(184,'202012114262',84,1,90),(185,'202012112991',86,1000,4498.2),(186,'202012154090',90,1,9000);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT COMMENT '批准ID',
  `pname` varchar(255) DEFAULT NULL COMMENT '批准名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父级ID',
  `url` varchar(255) DEFAULT NULL COMMENT '批准地址',
  `isparent` int(11) DEFAULT NULL COMMENT '是否是父级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是目录',
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `permission` */

insert  into `permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (1,'员工管理',0,'/snack/admin/user/mainToAdmin',1,1),(2,'员工添加',1,'/snack/admin/user/addNewAdmin',0,1),(3,'员工删除',1,'/snack/admin/user/delAdminById',0,1),(4,'员工修改',1,'/snack/admin/user/updateGoAdminById',0,1),(6,'用户管理',0,'/snack/admin/user/mainToUserinfo',1,1),(9,'用户删除',6,'/snack/admin/user/delUserinfoById',0,1),(10,'用户修改',6,'/snack/admin/user/updateGoUserinfoById',0,1),(13,'订单管理',0,'/snack/admin/order/mainToAdminOrder',1,1),(14,'订单修改',13,'/snack/admin/order/updateSelectAdminOrder',0,1),(15,'订单删除',13,'/snack/admin/order/deleteAdminOrder',0,1),(16,'详情修改',13,'/snack/admin/order/updateSelectAdminOrderDetial',0,1),(17,'详情删除',13,'/snack/admin/order/deleteOrderdetail',0,1),(19,'图片管理',0,'/snack/admin/img/mainToAdminImg',1,1),(20,'上传图片',19,'/snack/admin/img/upload',0,1),(21,'商品管理',0,'/snack/admin/snackinfo/mainToAdminSnackinfo',0,1),(22,'商品上架',21,'/snack/admin/snackinfo/addAdminSnack',0,1),(23,'商品删除',21,'/snack/admin/snackinfo/delAdminUserinfo',0,1),(24,'商品修改',21,'/snack/admin/snackinfo/selectAdminUserinfoBysId',0,1),(25,'个人信息',0,'/admin/user/mainToAdminuser',1,1),(26,'确认发货',13,'/snack/admin/order/userOrderConfirm',0,1);

/*Table structure for table `receiptinfo` */

DROP TABLE IF EXISTS `receiptinfo`;

CREATE TABLE `receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '欢迎ID',
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单ID',
  `o_name` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `o_phone` varchar(255) DEFAULT NULL COMMENT '订单手机号码',
  `o_address` varchar(255) DEFAULT NULL COMMENT '订单收货地址',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `receiptinfo` */

insert  into `receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (90,'201803272559','哈哈','110110110110','江西应用科技学院'),(131,'201811024234','学猫叫','15868526202','浙江杭州'),(132,'201811045281','你好','13520109202','江西赣州'),(133,'201812053444','嘻嘻哈哈','13565655656','江西南昌'),(134,'201812074630','香蕉水果','13656565656','广东 邵东'),(135,'201812075605','机器厉旭','13656565656','云南 普洗'),(138,'201812078303','张三','13855544565','湖北 武汉'),(139,'202012117469','钟筱筱','15079023428','江西赣州'),(140,'202012117087','xiexie','15079023428','江西赣州'),(141,'202012117832','xiaoixoa','15079023428','江西赣州'),(142,'202012113404','筱筱','15079023428','江西赣州'),(144,'202012118795','xiaoxiao','15079023425','江西赣州'),(145,'202012114262','小i实现','15079023456','江西赣州'),(146,'202012112991','哒哒','15079023428','江西赣州'),(147,'202012154090','dada','15079023427','江西赣州');

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记载ID',
  `s_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `recordDate` date DEFAULT NULL COMMENT '记载时间',
  `recordNumber` int(11) DEFAULT NULL COMMENT '记载数量',
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `s_idfk` (`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `record` */

insert  into `record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (13,20,'2018-02-16',2),(14,23,'2018-03-27',4),(15,20,'2018-03-27',6),(16,20,'2018-03-27',2),(17,23,'2018-03-27',1),(18,21,'2018-03-27',1),(19,20,'2018-03-27',2),(20,21,'2018-03-27',1),(21,24,'2018-03-27',3),(22,23,'2018-03-28',1),(23,21,'2018-03-28',10),(24,21,'2018-03-28',1),(25,20,'2018-03-28',1),(26,24,'2018-03-28',1),(27,24,'2018-03-28',1),(28,23,'2018-03-31',1),(29,23,'2018-04-01',1),(30,20,'2018-04-01',6),(31,24,'2018-04-01',3),(32,20,'2018-04-01',1),(33,23,'2018-04-01',1),(34,62,'2018-04-01',4),(35,27,'2018-04-01',5),(36,45,'2018-04-01',3),(37,51,'2018-04-17',4),(38,34,'2018-04-17',4),(39,26,'2018-04-01',8),(40,30,'2018-04-01',10),(41,51,'2018-04-30',3),(42,33,'2018-04-30',4),(43,26,'2018-04-30',3),(44,56,'2018-04-30',1),(45,26,'2018-10-25',1),(46,26,'2018-10-25',10),(47,26,'2018-10-25',22),(48,34,'2018-10-25',6),(49,26,'2018-11-04',1),(50,25,'2018-11-04',1),(51,39,'2018-12-05',2),(52,32,'2018-12-05',3),(53,82,'2018-12-06',2),(54,67,'2018-12-07',3),(55,55,'2018-12-07',2),(56,39,'2018-12-07',1),(57,66,'2018-12-07',1),(58,34,'2018-12-07',1),(59,26,'2020-12-11',9),(60,47,'2020-12-11',1),(61,81,'2020-12-11',9),(62,56,'2020-12-11',131),(63,23,'2020-12-11',100),(64,49,'2020-12-11',1),(65,45,'2020-12-11',1),(66,30,'2020-12-11',1),(67,40,'2020-12-11',15),(68,51,'2020-12-11',19),(69,37,'2020-12-11',7),(70,54,'2020-12-11',6),(71,24,'2020-12-11',19),(72,76,'2020-12-11',20),(73,34,'2020-12-11',10),(74,86,'2020-12-11',1000);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `role_info` varchar(255) DEFAULT NULL COMMENT '角色信息',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_info`) values (1,'超级管理员','系统最高权限者(不可添加编辑)'),(2,'普通管理员','管理发货'),(3,'小角色','查看基本报表');

/*Table structure for table `rolepermission` */

DROP TABLE IF EXISTS `rolepermission`;

CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色许可ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `perid` int(11) DEFAULT NULL COMMENT '许可ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `rolepermission` */

insert  into `rolepermission`(`id`,`role_id`,`perid`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,6),(6,1,9),(7,1,10),(8,1,13),(9,1,14),(10,1,15),(11,1,16),(12,1,17),(13,1,19),(14,1,20),(15,1,21),(16,1,22),(17,1,23),(18,1,24),(19,2,1),(20,2,6),(21,2,13),(22,2,14),(23,2,15),(24,2,16),(25,2,17),(26,2,19),(27,2,21),(28,2,25),(29,1,25),(30,3,1),(31,3,6),(32,3,13),(33,3,19),(34,3,21),(35,3,25),(36,1,26),(37,2,26);

/*Table structure for table `snackinfo` */

DROP TABLE IF EXISTS `snackinfo`;

CREATE TABLE `snackinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `s_batch` varchar(255) DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `s_price` double DEFAULT NULL COMMENT '商品价格',
  `s_discount` varchar(255) DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) DEFAULT NULL COMMENT '商品图品地址',
  `s_brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) DEFAULT NULL COMMENT '产地',
  `s_Imported` int(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` int(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` date DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) DEFAULT NULL COMMENT '保质期',
  `state` int(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) DEFAULT NULL COMMENT '商品类型',
  `s_number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `snackinfo` */

insert  into `snackinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (20,'201803273550','可乐',10,'10','kele.jpg','百事','浙江',1,NULL,'2018-03-15','12',1,'2018-03-27','很好喝','饮料类',9980),(21,'201803276547','瓜子',20,'9','guazi.jpg','恰恰','浙江',1,NULL,'2020-12-11','12',1,'2018-03-27','好吃的瓜子','其他',989999),(23,'201803271694','牛肉干',100,'8','niurougan.jpg','小辣椒','浙江',1,NULL,'2020-12-11','12',1,'2018-03-27','好吃的牛肉干','肉制类',9891),(24,'201803272746','提拉米酥',100,'5','tilamishu.jpg','大本营','浙江',0,NULL,'2018-03-14','12',1,'2018-03-27','好吃的提拉米酥','膨化类',9973),(25,'201804174136','咪咪',10,'1','mimi.jpg','咪咪','广东',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的咪咪','膨化类',99999),(26,'201804172196','乐事薯片',20,'8','leshishupian.jpg','乐事','上海',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的薯片','膨化类',9946),(27,'201804171833','黄金锅巴',10,'7','huangjinguoba.jpg','宇润','安徽',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的锅巴','膨化类',9995),(28,'201804174852','董小姐',10,'10','dongxiaojie.jpg','董小姐','海南',0,NULL,'2020-12-11','18',1,'2018-04-17','好吃的董小姐','膨化类',100000),(29,'201804171022','小馒头',10,'8','xiaomantou.jpg','旺旺','北京',1,NULL,'2020-12-11','12',1,'2018-04-17','好吃的小馒头','膨化类',200000),(30,'201804172485','炒米',10,'8','chaomi.jpg','甘源','浙江',1,NULL,'2018-04-17','12',1,'2018-04-17','好吃的炒米','膨化类',8999),(31,'201804172109','单身狗粮',20,'8','danshengouliang.jpg','旺旺','浙江',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的狗粮','膨化类',10000),(32,'201804174170','妙妙果',10,'10','miaomiaoguo.jpg','妙妙','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的妙妙果','膨化类',9997),(33,'201804173272','虾味条',20,'8','xiaweitiao.jpg','旺旺','浙江',0,NULL,'2018-04-02','12',1,'2018-04-17','好吃的虾味条','膨化类',119996),(34,'201804175107','糙米卷',20,'6','chumijuan.jpg','旺旺','浙江',1,NULL,'2020-12-01','12',1,'2018-04-17','好吃的糙米卷','膨化类',102281),(35,'201804175567','香脆薯条',10,'7','xiangcuishutiao.jpg','旺旺','浙江',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的香脆薯条','膨化类',100000),(36,'201804174966','沙屋薯片',20,'8','shawushupian.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的沙屋薯片','膨化类',2000),(37,'201804178458','吱脆薯片',100,'6','zhicuishupian.jpg','旺旺','浙江',1,NULL,'2018-04-14','12',1,'2018-04-17','好吃的吱脆薯片','膨化类',9993),(38,'201804172586','奶酪',20,'4','nailao.jpg','旺旺','浙江',0,NULL,'2018-04-18','12',1,'2018-04-17','好吃的奶酪','膨化类',20000),(39,'201804178495','山椒凤爪',20,'10','shanjiaofengzhua.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的山椒凤爪','肉制类',19997),(40,'201804171216','泡椒牛肉',20,'6','paojiaoniurou.jpg','旺旺','浙江',1,NULL,'2018-03-07','12',1,'2018-04-17','好吃的泡椒牛肉','肉制类',9985),(41,'201804171172','酱烧鸭翅',20,'8','jiangshaoyachi.jpg','旺旺','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','好吃的酱烧鸭翅','肉制类',10000),(42,'201804177856','小鸡腿',20,'6','xiaojitui.jpg','恰恰','浙江',0,NULL,'2018-04-11','12',1,'2018-04-17','好吃的小鸡腿','肉制类',10000),(43,'201804172550','鸭掌',20,'4','yazhang.jpg','恰恰','浙江',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的鸭掌','肉制类',10000),(44,'201804179981','猪肉铺',30,'6','zhuroupu.jpg','旺旺','浙江',0,NULL,'2020-12-11','12',1,'2018-04-17','好吃的猪肉铺','肉制类',10000),(45,'201804177197','牛肉片',30,'9','niuroupian.jpg','旺旺','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','好吃的牛肉片','肉制类',9996),(46,'201804175915','鸭脖',10,'8','yabo.jpg','旺旺','浙江',1,NULL,'2018-04-14','12',1,'2018-04-17','好吃的鸭脖','肉制类',10000),(47,'201804176852','卤牛肉',30,'9','luniurou.jpg','旺旺','浙江',1,NULL,'2018-04-13','12',1,'2018-04-17','好吃的卤牛肉','肉制类',9999),(48,'201804176635','猪皮筋',20,'8','zhupiji.jpg','旺旺','浙江',0,NULL,'2018-04-14','12',1,'2018-04-17','好吃的猪皮筋','肉制类',10000),(49,'201804174593','功夫鸭爪',20,'7','gongfuyazhua.jpg','旺旺','浙江',1,NULL,'2018-04-12','12',1,'2018-04-17','好吃的功夫鸭爪','肉制类',9999),(50,'201804177641','牛肉丝',20,'8','niurousi.jpg','旺旺','浙江',0,NULL,'2018-04-14','12',1,'2018-04-17','好吃的牛肉丝','肉制类',10000),(51,'201804171818','猪蹄',30,'9','zhuti.jpg','旺旺','浙江',0,NULL,'2018-04-13','12',1,'2018-04-17','好吃的猪蹄','肉制类',9974),(52,'201804177621','翅中',20,'8','chizhong.jpg','旺旺','浙江',1,NULL,'2018-03-20','12',1,'2018-04-17','好吃的翅中','肉制类',10000),(53,'201804176052','蜜桃汁',10,'9','mitaozhi.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的蜜桃汁','饮料类',10000),(54,'201804176090','拿铁咖啡',30,'8','natiekafei.jpg','旺旺','浙江',0,NULL,'2018-03-07','12',1,'2018-04-17','好吃的拿铁咖啡','饮料类',9994),(55,'201804177963','啵乐乐',10,'9','bolele.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的啵乐乐','饮料类',9998),(56,'201804177044','蜜柠水',20,'6','miningshui.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','好吃的蜜柠水','饮料类',9868),(57,'201804173371','养味乳味',20,'8','yangweiruwei.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好吃的养味乳味','饮料类',10000),(58,'201804171125','糖豆奶',50,'9','tangdounai.jpg','旺旺','西藏',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的糖豆奶','饮料类',10000),(59,'201804179146','丝袜奶茶',10,'7','siwainaicha.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','好吃的丝袜奶茶','饮料类',10000),(60,'201804177428','乳酸菌',20,'5','rusuanjun.jpg','旺旺','浙江',0,NULL,'2018-03-07','12',1,'2018-04-17','好吃的乳酸菌','饮料类',10000),(61,'201804176104','蓝莓饮料',20,'8','lanmeiyinliao.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的蓝莓饮料','饮料类',10000),(62,'201804171606','牛乳茶',10,'8','niurucha.jpg','旺旺','浙江',0,NULL,'2018-04-05','12',1,'2018-04-17','好吃的牛乳茶','饮料类',9996),(63,'201804172259','米稀',10,'10','mixi.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好吃的米稀','饮料类',10000),(64,'201804176802','奇诺咖啡',20,'8','qinuokafei.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的奇诺咖啡','饮料类',10000),(65,'201804175746','西米露',20,'7','ximilu.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','好吃的西米露','饮料类',10000),(66,'201804177256','椰汁',20,'8','yezhi.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的椰汁','饮料类',9999),(67,'201804177149','牛奶果冻',20,'8','niunaiguodong.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好吃的牛奶果冻','其他',9997),(68,'201804172033','闪光蛋',10,'5','shanguangdan.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好吃的闪光蛋','其他',10000),(69,'201804176739','口香糖',20,'9','kouxiangtang.jpg','旺旺','浙江',1,NULL,'2018-04-20','43',1,'2018-04-17','好吃的口香糖','其他',10000),(70,'201804174121','桔子果杯',20,'8','juziguobei.jpg','旺旺','浙江',0,NULL,'2018-04-13','12',1,'2018-04-17','好吃的桔子果杯','其他',10000),(71,'201804175818','优酪果冻',20,'8','youlaoguodong.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好吃的优酪果冻','其他',10000),(72,'201804179160','布丁草莓',20,'7','budingcaomei.jpg','旺旺','浙江',1,NULL,'2018-04-09','12',1,'2018-04-17','好吃的布丁草莓','其他',10000),(73,'201804174125','布丁原味',20,'8','budingyuanwei.jpg','旺旺','浙江',0,NULL,'2018-04-17','18',1,'2018-04-17','好吃的布丁原味','其他',10000),(74,'201804172373','星球杯',20,'8','xingqiubei.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','好吃的星球杯','其他',10000),(75,'201804175309','欣欣杯',20,'7','xinxinbei.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的欣欣杯','其他',10000),(76,'201804178276','葡萄干',10,'9','putaogan.jpg','旺旺','浙江',1,NULL,'2018-04-19','12',1,'2018-04-17','好吃的葡萄干','其他',9980),(77,'201804177722','芒果干',20,'5','mangguogan.jpg','咪咪','浙江',0,NULL,'2018-04-20','12',1,'2018-04-17','好吃的芒果干','其他',10000),(78,'201804171055','桃条',10,'8','taotiao.jpg','恰恰','浙江',0,NULL,'2018-04-07','12',1,'2018-04-17','好吃的桃条','其他',10000),(79,'201804172661','话梅',10,'8','huamei.jpg','旺旺','浙江',1,NULL,'2018-03-20','18',1,'2018-04-17','好吃的话梅','其他',10000),(80,'201804173962','秋葵',10,'7','huamei.jpg','旺旺','浙江',0,NULL,'2018-04-04','12',1,'2018-04-17','好吃的秋葵','其他',10000),(81,'201807029034','瓜子',21,'7','guazi.jpg','旺旺','浙江杭州',0,NULL,'2020-12-11','12',1,'2018-07-02','32','其他',9991),(86,'202012111546','饼干',19,'10','18.jpg','饼干','江西赣州',1,NULL,'2020-12-11','12',1,'2020-12-11','饼干','其他',99000),(87,'202012142233','奶茶',18,'9','1.jpg','杂牌','江西南昌',0,NULL,'2020-12-09','12',1,'2020-12-14','奶香四溢','饮料类',1000),(88,'202012146917','三只松鼠',28.8,'10','2.jpg','三只松鼠','山东',0,NULL,'2020-12-01','12',1,'2020-12-14','三只松鼠非常便宜','膨化类',1000),(89,'202012141432','牛肉干',59.8,'9','3.jpg','豆制品','新疆',0,NULL,'2020-12-09','12',1,'2020-12-14','牛肉干非常干','肉制类',1000),(90,'202012143260','汽水机',10000,'9','5.jpg','机电','江西赣州',0,NULL,'2020-12-01','12',1,'2020-12-14','汽水商城生成器','饮料类',1000),(91,'202012146869','薯条',10,'1','6.jpg','薯条类','江西赣州',0,NULL,'2020-12-09','12',1,'2020-12-14','薯条你的最爱','膨化类',1000),(92,'202012142406','芒果干',15.8,'9','7.jpg','芒果类','山东',0,NULL,'2020-11-03','12',1,'2020-12-14','芒果干','其他',1000),(93,'202012142461','草莓干',29.9,'1','8.jpg','草莓类','江西赣州',1,NULL,'2020-12-02','12',1,'2020-12-14','草莓干','其他',1000);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `u_realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `u_score` int(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `userinfo` */

insert  into `userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (17,'哒哒','筱筱户','123456','9983.0','15810100256','761695@qq.com','女','2018-11-01','浙江',NULL),(18,'筱筱','xiaoxiao','123','2091.0','13520109202','1193284480@qq.com','男','2018-11-04','北京',1),(19,'钟哒哒','钟筱筱','123','9930.0','13656565656','123456@qq.com','女','2018-12-05','上海',NULL),(20,'石龟','rettatet','123','9837.0','13565659898','2879@qq.com','男','2020-12-11','上海市 浦东新区',NULL),(21,'钟筱筱','dada','123456','10000','15079023428','2879053074@qq.com','男','2020-12-10','江西省赣州市',NULL),(22,'钟筱筱','糊糊','123456zzz','10000','15079023428','2879053074@qq.com','男','2020-12-10','江西赣州',NULL),(23,'王','wenhu','123456','10000','15079023428','287905305@qq.com','男','2020-12-10','jaingxi',NULL),(24,'xiexie','蟹蟹','123456','20000','15079023429','28790530@qq.com','男','2020-12-11','江西赣州',NULL);

/* Procedure structure for procedure `haha` */

/*!50003 DROP PROCEDURE IF EXISTS  `haha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end */$$
DELIMITER ;

/* Procedure structure for procedure `jk` */

/*!50003 DROP PROCEDURE IF EXISTS  `jk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
