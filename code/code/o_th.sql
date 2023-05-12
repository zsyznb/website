# Host: 127.0.0.1  (Version: 5.7.26)
# Date: 2023-05-11 14:23:30
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "appuser"
#

DROP TABLE IF EXISTS `appuser`;
CREATE TABLE `appuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(25) DEFAULT NULL,
  `passwordhash` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "appuser"
#

INSERT INTO `appuser` VALUES (1,'2021-09-17 14:02:47','admin','e10adc3949ba59abbe56e057f20f883e'),(5,NULL,'张三','e10adc3949ba59abbe56e057f20f883e');

#
# Structure for table "auth_group"
#

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "auth_group"
#

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

#
# Structure for table "auth_group_permissions"
#

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Data for table "auth_group_permissions"
#

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

#
# Structure for table "auth_permission"
#

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "auth_permission"
#

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add appuser',7,'add_appuser'),(26,'Can change appuser',7,'change_appuser'),(27,'Can delete appuser',7,'delete_appuser'),(28,'Can view appuser',7,'view_appuser'),(29,'Can add auth group',8,'add_authgroup'),(30,'Can change auth group',8,'change_authgroup'),(31,'Can delete auth group',8,'delete_authgroup'),(32,'Can view auth group',8,'view_authgroup'),(33,'Can add auth group permissions',9,'add_authgrouppermissions'),(34,'Can change auth group permissions',9,'change_authgrouppermissions'),(35,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(36,'Can view auth group permissions',9,'view_authgrouppermissions'),(37,'Can add auth permission',10,'add_authpermission'),(38,'Can change auth permission',10,'change_authpermission'),(39,'Can delete auth permission',10,'delete_authpermission'),(40,'Can view auth permission',10,'view_authpermission'),(41,'Can add auth user',11,'add_authuser'),(42,'Can change auth user',11,'change_authuser'),(43,'Can delete auth user',11,'delete_authuser'),(44,'Can view auth user',11,'view_authuser'),(45,'Can add auth user groups',12,'add_authusergroups'),(46,'Can change auth user groups',12,'change_authusergroups'),(47,'Can delete auth user groups',12,'delete_authusergroups'),(48,'Can view auth user groups',12,'view_authusergroups'),(49,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(50,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(51,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(52,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(53,'Can add course',14,'add_course'),(54,'Can change course',14,'change_course'),(55,'Can delete course',14,'delete_course'),(56,'Can view course',14,'view_course'),(57,'Can add detail',15,'add_detail'),(58,'Can change detail',15,'change_detail'),(59,'Can delete detail',15,'delete_detail'),(60,'Can view detail',15,'view_detail'),(61,'Can add django admin log',16,'add_djangoadminlog'),(62,'Can change django admin log',16,'change_djangoadminlog'),(63,'Can delete django admin log',16,'delete_djangoadminlog'),(64,'Can view django admin log',16,'view_djangoadminlog'),(65,'Can add django content type',17,'add_djangocontenttype'),(66,'Can change django content type',17,'change_djangocontenttype'),(67,'Can delete django content type',17,'delete_djangocontenttype'),(68,'Can view django content type',17,'view_djangocontenttype'),(69,'Can add django migrations',18,'add_djangomigrations'),(70,'Can change django migrations',18,'change_djangomigrations'),(71,'Can delete django migrations',18,'delete_djangomigrations'),(72,'Can view django migrations',18,'view_djangomigrations'),(73,'Can add django session',19,'add_djangosession'),(74,'Can change django session',19,'change_djangosession'),(75,'Can delete django session',19,'delete_djangosession'),(76,'Can view django session',19,'view_djangosession'),(77,'Can add sys',20,'add_sys'),(78,'Can change sys',20,'change_sys'),(79,'Can delete sys',20,'delete_sys'),(80,'Can view sys',20,'view_sys'),(81,'Can add urls',21,'add_urls'),(82,'Can change urls',21,'change_urls'),(83,'Can delete urls',21,'delete_urls'),(84,'Can view urls',21,'view_urls'),(85,'Can add make table',22,'add_maketable'),(86,'Can change make table',22,'change_maketable'),(87,'Can delete make table',22,'delete_maketable'),(88,'Can view make table',22,'view_maketable'),(89,'Can add sensortest',23,'add_sensortest'),(90,'Can change sensortest',23,'change_sensortest'),(91,'Can delete sensortest',23,'delete_sensortest'),(92,'Can view sensortest',23,'view_sensortest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

#
# Structure for table "auth_user"
#

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "auth_user"
#

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

#
# Structure for table "auth_user_groups"
#

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Data for table "auth_user_groups"
#

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

#
# Structure for table "auth_user_user_permissions"
#

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Data for table "auth_user_user_permissions"
#

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "course"
#

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (31,'sensor','传感器'),(32,'radar','雷达');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

#
# Structure for table "detail"
#

DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(255) DEFAULT NULL,
  `did` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `paramter` text,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "detail"
#

/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;

#
# Structure for table "django_admin_log"
#

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "django_admin_log"
#

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

#
# Structure for table "django_content_type"
#

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "django_content_type"
#

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'students','appuser'),(8,'students','authgroup'),(9,'students','authgrouppermissions'),(10,'students','authpermission'),(11,'students','authuser'),(12,'students','authusergroups'),(13,'students','authuseruserpermissions'),(14,'students','course'),(15,'students','detail'),(16,'students','djangoadminlog'),(17,'students','djangocontenttype'),(18,'students','djangomigrations'),(19,'students','djangosession'),(20,'students','sys'),(21,'students','urls'),(22,'students','maketable'),(23,'students','sensortest');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

#
# Structure for table "django_migrations"
#

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "django_migrations"
#

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-03 05:47:37.536292'),(2,'auth','0001_initial','2022-03-03 05:47:37.747954'),(3,'admin','0001_initial','2022-03-03 05:47:37.803636'),(4,'admin','0002_logentry_remove_auto_add','2022-03-03 05:47:37.811572'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-03 05:47:37.818544'),(6,'contenttypes','0002_remove_content_type_name','2022-03-03 05:47:37.855220'),(7,'auth','0002_alter_permission_name_max_length','2022-03-03 05:47:37.878036'),(8,'auth','0003_alter_user_email_max_length','2022-03-03 05:47:37.896388'),(9,'auth','0004_alter_user_username_opts','2022-03-03 05:47:37.902836'),(10,'auth','0005_alter_user_last_login_null','2022-03-03 05:47:37.918708'),(11,'auth','0006_require_contenttypes_0002','2022-03-03 05:47:37.921684'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-03 05:47:37.929124'),(13,'auth','0008_alter_user_username_max_length','2022-03-03 05:47:37.945988'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-03 05:47:37.963348'),(15,'auth','0010_alter_group_name_max_length','2022-03-03 05:47:37.979220'),(16,'auth','0011_update_proxy_permissions','2022-03-03 05:47:37.987157'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-03 05:47:38.002037'),(18,'sessions','0001_initial','2022-03-03 05:47:38.020884');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

#
# Structure for table "django_session"
#

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "django_session"
#

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ddmuuohrord10k214ufluttp8s9zas5','eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJyYW5rIjoyfQ:1nPeLK:-EftyPzxzkfE-RnI5FEr8KraUQXgbGkKyr6FQQaiPOg','2022-03-17 05:49:38.490678'),('2u80i507num8aei3lbntif3lrjudo1xs','eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJyYW5rIjoyfQ:1pFsKx:MtEml9E9DsKFS92v8WkeBmjJefigPW2zeMlfpKfKB2E','2023-01-26 07:49:23.020548'),('bs0vtoe8kgdpkif6lyekvbwok7neos6p','eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJyYW5rIjoyfQ:1pZ1TB:_Xu0Kt4JwCUVKC2dFoBvt6e6QzY6oTlsHW7m00AvS7o','2023-03-20 03:25:01.675405'),('kibsezv76inkczg1sss11xwu3ewktoix','e30:1pwzhK:cubckp0JcDKWyrHeptxxRpqf0FbBMGsi4lc1YZqQ11A','2023-05-25 06:22:42.450440'),('ku8grtjbgxo1pa8pkob487wmza760yc6','eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJyYW5rIjoyfQ:1nTvgQ:wW0WJl1ih-DJysBb2AoKEVVLAI33InsyU1tXwZGWabw','2022-03-29 01:09:06.149307'),('nmhvho004kzjzaev80xvwknso2ds1ct4','e30:1pao3P:EvznYQep8y-7sb1gkR7mEUKnkJgbHs_9-A72tMXpUrA','2023-03-25 01:29:47.568607'),('uefl3gn62j5gha7f5kr0iva7x723orv1','eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJyYW5rIjoyfQ:1pNq9W:T5kWcIsnl46eqxsDmfLKP1Huiv1U4IymdE2vUo9p1po','2023-02-17 07:06:30.958256');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

#
# Structure for table "radar"
#

DROP TABLE IF EXISTS `radar`;
CREATE TABLE `radar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `paramter` text,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "radar"
#

/*!40000 ALTER TABLE `radar` DISABLE KEYS */;
/*!40000 ALTER TABLE `radar` ENABLE KEYS */;

#
# Structure for table "sensor"
#

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `paramter` text,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "sensor"
#

/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (3,'12312','a','1212','2023-05-11 01:00:00'),(5,'332','2334','3433','2023-05-11 06:16:00');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;

#
# Structure for table "sys"
#

DROP TABLE IF EXISTS `sys`;
CREATE TABLE `sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "sys"
#

/*!40000 ALTER TABLE `sys` DISABLE KEYS */;
INSERT INTO `sys` VALUES (1,'sys_mangange','设备管理系统','设备管理系统','20230511','copy@2023');
/*!40000 ALTER TABLE `sys` ENABLE KEYS */;

#
# Structure for table "urls"
#

DROP TABLE IF EXISTS `urls`;
CREATE TABLE `urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `adr` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `rank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

#
# Data for table "urls"
#

/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,'/index','首页','index','2','2023-05-11 09:43:33'),(2,'/course','设备种类管理','course','2','2023-05-11 09:45:01'),(3,'/report','设备信息管理','report','2','2023-05-11 09:45:22'),(4,'/sys','网站系统设置','sys','2','2023-05-11 09:45:37');
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
