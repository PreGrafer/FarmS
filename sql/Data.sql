-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fast_agri_sys
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crops` (
  `crop_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `growth_cycle` int NOT NULL,
  `yield` float DEFAULT NULL,
  PRIMARY KEY (`crop_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
INSERT INTO `crops` VALUES (1,'玉米',120,1400),(3,'小麦',100,10000);
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `area` float NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `soil_type` varchar(50) NOT NULL,
  `current_crop_id` int DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `current_crop_id` (`current_crop_id`),
  CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`current_crop_id`) REFERENCES `crops` (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (3,1000,100,100,'1',3),(4,2404,424,100,'2',NULL),(5,10,10.15,150,'0',NULL),(6,11,15,124,'0',NULL),(7,12,15,124,'0',NULL),(8,13,15,124,'0',NULL),(9,14,15,124,'0',NULL),(10,15,15,124,'0',NULL),(11,16,15,124,'0',NULL),(12,17,15,124,'0',NULL),(13,18,15,124,'0',NULL),(14,19,15,124,'0',NULL),(15,20,15,124,'0',NULL),(16,21,15,124,'0',NULL),(17,22,15,124,'0',NULL),(18,23,15,124,'0',NULL),(19,24,15,124,'0',NULL),(20,25,15,124,'0',NULL),(21,26,15,124,'0',NULL),(22,27,15,124,'1',NULL);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (7,'crops','作物信息',NULL,NULL,'Crops','crud','element-plus','com.ruoyi.project.field','field','crops','作物信息','ruoyi','0','/','{\"parentMenuId\":2000}','admin','2024-06-30 19:40:56','','2024-07-02 23:49:03',NULL),(8,'fields','农田信息',NULL,NULL,'Fields','crud','element-plus','com.ruoyi.project.field','field','fields','农田信息','ruoyi','0','/','{\"parentMenuId\":2000}','admin','2024-06-30 19:40:56','','2024-07-02 23:48:57',NULL),(9,'harvestrecords','收获信息',NULL,NULL,'Harvestrecords','crud','element-plus','com.ruoyi.project.field','field','harvestrecords','收获信息','ruoyi','0','/','{\"parentMenuId\":2000}','admin','2024-06-30 19:40:56','','2024-07-02 23:48:51',NULL),(13,'sign_record','考勤记录表',NULL,NULL,'SignRecord','crud','element-plus','com.ruoyi.project.sign','sign','record','考勤记录','lsj','0','/','{\"parentMenuId\":2032}','admin','2024-07-01 21:30:16','','2024-07-02 23:48:43',NULL),(15,'leave_record','请假记录表',NULL,NULL,'LeaveRecord','crud','element-plus','com.ruoyi.project.sign','sign','leave','请假记录','lsj','0','/','{\"parentMenuId\":2032}','admin','2024-07-02 23:37:27','','2024-07-02 23:44:21',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (30,7,'crop_id','作物id','int','Long','cropId','1','1','0','0',NULL,'1','1','EQ','input','',1,'admin','2024-06-30 19:40:56','','2024-07-02 23:49:03'),(31,7,'name','作物名称','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-30 19:40:56','','2024-07-02 23:49:03'),(32,7,'growth_cycle','生长周期/天','int','Long','growthCycle','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-06-30 19:40:56','','2024-07-02 23:49:03'),(33,7,'yield','产量/亩','float','Long','yield','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-06-30 19:40:56','','2024-07-02 23:49:03'),(34,8,'field_id','农田id','int','Long','fieldId','1','1','0','0',NULL,'1','1','EQ','input','',1,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(35,8,'area','面积/亩','float','Double','area','0','0','1','1','1','1','0','EQ','input','',2,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(36,8,'latitude','纬度','float','Double','latitude','0','0','1','1','1','1','0','EQ','input','',3,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(37,8,'longitude','经度','float','Double','longitude','0','0','1','1','1','1','0','EQ','input','',4,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(38,8,'soil_type','土壤类型','varchar(50)','String','soilType','0','0','1','1','1','1','1','EQ','select','soil_type',5,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(39,8,'current_crop_id','当前种植的作物id','int','Long','currentCropId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:57'),(40,9,'harvest_id','收获记录id','int','Long','harvestId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:51'),(41,9,'Crop_id','作物id','int','Long','cropId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:51'),(42,9,'Field_id','农田id','int','Long','fieldId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:51'),(43,9,'harvest_date','收获时间','date','Date','harvestDate','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:51'),(44,9,'harvest_amount','收获数量','float','Long','harvestAmount','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-06-30 19:40:56','','2024-07-02 23:48:51'),(67,13,'record_id','考勤记录编号','bigint','Long','recordId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(68,13,'dept_id','部门编号','bigint','Long','deptId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(69,13,'user_id','员工编号','bigint','Long','userId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(70,13,'sign_time','时间','datetime','Date','signTime','0','0','0','1','1','1','0','EQ','datetime','',4,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(71,13,'sign_state','考勤状态','varchar(20)','String','signState','0','0','0','1','1','1','1','EQ','select','sign_state',5,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(72,13,'sign_type','考勤种类','varchar(20)','String','signType','0','0','0','1','1','1','1','EQ','select','sign_type',6,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(73,13,'update_time','记录更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',7,'admin','2024-07-01 21:30:16','','2024-07-02 23:48:43'),(83,15,'leave_id','记录编号','bigint','Long','leaveId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(84,15,'dept_id','部门编号','bigint','Long','deptId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(85,15,'user_id','员工编号','bigint','Long','userId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(86,15,'hanin_time','申请时间','datetime','Date','haninTime','0','0','0','1','1','1','1','EQ','datetime','',4,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(87,15,'leave_start_time','假期开始时间','date','Date','leaveStartTime','0','0','0','1','1','1','0','EQ','datetime','',5,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(88,15,'leave_end_time','假期结束时间','date','Date','leaveEndTime','0','0','0','1','1','1','0','EQ','datetime','',6,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(89,15,'leave_state','申请状态','int','Long','leaveState','0','0','0','1','1','1','1','EQ','select','holi_stage',7,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(90,15,'reason','请假事由','varchar(100)','String','reason','0','0','0','1','1','1','0','EQ','input','',8,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21'),(91,15,'reply','审批片语','varchar(100)','String','reply','0','0','0','1','1','1','0','EQ','input','',9,'admin','2024-07-02 23:37:27','','2024-07-02 23:44:21');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvestrecords`
--

DROP TABLE IF EXISTS `harvestrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harvestrecords` (
  `harvest_id` int NOT NULL AUTO_INCREMENT,
  `Crop_id` int DEFAULT NULL,
  `Field_id` int DEFAULT NULL,
  `harvest_date` date NOT NULL,
  `harvest_amount` float NOT NULL,
  PRIMARY KEY (`harvest_id`),
  KEY `Crop_id` (`Crop_id`),
  KEY `Field_id` (`Field_id`),
  CONSTRAINT `harvestrecords_ibfk_1` FOREIGN KEY (`Crop_id`) REFERENCES `crops` (`crop_id`),
  CONSTRAINT `harvestrecords_ibfk_2` FOREIGN KEY (`Field_id`) REFERENCES `fields` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvestrecords`
--

LOCK TABLES `harvestrecords` WRITE;
/*!40000 ALTER TABLE `harvestrecords` DISABLE KEYS */;
INSERT INTO `harvestrecords` VALUES (2,1,3,'2024-05-29',1000);
/*!40000 ALTER TABLE `harvestrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_record`
--

DROP TABLE IF EXISTS `leave_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_record` (
  `leave_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门编号',
  `user_id` bigint DEFAULT NULL COMMENT '员工编号',
  `hanin_time` datetime DEFAULT NULL COMMENT '申请时间',
  `leave_start_time` date DEFAULT NULL COMMENT '假期开始时间',
  `leave_end_time` date DEFAULT NULL COMMENT '假期结束时间',
  `leave_state` int DEFAULT NULL COMMENT '申请状态',
  `reason` varchar(100) DEFAULT NULL COMMENT '请假事由',
  `reply` varchar(100) DEFAULT NULL COMMENT '审批片语',
  PRIMARY KEY (`leave_id`),
  KEY `leave_record_ibfk_1` (`dept_id`),
  KEY `leave_record_ibfk_2` (`user_id`),
  CONSTRAINT `leave_record_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`) ON DELETE SET NULL,
  CONSTRAINT `leave_record_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_record`
--

LOCK TABLES `leave_record` WRITE;
/*!40000 ALTER TABLE `leave_record` DISABLE KEYS */;
INSERT INTO `leave_record` VALUES (2,103,2,'2024-07-09 00:00:00','2024-07-12','2024-07-19',0,NULL,NULL);
/*!40000 ALTER TABLE `leave_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_record`
--

DROP TABLE IF EXISTS `sign_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign_record` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '考勤记录编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门编号',
  `user_id` bigint DEFAULT NULL COMMENT '员工编号',
  `sign_time` datetime DEFAULT NULL COMMENT '时间',
  `sign_state` varchar(20) DEFAULT NULL COMMENT '考勤状态',
  `sign_type` varchar(20) DEFAULT NULL COMMENT '考勤种类',
  `update_time` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`record_id`),
  KEY `dept_id` (`dept_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sign_record_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`) ON DELETE SET NULL,
  CONSTRAINT `sign_record_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_record`
--

LOCK TABLES `sign_record` WRITE;
/*!40000 ALTER TABLE `sign_record` DISABLE KEYS */;
INSERT INTO `sign_record` VALUES (1,103,2,'2024-07-02 00:00:00','0','in',NULL),(2,103,2,'2024-07-01 00:00:00','1','out',NULL),(6,103,1,'2024-07-02 22:14:40','0','out','2024-07-02 22:14:40'),(7,103,1,'2024-07-02 22:15:09','1','in','2024-07-02 22:15:09'),(8,103,2,'2024-07-02 23:24:58','0','out','2024-07-02 23:24:58');
/*!40000 ALTER TABLE `sign_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-06-30 13:07:49','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-06-30 13:07:49','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-06-30 13:07:49','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-06-30 13:07:49','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-06-30 13:07:50','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-06-30 13:07:50','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','智慧农场',0,'李士杰','15888888888','lsj@qq.com','0','0','admin','2024-06-30 13:07:46','admin','2024-06-30 21:52:18'),(101,100,'0,100','北京总公司',0,'ZDC','15888888888','zdc@qq.com','0','0','admin','2024-06-30 13:07:46','admin','2024-07-01 21:17:18'),(103,101,'0,100,101','财务部门',0,'lpy','15888888888','lpy@qq.com','0','0','admin','2024-06-30 13:07:46','admin','2024-07-01 21:17:16');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-30 13:07:49','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-30 13:07:49','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-30 13:07:49','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-30 13:07:49','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-30 13:07:49','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-30 13:07:49','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-06-30 13:07:49','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-06-30 13:07:49','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-30 13:07:49','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-30 13:07:49','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-30 13:07:49','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-30 13:07:49','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-30 13:07:49','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-30 13:07:49','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-30 13:07:49','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-30 13:07:49','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-30 13:07:49','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-30 13:07:49','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-30 13:07:49','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-30 13:07:49','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-30 13:07:49','',NULL,'停用状态'),(100,0,'砂土','0','soil_type',NULL,'default','N','0','admin','2024-06-30 14:14:51','admin','2024-06-30 22:28:28',NULL),(101,1,'黑土','1','soil_type',NULL,'default','N','0','admin','2024-06-30 14:15:01','admin','2024-06-30 22:28:30',NULL),(102,2,'红土','2','soil_type',NULL,'default','N','0','admin','2024-06-30 14:15:12','admin','2024-06-30 22:28:33',NULL),(103,3,'其它','3','soil_type',NULL,'default','N','0','admin','2024-06-30 22:28:44','',NULL,NULL),(104,0,'正常','0','sign_state',NULL,'success','N','0','admin','2024-07-01 20:49:34','admin','2024-07-01 20:49:49',NULL),(105,1,'迟到/早退','1','sign_state',NULL,'warning','N','0','admin','2024-07-01 20:49:43','admin','2024-07-01 21:28:19',NULL),(106,2,'未签订','null','sign_state',NULL,'danger','N','0','admin','2024-07-01 20:50:03','admin','2024-07-01 20:50:15',NULL),(110,0,'签到','in','sign_type',NULL,'default','N','0','admin','2024-07-01 21:34:01','',NULL,NULL),(111,0,'签退','out','sign_type',NULL,'default','N','0','admin','2024-07-01 21:34:08','',NULL,NULL),(112,0,'已申请','0','holi_stage',NULL,'primary','N','0','admin','2024-07-02 23:27:15','admin','2024-07-02 23:27:23',NULL),(113,0,'已通过','1','holi_stage',NULL,'success','N','0','admin','2024-07-02 23:27:34','',NULL,NULL),(114,0,'未通过','2','holi_stage',NULL,'danger','N','0','admin','2024-07-02 23:27:59','admin','2024-07-02 23:28:02',NULL),(115,0,'已撤销','3','holi_stage',NULL,'info','N','0','admin','2024-07-02 23:28:18','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-30 13:07:49','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-30 13:07:49','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-30 13:07:49','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-30 13:07:49','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-30 13:07:49','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-06-30 13:07:49','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-06-30 13:07:49','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-06-30 13:07:49','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-06-30 13:07:49','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-06-30 13:07:49','',NULL,'登录状态列表'),(100,'土壤类型','soil_type','0','admin','2024-06-30 14:14:19','',NULL,NULL),(101,'考勤状态','sign_state','0','admin','2024-07-01 20:48:53','admin','2024-07-01 21:32:51','考勤状态'),(103,'考勤类型','sign_type','0','admin','2024-07-01 21:28:47','',NULL,NULL),(104,'请假进度','holi_stage','0','admin','2024-07-02 23:26:53','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-06-30 13:07:50','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-06-30 13:07:50','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-06-30 13:07:50','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 20:19:53'),(2,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:20:03'),(3,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 20:21:24'),(4,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:21:31'),(5,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 20:22:30'),(6,'lpy','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:22:35'),(7,'lpy','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 20:22:54'),(8,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:23:00'),(9,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:56:22'),(10,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 20:56:29'),(11,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 20:56:34'),(12,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 21:12:43'),(13,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 21:12:48'),(14,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 21:16:22'),(15,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-01 21:16:29'),(16,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 21:16:32'),(17,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 21:20:38'),(18,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-07-01 21:20:42'),(19,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 21:20:45'),(20,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-01 21:35:59'),(21,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-01 21:36:03'),(22,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 21:05:46'),(23,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 21:08:08'),(24,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 22:49:44'),(25,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-07-02 22:59:29'),(26,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 22:59:31'),(27,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 23:24:50'),(28,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-02 23:25:34'),(29,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 23:25:40'),(30,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 23:54:30'),(31,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-07-02 23:54:49'),(32,'zdc','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-07-02 23:54:52');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,0,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-06-30 13:07:47','admin','2024-07-01 20:57:37','系统管理目录'),(2,'系统监控',0,4,'monitor',NULL,'','',1,0,'M','1','0','','monitor','admin','2024-06-30 13:07:47','admin','2024-07-01 20:57:21','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-06-30 13:07:47','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-06-30 13:07:47','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-30 13:07:47','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-30 13:07:47','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-30 13:07:47','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-06-30 13:07:47','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-30 13:07:47','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-30 13:07:47','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-30 13:07:47','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-06-30 13:07:47','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-30 13:07:47','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-30 13:07:47','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-30 13:07:47','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-30 13:07:47','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-30 13:07:47','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-30 13:07:47','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-30 13:07:47','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-30 13:07:47','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','1','0','tool:swagger:list','swagger','admin','2024-06-30 13:07:47','admin','2024-06-30 21:55:22','系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-30 13:07:47','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-30 13:07:47','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-30 13:07:47','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-30 13:07:47','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-30 13:07:47','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-30 13:07:47','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-30 13:07:47','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-30 13:07:47','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-30 13:07:47','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-30 13:07:47','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-30 13:07:47','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-30 13:07:47','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-30 13:07:47','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-30 13:07:48','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-30 13:07:48','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-30 13:07:48','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-30 13:07:48','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-30 13:07:48','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-30 13:07:48','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-30 13:07:48','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-30 13:07:48','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-30 13:07:48','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-30 13:07:48','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-30 13:07:48','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-30 13:07:48','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-30 13:07:48','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-30 13:07:48','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-30 13:07:48','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-30 13:07:48','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-30 13:07:48','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-30 13:07:48','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-30 13:07:48','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-30 13:07:48','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-30 13:07:48','',NULL,''),(2000,'农田管理',0,2,'field',NULL,NULL,'',1,0,'M','0','0','','component','admin','2024-06-30 14:18:45','admin','2024-07-02 23:42:46',''),(2001,'作物信息',2000,1,'crops','field/crops/index',NULL,'',1,0,'C','0','0','field:crops:list','#','admin','2024-06-30 19:51:22','admin','2024-07-01 20:23:47','作物信息菜单'),(2002,'作物信息查询',2001,1,'#','',NULL,'',1,0,'F','0','0','field:crops:query','#','admin','2024-06-30 19:51:22','',NULL,''),(2003,'作物信息新增',2001,2,'#','',NULL,'',1,0,'F','0','0','field:crops:add','#','admin','2024-06-30 19:51:22','',NULL,''),(2004,'作物信息修改',2001,3,'#','',NULL,'',1,0,'F','0','0','field:crops:edit','#','admin','2024-06-30 19:51:22','',NULL,''),(2005,'作物信息删除',2001,4,'#','',NULL,'',1,0,'F','0','0','field:crops:remove','#','admin','2024-06-30 19:51:22','',NULL,''),(2006,'作物信息导出',2001,5,'#','',NULL,'',1,0,'F','0','0','field:crops:export','#','admin','2024-06-30 19:51:22','',NULL,''),(2013,'收获信息',2000,1,'harvestrecords','field/harvestrecords/index',NULL,'',1,0,'C','0','0','field:harvestrecords:list','#','admin','2024-06-30 19:51:40','admin','2024-07-01 20:23:45','收获信息菜单'),(2014,'收获信息查询',2013,1,'#','',NULL,'',1,0,'F','0','0','field:harvestrecords:query','#','admin','2024-06-30 19:51:40','',NULL,''),(2015,'收获信息新增',2013,2,'#','',NULL,'',1,0,'F','0','0','field:harvestrecords:add','#','admin','2024-06-30 19:51:41','',NULL,''),(2016,'收获信息修改',2013,3,'#','',NULL,'',1,0,'F','0','0','field:harvestrecords:edit','#','admin','2024-06-30 19:51:41','',NULL,''),(2017,'收获信息删除',2013,4,'#','',NULL,'',1,0,'F','0','0','field:harvestrecords:remove','#','admin','2024-06-30 19:51:41','',NULL,''),(2018,'收获信息导出',2013,5,'#','',NULL,'',1,0,'F','0','0','field:harvestrecords:export','#','admin','2024-06-30 19:51:41','',NULL,''),(2025,'农田信息',2000,1,'fields','field/fields/index',NULL,'',1,0,'C','0','0','field:fields:list','#','admin','2024-06-30 20:03:47','admin','2024-07-01 20:23:44','农田信息菜单'),(2026,'农田信息查询',2025,1,'#','',NULL,'',1,0,'F','0','0','field:fields:query','#','admin','2024-06-30 20:03:47','',NULL,''),(2027,'农田信息新增',2025,2,'#','',NULL,'',1,0,'F','0','0','field:fields:add','#','admin','2024-06-30 20:03:47','',NULL,''),(2028,'农田信息修改',2025,3,'#','',NULL,'',1,0,'F','0','0','field:fields:edit','#','admin','2024-06-30 20:03:47','',NULL,''),(2029,'农田信息删除',2025,4,'#','',NULL,'',1,0,'F','0','0','field:fields:remove','#','admin','2024-06-30 20:03:47','',NULL,''),(2030,'农田信息导出',2025,5,'#','',NULL,'',1,0,'F','0','0','field:fields:export','#','admin','2024-06-30 20:03:47','',NULL,''),(2031,'农田信息导入',2025,6,'',NULL,NULL,'',1,0,'F','0','0','field:fields:import','#','admin','2024-06-30 21:57:53','admin','2024-06-30 21:58:18',''),(2032,'考勤管理',0,1,'sign',NULL,NULL,'',1,0,'M','0','0','','date','admin','2024-07-01 20:57:10','admin','2024-07-01 21:02:24',''),(2033,'考勤记录',2032,1,'record','sign/record/index',NULL,'',1,0,'C','0','0','sign:record:list','#','admin','2024-07-01 20:58:46','admin','2024-07-01 21:38:16',''),(2034,'考勤记录新增',2033,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:add','#','admin','2024-07-01 21:14:32','',NULL,''),(2035,'考勤记录修改',2033,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:edit','#','admin','2024-07-01 21:14:59','',NULL,''),(2036,'考勤记录删除',2033,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:remove','#','admin','2024-07-01 21:15:24','',NULL,''),(2037,'考勤记录导出',2033,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:export','#','admin','2024-07-01 21:15:44','',NULL,''),(2038,'员工考勤',2032,0,'sign','sign/sign',NULL,'',1,0,'C','0','0','sign:sign','button','admin','2024-07-01 21:38:11','admin','2024-07-02 21:48:10',''),(2039,'签到/签退',2038,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:check','#','admin','2024-07-02 21:47:26','',NULL,''),(2040,'请假模块',2038,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:holi','#','admin','2024-07-02 23:24:12','',NULL,''),(2041,'请假记录',2032,1,'leave','sign/leave/index',NULL,'',1,0,'C','0','0','sign:leave:list','#','admin','2024-07-02 23:39:22','admin','2024-07-02 23:44:09','请假记录菜单'),(2042,'请假记录查询',2041,1,'#','',NULL,'',1,0,'F','0','0','sign:leave:query','#','admin','2024-07-02 23:39:22','admin','2024-07-02 23:45:10',''),(2043,'请假记录新增',2041,2,'#','',NULL,'',1,0,'F','0','0','sign:leave:add','#','admin','2024-07-02 23:39:22','admin','2024-07-02 23:45:13',''),(2044,'请假记录修改',2041,3,'#','',NULL,'',1,0,'F','0','0','sign:leave:edit','#','admin','2024-07-02 23:39:23','admin','2024-07-02 23:45:15',''),(2045,'请假记录删除',2041,4,'#','',NULL,'',1,0,'F','0','0','sign:leave:remove','#','admin','2024-07-02 23:39:23','admin','2024-07-02 23:45:17',''),(2046,'请假记录导出',2041,5,'#','',NULL,'',1,0,'F','0','0','sign:leave:export','#','admin','2024-07-02 23:39:23','admin','2024-07-02 23:45:20',''),(2047,'考勤记录查询',2033,1,'',NULL,NULL,'',1,0,'F','0','0','sign:record:query','#','admin','2024-07-02 23:52:16','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-30 13:07:50','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-30 13:07:50','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.ruoyi.project.monitor.controller.SysOperlogController.clean()','DELETE',1,'admin','财务部门','/monitor/operlog/clean','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:14:32',19),(2,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin','财务部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:17:29',16),(3,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:19:20',13),(4,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:19:41',19),(5,'角色管理',1,'com.ruoyi.project.system.controller.SysRoleController.add()','POST',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:20:42',19),(6,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:20:48',26),(7,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:20:53',20),(8,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2013,2025,2002,2006,2014,2018,2026,2030],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:21:16',27),(9,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin','财务部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"李鹏宇\",\"params\":{},\"postIds\":[2],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"lpy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:22:21',88),(10,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin','财务部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:22:21\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"李鹏宇\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"lpy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:22:24',7),(11,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:22:51',10),(12,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/crops/index\",\"createTime\":\"2024-06-30 19:51:22\",\"icon\":\"#\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"作物信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"crops\",\"perms\":\"field:crops:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:26',21),(13,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/harvestrecords/index\",\"createTime\":\"2024-06-30 19:51:40\",\"icon\":\"#\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"收获信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"harvestrecords\",\"perms\":\"field:harvestrecords:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:29',5),(14,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/fields/index\",\"createTime\":\"2024-06-30 20:03:47\",\"icon\":\"#\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"农田信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"fields\",\"perms\":\"field:fields:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:34',5),(15,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/fields/index\",\"createTime\":\"2024-06-30 20:03:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"农田信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"fields\",\"perms\":\"field:fields:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:44',4),(16,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/harvestrecords/index\",\"createTime\":\"2024-06-30 19:51:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"收获信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"harvestrecords\",\"perms\":\"field:harvestrecords:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:45',4),(17,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"field/crops/index\",\"createTime\":\"2024-06-30 19:51:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"作物信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"crops\",\"perms\":\"field:crops:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:23:47',16),(18,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table if not exists sign_record\\n(\\n    RECORD_ID      int auto_increment comment \'签到记录编号\'\\n        primary key,\\n    DEPARTMENT_ID  int         null comment \'部门编号\',\\n    STAFF_ID       varchar(11) null comment \'员工编号\',\\n    SIGN_IN_TIME   datetime    null comment \'签到时间\',\\n    SIGN_IN_STATE  varchar(20) null comment \'1-迟到 0-正常 null-未签到\',\\n    SIGN_OUT_TIME  datetime    null comment \'签退时间\',\\n    SIGN_OUT_STATE varchar(20) null comment \'1-早退 0-正常 null-未签退\',\\n    UPDATE_TIME    datetime    null comment \'记录更新时间\',\\n    constraint sign_record_ibfk_1\\n        foreign key (DEPARTMENT_ID) references sys_dept (dept_id)\\n            on delete set null,\\n    constraint sign_record_ibfk_2\\n        foreign key (STAFF_ID) references sys_user (user_id)\\n            on delete set null\\n)\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:24:20',0),(19,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE IF NOT EXISTS sign_record (\\n    RECORD_ID INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    DEPARTMENT_ID INT NULL COMMENT \'部门编号\',\\n    STAFF_ID VARCHAR(11) NULL COMMENT \'员工编号\',\\n    SIGN_IN_TIME DATETIME NULL COMMENT \'签到时间\',\\n    SIGN_IN_STATE VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    SIGN_OUT_TIME DATETIME NULL COMMENT \'签退时间\',\\n    SIGN_OUT_STATE VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    UPDATE_TIME DATETIME NULL COMMENT \'记录更新时间\',\\n    CONSTRAINT sign_record_ibfk_1 FOREIGN KEY (DEPARTMENT_ID) REFERENCES sys_dept (dept_id) ON DELETE SET NULL,\\n    CONSTRAINT sign_record_ibfk_2 FOREIGN KEY (STAFF_ID) REFERENCES sys_user (user_id) ON DELETE SET NULL\\n)\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:26:39',2),(20,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    RECORD_ID INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    DEPARTMENT_ID INT NULL COMMENT \'部门编号\',\\n    STAFF_ID VARCHAR(11) NULL COMMENT \'员工编号\',\\n    SIGN_IN_TIME DATETIME NULL COMMENT \'签到时间\',\\n    SIGN_IN_STATE VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    SIGN_OUT_TIME DATETIME NULL COMMENT \'签退时间\',\\n    SIGN_OUT_STATE VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    UPDATE_TIME DATETIME NULL COMMENT \'记录更新时间\',\\n    CONSTRAINT sign_record_ibfk_1 FOREIGN KEY (DEPARTMENT_ID) REFERENCES sys_dept (dept_id) ON DELETE SET NULL,\\n    CONSTRAINT sign_record_ibfk_2 FOREIGN KEY (STAFF_ID) REFERENCES sys_user (user_id) ON DELETE SET NULL\\n)\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:27:26',0),(21,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    RECORD_ID INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    DEPARTMENT_ID INT NULL COMMENT \'部门编号\',\\n    STAFF_ID VARCHAR(11) NULL COMMENT \'员工编号\',\\n    SIGN_IN_TIME DATETIME NULL COMMENT \'签到时间\',\\n    SIGN_IN_STATE VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    SIGN_OUT_TIME DATETIME NULL COMMENT \'签退时间\',\\n    SIGN_OUT_STATE VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    UPDATE_TIME DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (DEPARTMENT_ID) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (STAFF_ID) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) \"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:28:54',0),(22,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    RECORD_ID INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    DEPARTMENT_ID INT NULL COMMENT \'部门编号\',\\n    STAFF_ID VARCHAR(11) NULL COMMENT \'员工编号\',\\n    SIGN_IN_TIME DATETIME NULL COMMENT \'签到时间\',\\n    SIGN_IN_STATE VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    SIGN_OUT_TIME DATETIME NULL COMMENT \'签退时间\',\\n    SIGN_OUT_STATE VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    UPDATE_TIME DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (DEPARTMENT_ID) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (STAFF_ID) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n)\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:28:56',0),(23,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    department_id INT NULL COMMENT \'部门编号\',\\n    staff_id VARCHAR(11) NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (department_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (staff_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:30:34',2),(24,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT PRIMARY KEY,\\n    department_id INT NULL,\\n    staff_id VARCHAR(11) NULL,\\n    sign_in_time DATETIME NULL,\\n    sign_in_state VARCHAR(20) NULL,\\n    sign_out_time DATETIME NULL,\\n    sign_out_state VARCHAR(20) NULL,\\n    update_time DATETIME NULL,\\n    FOREIGN KEY (department_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (staff_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:31:54',7),(25,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT PRIMARY KEY,\\n    department_id INT NULL,\\n    staff_id VARCHAR(11) NULL,\\n    sign_in_time DATETIME NULL,\\n    sign_in_state VARCHAR(20) NULL,\\n    sign_out_time DATETIME NULL,\\n    sign_out_state VARCHAR(20) NULL,\\n    update_time DATETIME NULL,\\n    FOREIGN KEY (department_id) REFERENCES sys_dept(dept_id),\\n    FOREIGN KEY (staff_id) REFERENCES sys_user(user_id)\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:31:59',111),(26,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record(\\n    record_id INT AUTO_INCREMENT PRIMARY KEY,\\n    department_id INT NULL,\\n    staff_id VARCHAR(11) NULL,\\n    sign_in_time DATETIME NULL,\\n    sign_in_state VARCHAR(20) NULL,\\n    sign_out_time DATETIME NULL,\\n    sign_out_state VARCHAR(20) NULL,\\n    update_time DATETIME NULL,\\n    FOREIGN KEY (department_id) REFERENCES sys_dept(dept_id),\\n    FOREIGN KEY (staff_id) REFERENCES sys_user(user_id)\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:32:05',4),(27,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:33:55',0),(28,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:34:01',0),(29,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:34:02',3),(30,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:34:03',1),(31,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id INT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:35:12',1),(32,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id bigint AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id bigint NULL COMMENT \'部门编号\',\\n    user_id bigint NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:35:30',0),(33,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:38:52',5),(34,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:38:58',1),(35,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:42:39',170),(36,'代码生成',3,'com.ruoyi.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','财务部门','/tool/gen/10','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:43:21',19),(37,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:44:10',10),(38,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n);\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 20:45:12',12),(39,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'签到记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_in_time DATETIME NULL COMMENT \'签到时间\',\\n    sign_in_state VARCHAR(20) NULL COMMENT \'1-迟到 0-正常 null-未签到\',\\n    sign_out_time DATETIME NULL COMMENT \'签退时间\',\\n    sign_out_state VARCHAR(20) NULL COMMENT \'1-早退 0-正常 null-未签退\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id),\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id)\\n);\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:45:31',105),(40,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"签到状态\",\"dictType\":\"sign_in_state\",\"params\":{},\"remark\":\"签到状态\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:48:53',18),(41,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sign_in_state\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:49:34',23),(42,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"迟到\",\"dictSort\":1,\"dictType\":\"sign_in_state\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:49:43',6),(43,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:49:34\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sign_in_state\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:49:49',18),(44,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无数据\",\"dictSort\":2,\"dictType\":\"sign_in_state\",\"dictValue\":\"null\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:03',19),(45,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:50:03\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"未签订\",\"dictSort\":2,\"dictType\":\"sign_in_state\",\"dictValue\":\"null\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:15',19),(46,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:49:43\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"迟到\",\"dictSort\":1,\"dictType\":\"sign_in_state\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:17',6),(47,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"签退状态\",\"dictType\":\"sign_out_state\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:40',18),(48,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sign_out_state\",\"dictValue\":\"0\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:49',18),(49,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"早退\",\"dictSort\":1,\"dictType\":\"sign_out_state\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:50:59',18),(50,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未签退\",\"dictSort\":0,\"dictType\":\"sign_out_state\",\"dictValue\":\"null\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:51:19',19),(51,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"签到记录编号\",\"columnId\":53,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":54,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":55,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SignInTime\",\"columnComment\":\"签到时间\",\"columnId\":56,\"columnName\":\"sign_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:52:31',31),(52,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"签到记录编号\",\"columnId\":53,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:31\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":54,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:31\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":55,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:31\",\"usableColumn\":false},{\"capJavaField\":\"SignInTime\",\"columnComment\":\"签到时间\",\"columnId\":56,\"columnName\":\"sign_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:52:52',26),(53,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"签到记录编号\",\"columnId\":53,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:52\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":54,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:52\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":55,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:52:52\",\"usableColumn\":false},{\"capJavaField\":\"SignInTime\",\"columnComment\":\"签到时间\",\"columnId\":56,\"columnName\":\"sign_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:53:05',18),(54,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sign_record\"}',NULL,0,NULL,'2024-07-01 20:53:08',175),(55,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"签到记录编号\",\"columnId\":53,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:53:05\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":54,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:53:05\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":55,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:53:05\",\"usableColumn\":false},{\"capJavaField\":\"SignInTime\",\"columnComment\":\"签到时间\",\"columnId\":56,\"columnName\":\"sign_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:54:00',24),(56,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sign_record\"}',NULL,0,NULL,'2024-07-01 20:54:02',32),(57,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"签到管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"sign\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:57:10',30),(58,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-30 14:18:45\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"农田信息管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"field\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:57:17',18),(59,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-30 13:07:47\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:57:21',21),(60,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-30 13:07:47\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:57:38',6),(61,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"record\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:58:46',6),(62,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/record/index\",\"createTime\":\"2024-07-01 20:58:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"考勤记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"record\",\"perms\":\"sign:record:index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 20:59:40',16),(63,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"签到记录编号\",\"columnId\":53,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:54:00\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":54,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:54:00\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":55,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 20:54:00\",\"usableColumn\":false},{\"capJavaField\":\"SignInTime\",\"columnComment\":\"签到时间\",\"columnId\":56,\"columnName\":\"sign_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:45:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:00:14',37),(64,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sign_record\"}',NULL,0,NULL,'2024-07-01 21:00:21',114),(65,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:02:11',17),(66,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:02:15',12),(67,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-07-01 20:57:10\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"考勤管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"sign\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:02:24',7),(68,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin','财务部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:11:51',7),(69,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin','财务部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:11:58',14),(70,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin','财务部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:12:20',16),(71,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:12:32',21),(72,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:12:57',20),(73,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/record/index\",\"createTime\":\"2024-07-01 20:58:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"考勤记录\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"record\",\"perms\":\"sign:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:13:20',16),(74,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"sign:record:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:14:32',17),(75,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"sign:record:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:14:59',2),(76,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"sign:record:remove\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:15:24',5),(77,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"sign:record:export\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:15:44',15),(78,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2034,2035,2036,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:16:05',19),(79,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2034,2035,2036,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:16:10',22),(80,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin','财务部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"财务部门\",\"email\":\"lpy@qq.com\",\"leader\":\"lpy\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"parentName\":\"北京总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:17:16',10),(81,'部门管理',2,'com.ruoyi.project.system.controller.SysDeptController.edit()','PUT',1,'admin','财务部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"北京总公司\",\"email\":\"zdc@qq.com\",\"leader\":\"ZDC\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"智慧农场\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:17:18',22),(82,'签到记录',1,'com.ruoyi.project.sign.controller.SignRecordController.add()','POST',1,'zdc','财务部门','/sign/record','127.0.0.1','内网IP','{\"deptId\":103,\"params\":{},\"recordId\":1,\"signInState\":\"0\",\"signInTime\":\"2024-07-01\",\"signOutState\":\"0\",\"signOutTime\":\"2024-07-01\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:18:05',10),(83,'签到记录',1,'com.ruoyi.project.sign.controller.SignRecordController.add()','POST',1,'zdc','财务部门','/sign/record','127.0.0.1','内网IP','{\"deptId\":103,\"params\":{},\"recordId\":2,\"signInState\":\"1\",\"signInTime\":\"2024-07-10\",\"signOutState\":\"0\",\"signOutTime\":\"2024-07-03\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:18:21',1),(84,'签到记录',3,'com.ruoyi.project.sign.controller.SignRecordController.remove()','DELETE',1,'zdc','财务部门','/sign/record/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:18:47',0),(85,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:20:33',17),(86,'字典类型',2,'com.ruoyi.project.system.controller.SysDictTypeController.edit()','PUT',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:48:53\",\"dictId\":101,\"dictName\":\"签到状态\",\"dictType\":\"sign_state\",\"params\":{},\"remark\":\"考勤状态\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:22:55',10),(87,'字典类型',3,'com.ruoyi.project.system.controller.SysDictTypeController.remove()','DELETE',1,'admin','财务部门','/system/dict/type/102','127.0.0.1','内网IP','{}',NULL,1,'签退状态已分配,不能删除','2024-07-01 21:22:58',4),(88,'代码生成',3,'com.ruoyi.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','财务部门','/tool/gen/11','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:23:36',6),(89,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'考勤记录编号\' PRIMARY KEY,\\n    dept_name BIGINT NULL COMMENT \'部门名称\',\\n    user_name BIGINT NULL COMMENT \'员工名称\',\\n    sign_time DATETIME NULL COMMENT \'时间\',\\n    sign_state VARCHAR(20) NULL COMMENT \'考勤状态\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_name) REFERENCES sys_dept(dept_name) ON DELETE SET NULL,\\n    FOREIGN KEY (user_name) REFERENCES sys_user(user_name) ON DELETE SET NULL\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 21:25:54',127),(90,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'考勤记录编号\' PRIMARY KEY,\\n    dept_name BIGINT NULL COMMENT \'部门名称\',\\n    user_name BIGINT NULL COMMENT \'员工名称\',\\n    sign_time DATETIME NULL COMMENT \'时间\',\\n    sign_state VARCHAR(20) NULL COMMENT \'考勤状态\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_name) REFERENCES sys_dept(dept_name),\\n    FOREIGN KEY (user_name) REFERENCES sys_user(user_name)\\n) ;\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2024-07-01 21:25:59',9),(91,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'考勤记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_time DATETIME NULL COMMENT \'时间\',\\n    sign_state VARCHAR(20) NULL COMMENT \'考勤状态\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) ;\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:27:55',55),(92,'字典类型',3,'com.ruoyi.project.system.controller.SysDictTypeController.remove()','DELETE',1,'admin','财务部门','/system/dict/type/102','127.0.0.1','内网IP','{}',NULL,1,'签退状态已分配,不能删除','2024-07-01 21:28:05',3),(93,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:49:43\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"迟到/早退\",\"dictSort\":1,\"dictType\":\"sign_state\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:28:19',3),(94,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"考勤类型\",\"dictType\":\"sign_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:28:47',14),(95,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"CREATE TABLE sign_record (\\n    record_id BIGINT AUTO_INCREMENT COMMENT \'考勤记录编号\' PRIMARY KEY,\\n    dept_id BIGINT NULL COMMENT \'部门编号\',\\n    user_id BIGINT NULL COMMENT \'员工编号\',\\n    sign_time DATETIME NULL COMMENT \'时间\',\\n    sign_state VARCHAR(20) NULL COMMENT \'考勤状态\',\\n    sign_type VARCHAR(20) NULL COMMENT \'考勤种类\',\\n    update_time DATETIME NULL COMMENT \'记录更新时间\',\\n    FOREIGN KEY (dept_id) REFERENCES sys_dept(dept_id) ON DELETE SET NULL,\\n    FOREIGN KEY (user_id) REFERENCES sys_user(user_id) ON DELETE SET NULL\\n) ;\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:30:16',37),(96,'代码生成',3,'com.ruoyi.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','财务部门','/tool/gen/12','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:30:25',6),(97,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.synchDb()','GET',1,'admin','财务部门','/tool/gen/synchDb/sign_record','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:30:26',25),(98,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"考勤记录编号\",\"columnId\":67,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:30:26\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":68,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:30:26\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":69,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:30:26\",\"usableColumn\":false},{\"capJavaField\":\"SignTime\",\"columnComment\":\"时间\",\"columnId\":70,\"columnName\":\"sign_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEd','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:31:38',12),(99,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sign_record\"}',NULL,0,NULL,'2024-07-01 21:31:40',59),(100,'字典类型',3,'com.ruoyi.project.system.controller.SysDictTypeController.remove()','DELETE',1,'admin','财务部门','/system/dict/type/102','127.0.0.1','内网IP','{}',NULL,1,'签退状态已分配,不能删除','2024-07-01 21:32:45',8),(101,'字典类型',2,'com.ruoyi.project.system.controller.SysDictTypeController.edit()','PUT',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-01 20:48:53\",\"dictId\":101,\"dictName\":\"考勤状态\",\"dictType\":\"sign_state\",\"params\":{},\"remark\":\"考勤状态\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:32:51',43),(102,'字典类型',3,'com.ruoyi.project.system.controller.SysDictDataController.remove()','DELETE',1,'admin','财务部门','/system/dict/data/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:33:14',11),(103,'字典类型',3,'com.ruoyi.project.system.controller.SysDictDataController.remove()','DELETE',1,'admin','财务部门','/system/dict/data/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:33:15',18),(104,'字典类型',3,'com.ruoyi.project.system.controller.SysDictDataController.remove()','DELETE',1,'admin','财务部门','/system/dict/data/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:33:16',6),(105,'字典类型',3,'com.ruoyi.project.system.controller.SysDictTypeController.remove()','DELETE',1,'admin','财务部门','/system/dict/type/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:33:19',17),(106,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"签到\",\"dictSort\":0,\"dictType\":\"sign_type\",\"dictValue\":\"in\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:34:01',6),(107,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"签退\",\"dictSort\":0,\"dictType\":\"sign_type\",\"dictValue\":\"out\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:34:08',18),(108,'考勤记录',1,'com.ruoyi.project.sign.controller.SignRecordController.add()','POST',1,'admin','财务部门','/sign/record','127.0.0.1','内网IP','{\"deptId\":103,\"params\":{},\"recordId\":1,\"signState\":\"0\",\"signTime\":\"2024-07-02\",\"signType\":\"in\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:34:29',12),(109,'考勤记录',1,'com.ruoyi.project.sign.controller.SignRecordController.add()','POST',1,'admin','财务部门','/sign/record','127.0.0.1','内网IP','{\"deptId\":103,\"params\":{},\"recordId\":2,\"signState\":\"1\",\"signTime\":\"2024-07-01\",\"signType\":\"out\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:34:39',14),(110,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/record/index\",\"createTime\":\"2024-07-01 20:58:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"考勤记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"record\",\"perms\":\"sign:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:37:29',24),(111,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"签到/签退\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"sign\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:38:11',19),(112,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/record/index\",\"createTime\":\"2024-07-01 20:58:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"考勤记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"record\",\"perms\":\"sign:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:38:16',16),(113,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/sign\",\"createTime\":\"2024-07-01 21:38:11\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"签到/签退\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"sign\",\"perms\":\"sign:sign\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:38:31',17),(114,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/sign\",\"createTime\":\"2024-07-01 21:38:11\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"签到/签退\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"sign\",\"perms\":\"sign:sign\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-01 21:40:23',6),(115,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"签到/签退\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2038,\"perms\":\"sign:record:check\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 21:47:26',90),(116,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/sign\",\"createTime\":\"2024-07-01 21:38:11\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"员工考勤\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2032,\"path\":\"sign\",\"perms\":\"sign:sign\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 21:48:10',9),(117,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'admin','财务部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 21:49:34',84),(118,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'admin','财务部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 21:49:35',74),(119,'考勤记录',2,'com.ruoyi.project.sign.controller.SignRecordController.edit()','PUT',1,'admin','财务部门','/sign/record','127.0.0.1','内网IP','{\"deptId\":103,\"params\":{},\"recordId\":4,\"signState\":\"0\",\"signTime\":\"2024-07-16\",\"signType\":\"out\",\"updateTime\":\"2024-07-02 22:11:08\",\"userId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:11:08',24),(120,'考勤记录',3,'com.ruoyi.project.sign.controller.SignRecordController.remove()','DELETE',1,'admin','财务部门','/sign/record/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:11:10',5),(121,'考勤记录',3,'com.ruoyi.project.sign.controller.SignRecordController.remove()','DELETE',1,'admin','财务部门','/sign/record/5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:14:37',9),(122,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2038,2039,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:15:42',34),(123,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2038,2039,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:15:46',15),(124,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2038,2039,2033,2034,2035,2036,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 22:15:50',21),(125,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假模块\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2038,\"perms\":\"sign:record:holi\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:24:12',17),(126,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2038,2039,2040,2033,2034,2035,2036,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:24:22',12),(127,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2038,2039,2040,2033,2034,2035,2036,2037,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:25:31',18),(128,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','财务部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"请假进度\",\"dictType\":\"holi_stage\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:26:53',11),(129,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已申请\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:27:15',7),(130,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:27:15\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"已申请\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:27:20',6),(131,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:27:15\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"已申请\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:27:23',7),(132,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已通过\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:27:34',18),(133,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:27:59',16),(134,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:27:59\",\"default\":false,\"dictCode\":114,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:28:02',7),(135,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','财务部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已撤销\",\"dictSort\":0,\"dictType\":\"holi_stage\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:28:18',13),(136,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table if not exists leave_record\\n(\\n    leave_id  bigint auto_increment comment \'记录编号\' primary key,\\n    dept_id     bigint null comment \'部门编号\',\\n    user_id     bigint comment \'员工编号\',\\n    hanin_time   datetime null comment \'申请时间\',\\n    leave_start_time  date null comment \'假期开始时间\',\\n    leave_end_time   date null comment \'假期结束时间\',\\n    leave_state int null comment \'申请状态\',\\n    reason   varchar(100) null comment \'请假事由\',\\n    reply    varchar(100) null comment \'审批片语\',\\nCONSTRAINT leave_record_ibfk_1\\n        FOREIGN KEY (dept_id) REFERENCES  sys_dept (dept_id)\\n            ON DELETE SET NULL,\\n    CONSTRAINT leave_record_ibfk_2\\n        FOREIGN KEY (user_id) REFERENCES sys_user (user_id)\\n);\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:34:03',150),(137,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"leave\",\"className\":\"LeaveRecord\",\"columns\":[{\"capJavaField\":\"LeaveId\",\"columnComment\":\"请假编号\",\"columnId\":74,\"columnName\":\"leave_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:34:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leaveId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":75,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:34:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":76,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:34:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HaninTime\",\"columnComment\":\"申请时间\",\"columnId\":77,\"columnName\":\"hanin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:34:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:35:29',25),(138,'代码生成',3,'com.ruoyi.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','财务部门','/tool/gen/14','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:37:18',15),(139,'创建表',0,'com.ruoyi.project.tool.gen.controller.GenController.createTableSave()','POST',1,'admin','财务部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table if not exists leave_record\\n(\\n    leave_id  bigint auto_increment comment \'记录编号\' primary key,\\n    dept_id     bigint null comment \'部门编号\',\\n    user_id     bigint comment \'员工编号\',\\n    hanin_time   date null comment \'申请时间\',\\n    leave_start_time  date null comment \'假期开始时间\',\\n    leave_end_time   date null comment \'假期结束时间\',\\n    leave_state int null comment \'申请状态\',\\n    reason   varchar(100) null comment \'请假事由\',\\n    reply    varchar(100) null comment \'审批片语\',\\nCONSTRAINT leave_record_ibfk_1\\n        FOREIGN KEY (dept_id) REFERENCES  sys_dept (dept_id)\\n            ON DELETE SET NULL,\\n    CONSTRAINT leave_record_ibfk_2\\n        FOREIGN KEY (user_id) REFERENCES sys_user (user_id)\\n);\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:37:27',27),(140,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"leave\",\"className\":\"LeaveRecord\",\"columns\":[{\"capJavaField\":\"LeaveId\",\"columnComment\":\"记录编号\",\"columnId\":83,\"columnName\":\"leave_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leaveId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":84,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":85,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HaninTime\",\"columnComment\":\"申请时间\",\"columnId\":86,\"columnName\":\"hanin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:38:38',28),(141,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"leave_record\"}',NULL,0,NULL,'2024-07-02 23:38:40',43),(142,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"leave\",\"className\":\"LeaveRecord\",\"columns\":[{\"capJavaField\":\"LeaveId\",\"columnComment\":\"记录编号\",\"columnId\":83,\"columnName\":\"leave_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leaveId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:38:38\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":84,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:38:38\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":85,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:38:38\",\"usableColumn\":false},{\"capJavaField\":\"HaninTime\",\"columnComment\":\"申请时间\",\"columnId\":86,\"columnName\":\"hanin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:41:12',43),(143,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"leave_record\"}',NULL,0,NULL,'2024-07-02 23:41:15',29),(144,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-06-30 14:18:45\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"农田管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"field\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:42:46',24),(145,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"leave/leave/index\",\"createTime\":\"2024-07-02 23:39:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"请假记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"leave\",\"perms\":\"leave:leave:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:43:31',18),(146,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sign/leave/index\",\"createTime\":\"2024-07-02 23:39:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"请假记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"path\":\"leave\",\"perms\":\"sign:leave:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:44:09',8),(147,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"leave\",\"className\":\"LeaveRecord\",\"columns\":[{\"capJavaField\":\"LeaveId\",\"columnComment\":\"记录编号\",\"columnId\":83,\"columnName\":\"leave_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leaveId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:41:12\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":84,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:41:12\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":85,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2024-07-02 23:41:12\",\"usableColumn\":false},{\"capJavaField\":\"HaninTime\",\"columnComment\":\"申请时间\",\"columnId\":86,\"columnName\":\"hanin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 23:37:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:44:21',48),(148,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','财务部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"leave_record\"}',NULL,0,NULL,'2024-07-02 23:44:22',125),(149,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-02 23:39:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"请假记录查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"#\",\"perms\":\"sign:leave:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:45:10',15),(150,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-02 23:39:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"请假记录新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2041,\"path\":\"#\",\"perms\":\"sign:leave:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:45:13',17),(151,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-02 23:39:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"请假记录修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2041,\"path\":\"#\",\"perms\":\"sign:leave:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:45:15',7),(152,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-02 23:39:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2045,\"menuName\":\"请假记录删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2041,\"path\":\"#\",\"perms\":\"sign:leave:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:45:17',7),(153,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-07-02 23:39:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"请假记录导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2041,\"path\":\"#\",\"perms\":\"sign:leave:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:45:20',18),(154,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"record\",\"className\":\"SignRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"考勤记录编号\",\"columnId\":67,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:31:38\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"部门编号\",\"columnId\":68,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:31:38\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工编号\",\"columnId\":69,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2024-07-01 21:31:38\",\"usableColumn\":false},{\"capJavaField\":\"SignTime\",\"columnComment\":\"时间\",\"columnId\":70,\"columnName\":\"sign_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-07-01 21:30:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEd','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:48:43',25),(155,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"harvestrecords\",\"className\":\"Harvestrecords\",\"columns\":[{\"capJavaField\":\"HarvestId\",\"columnComment\":\"收获记录id\",\"columnId\":40,\"columnName\":\"harvest_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"harvestId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:50:06\",\"usableColumn\":false},{\"capJavaField\":\"CropId\",\"columnComment\":\"作物id\",\"columnId\":41,\"columnName\":\"Crop_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"cropId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:50:06\",\"usableColumn\":false},{\"capJavaField\":\"FieldId\",\"columnComment\":\"农田id\",\"columnId\":42,\"columnName\":\"Field_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fieldId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:50:06\",\"usableColumn\":false},{\"capJavaField\":\"HarvestDate\",\"columnComment\":\"收获时间\",\"columnId\":43,\"columnName\":\"harvest_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":tr','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:48:51',23),(156,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"fields\",\"className\":\"Fields\",\"columns\":[{\"capJavaField\":\"FieldId\",\"columnComment\":\"农田id\",\"columnId\":34,\"columnName\":\"field_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"fieldId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 21:57:04\",\"usableColumn\":false},{\"capJavaField\":\"Area\",\"columnComment\":\"面积/亩\",\"columnId\":35,\"columnName\":\"area\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"area\",\"javaType\":\"Double\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 21:57:04\",\"usableColumn\":false},{\"capJavaField\":\"Latitude\",\"columnComment\":\"纬度\",\"columnId\":36,\"columnName\":\"latitude\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"latitude\",\"javaType\":\"Double\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 21:57:04\",\"usableColumn\":false},{\"capJavaField\":\"Longitude\",\"columnComment\":\"经度\",\"columnId\":37,\"columnName\":\"longitude\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:48:57',12),(157,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','财务部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"crops\",\"className\":\"Crops\",\"columns\":[{\"capJavaField\":\"CropId\",\"columnComment\":\"作物id\",\"columnId\":30,\"columnName\":\"crop_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"cropId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:43:44\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"作物名称\",\"columnId\":31,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:43:44\",\"usableColumn\":false},{\"capJavaField\":\"GrowthCycle\",\"columnComment\":\"生长周期/天\",\"columnId\":32,\"columnName\":\"growth_cycle\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"growthCycle\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-06-30 19:43:44\",\"usableColumn\":false},{\"capJavaField\":\"Yield\",\"columnComment\":\"产量/亩\",\"columnId\":33,\"columnName\":\"yield\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2024-06-30 19:40:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":t','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:49:03',21),(158,'请假记录',1,'com.ruoyi.project.sign.controller.LeaveRecordController.add()','POST',1,'admin','财务部门','/sign/leave','127.0.0.1','内网IP','{\"deptId\":103,\"haninTime\":\"2024-07-09\",\"leaveEndTime\":\"2024-07-12\",\"leaveId\":1,\"leaveStartTime\":\"2024-07-11\",\"leaveState\":0,\"params\":{},\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:50:03',11),(159,'请假记录',3,'com.ruoyi.project.sign.controller.LeaveRecordController.remove()','DELETE',1,'admin','财务部门','/sign/leave/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:50:35',17),(160,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2034,2037,2042,2043,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:51:21',30),(161,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2037,2042,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:51:35',24),(162,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2034,2037,2042,2043,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:51:47',12),(163,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin','财务部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"考勤记录查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"sign:record:query\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:52:16',47),(164,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2037,2047,2042,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:52:25',20),(165,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-07-01 20:20:42\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2034,2037,2047,2042,2043,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:52:29',23),(166,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2037,2042,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:54:46',11),(167,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin','财务部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-06-30 13:07:47\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2041,2038,2039,2040,2037,2047,2042,2046,2000,2001,2002,2003,2004,2005,2006,2013,2014,2015,2016,2017,2018,2025,2026,2027,2028,2029,2030,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:56:38',21),(168,'请假记录',1,'com.ruoyi.project.sign.controller.LeaveRecordController.add()','POST',1,'admin','财务部门','/sign/leave','127.0.0.1','内网IP','{\"deptId\":103,\"haninTime\":\"2024-07-09\",\"leaveEndTime\":\"2024-07-19\",\"leaveId\":2,\"leaveStartTime\":\"2024-07-12\",\"leaveState\":0,\"params\":{},\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-07-02 23:56:57',4);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-30 13:07:47','',NULL,''),(2,'mana','经理',2,'0','admin','2024-06-30 13:07:47','',NULL,''),(3,'user','普通员工',3,'0','admin','2024-06-30 13:07:47','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-30 13:07:47','',NULL,'超级管理员'),(2,'普通角色','common',2,'5',1,1,'0','0','admin','2024-06-30 13:07:47','admin','2024-07-02 23:56:38','普通角色'),(100,'经理','manager',3,'4',1,1,'0','0','admin','2024-07-01 20:20:42','admin','2024-07-02 23:52:29',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2006),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2025),(2,2026),(2,2027),(2,2028),(2,2029),(2,2030),(2,2031),(2,2032),(2,2033),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2042),(2,2046),(2,2047),(100,2000),(100,2001),(100,2002),(100,2003),(100,2004),(100,2005),(100,2006),(100,2013),(100,2014),(100,2015),(100,2016),(100,2017),(100,2018),(100,2025),(100,2026),(100,2027),(100,2028),(100,2029),(100,2030),(100,2031),(100,2032),(100,2033),(100,2034),(100,2037),(100,2038),(100,2039),(100,2040),(100,2041),(100,2042),(100,2043),(100,2046),(100,2047);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','李士杰','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-02 22:59:32','admin','2024-06-30 13:07:47','','2024-07-02 22:59:31','管理员'),(2,103,'zdc','张德传','00','ry@qq.com','15666666666','1','','$2a$10$2mM6C00kFE9DLdI06bvUCebFAG4mtTRPJtVemTpRd4w87OrGSoKlS','0','0','127.0.0.1','2024-07-02 23:54:52','admin','2024-06-30 13:07:47','admin','2024-07-02 23:54:52','财务员'),(100,103,'lpy','李鹏宇','00','','','0','','$2a$10$8sqwolEGu6w2AHvrgLuof.zyj1hJukbEfm8PcCYfz3cknlyoiuNKq','0','0','127.0.0.1','2024-07-01 20:22:35','admin','2024-07-01 20:22:21','admin','2024-07-02 21:49:35',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,3),(100,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-02 23:59:07
