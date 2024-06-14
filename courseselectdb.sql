/*
Navicat MySQL Data Transfer

Source Server         : ppppp
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : courseselectdb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2024-06-14 18:18:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `AdminAccount` varchar(20) NOT NULL,
  `AdminPassword` varchar(20) NOT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `AdminAccount` (`AdminAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1', 'teacher0536', 'ateacher0536');
INSERT INTO `admininfo` VALUES ('2', 'teacher0637', 'ateacher0637');
INSERT INTO `admininfo` VALUES ('3', 'teacher0736', 'ateacher0736');
INSERT INTO `admininfo` VALUES ('4', 'teacher0837', 'ateacher0837');
INSERT INTO `admininfo` VALUES ('5', 'teacher0935', 'ateacher0935');
INSERT INTO `admininfo` VALUES ('6', 'teacher0137', 'ateacher0137');
INSERT INTO `admininfo` VALUES ('7', 'teacher0236', 'ateacher0236');
INSERT INTO `admininfo` VALUES ('8', 'teacher0336', 'ateacher0336');
INSERT INTO `admininfo` VALUES ('9', 'teacher0436', 'ateacher0436');
INSERT INTO `admininfo` VALUES ('10', 'teacher1037', 'ateacher1037');
INSERT INTO `admininfo` VALUES ('11', 'teacher1237', 'ateacher1237');
INSERT INTO `admininfo` VALUES ('12', 'teacher1637', 'ateacher1637');

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(10) NOT NULL,
  `TeacherName` varchar(10) NOT NULL,
  `CoursePlace` varchar(10) NOT NULL,
  `AllStudent` int(11) NOT NULL,
  `StudentNum` int(11) NOT NULL,
  `CourseType` varchar(5) NOT NULL,
  `CourseTime` varchar(20) NOT NULL,
  `CourseCondition` varchar(2) NOT NULL DEFAULT '未满',
  PRIMARY KEY (`CourseID`) USING BTREE,
  UNIQUE KEY `CourseName` (`CourseName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES ('2', '艾滋病、性与健康', '马迎华', '线上', '200', '2', '网络选修课', '2024/4/17', '未满');
INSERT INTO `courseinfo` VALUES ('3', '艺术与审美', '叶朗', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('4', '大学生心理健康教育', '马军', '3教406', '100', '0', '公共选修课', '2024/4/12', '未满');
INSERT INTO `courseinfo` VALUES ('5', '法律人生', '康雷闪', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('6', '英语听说', '孟晓青', '2教704', '100', '0', '公共选修课', '2024/4/13', '未满');
INSERT INTO `courseinfo` VALUES ('7', '中华优秀传统文化', '王珂菲', '2教502', '100', '0', '公共选修课', '2024/4/16', '未满');
INSERT INTO `courseinfo` VALUES ('8', '改革开放与新时代', '洪云', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('9', '新中国史', '洪岩', '1教301', '100', '1', '公共选修课', '2024/4/14', '未满');
INSERT INTO `courseinfo` VALUES ('10', '社会主义发展史', '姜云龙', '3教203', '100', '0', '公共选修课', '2024/4/18', '未满');
INSERT INTO `courseinfo` VALUES ('11', '案说中药', '李海燕', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('12', '舌尖上的历史与文化', '胡小松', '线上', '200', '0', '网络选修课', '2024/4/13', '未满');
INSERT INTO `courseinfo` VALUES ('13', '篮球', '李明达', '篮球场', '100', '0', '公共选修课', '2024/4/17', '未满');
INSERT INTO `courseinfo` VALUES ('14', '经典影视片解读', '田卉群', '线上', '200', '0', '网络选修课', '2024/4/12', '未满');
INSERT INTO `courseinfo` VALUES ('15', '认识身边的药用植物', '孙晓东', '线上', '200', '0', '网络选修课', '2024/4/16', '未满');
INSERT INTO `courseinfo` VALUES ('16', '生产实习', '苏琼\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('17', '化学信息学', '师雅惠\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('18', '科技数据库管理', '彭达池\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('19', '高分子助剂', '郭勇健\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('20', '高性能复合材料', '李更明\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('21', '现代化学实验与技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('22', '高分子加工', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('23', '仿真实习', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('24', '化工设计', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('25', '化工机械基础', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('26', '综合化学实验', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('27', '应用化学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('28', '教育技术学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('29', '应用数学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('30', '物理实验-探索科学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('31', '运筹学与控制论', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('32', '光学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('33', '理论物理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('34', '光学工程', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('35', '物理电子学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('36', '通信与信息系统', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('37', '信息安全*', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('38', '经济学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('39', '高等物理光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('40', '现代光学实验', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('41', '光电子学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('42', '光谱学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('43', '量子电子学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('45', '工程数学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('46', '光学设计', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('47', '激光原理技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('48', '导波光学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('49', '薄膜光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('50', '光学材料与工艺', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('51', '辐射度学和色度学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('52', '傅里叶光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('53', '光学信息处理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('54', '线性光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('55', '量子光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('56', '光通讯原理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('57', '计量', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('58', '检测和传感技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('59', '光学计量与测试', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('60', '通信与信息系统3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('61', '信息安全*3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('62', '计算机科学与技术3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('63', '应用化学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('64', '教育技术学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('65', '应用数学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('66', '物理实验-探索科学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('67', '运筹学与控制论4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('68', '光学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('69', '理论物理4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('70', '光学工程进阶', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('71', '物理电子学4', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('72', '通信与信息系统4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('73', '网络工程', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('74', '计算机科学与技术4', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('75', '测试测试', '1', '1', '200', '1', '1', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('76', '化学基础', '王明', '实验室', '200', '0', '公共选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo` VALUES ('77', '生物进化论', '李红', '教室A', '200', '0', '公共选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo` VALUES ('78', '计算机网络原理', '张强', '实验室', '200', '0', '网络选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo` VALUES ('79', '人工智能导论', '刘伟', '线上', '200', '0', '网络选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo` VALUES ('80', '机器学习实践', '陈小明', '实验室', '200', '0', '公共选修课', '2024/4/27', '未满');
INSERT INTO `courseinfo` VALUES ('81', '心理学概论', '赵丽', '教室B', '200', '0', '网络选修课', '2024/4/24', '未满');
INSERT INTO `courseinfo` VALUES ('82', '文学经典', '孙阳', '教室A', '200', '0', '网络选修课', '2024/4/26', '未满');
INSERT INTO `courseinfo` VALUES ('83', '经济学原理', '刘军', '教室B', '200', '0', '网络选修课', '2024/4/23', '未满');
INSERT INTO `courseinfo` VALUES ('84', '艺术设计基础', '王芳', '实验室', '200', '0', '公共选修课', '2024/4/29', '未满');
INSERT INTO `courseinfo` VALUES ('85', '音乐鉴赏', '李明', '教室A', '200', '0', '网络选修课', '2024/4/21', '未满');
INSERT INTO `courseinfo` VALUES ('86', '物理电子学6', '李伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('87', '生物化学实验', '王红', '实验室', '200', '0', '网络选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo` VALUES ('88', '地理学导论', '张丽', '教室B', '200', '0', '公共选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo` VALUES ('89', '计算机图形学', '赵小明', '实验室', '200', '0', '网络选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo` VALUES ('90', '人工智能实践', '孙丽', '线上', '200', '0', '公共选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo` VALUES ('91', '机器学习原理', '李小红', '实验室', '200', '0', '网络选修课', '2024/4/27', '未满');
INSERT INTO `courseinfo` VALUES ('92', '心理学案例分析', '王阳', '教室B', '200', '0', '公共选修课', '2024/4/24', '未满');
INSERT INTO `courseinfo` VALUES ('93', '文学名著赏析', '刘丽', '教室A', '200', '0', '网络选修课', '2024/4/26', '未满');
INSERT INTO `courseinfo` VALUES ('94', '经济学实践', '张军', '教室B', '200', '0', '公共选修课', '2024/4/23', '未满');
INSERT INTO `courseinfo` VALUES ('95', '艺术设计实践', '刘芳', '实验室', '200', '0', '网络选修课', '2024/4/29', '未满');
INSERT INTO `courseinfo` VALUES ('96', '音乐理论基础', '孙明', '教室A', '200', '0', '公共选修课', '2024/4/21', '未满');
INSERT INTO `courseinfo` VALUES ('97', '物理电子学导论', '李伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo` VALUES ('98', '生物实验技术', '王红', '实验室', '200', '0', '网络选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo` VALUES ('99', '地理信息系统', '张丽', '教室B', '200', '0', '网络选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo` VALUES ('100', '计算机算法分析', '赵小明', '实验室', '200', '0', '公共选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo` VALUES ('101', '人工智能原理', '孙丽', '线上', '200', '0', '网络选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo` VALUES ('103', '纸飞机模拟驾驶', '殷庆年', '六栋211', '1', '0', '公共选修课', '2024/4/23', '未满');

-- ----------------------------
-- Table structure for courseinfo2
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo2`;
CREATE TABLE `courseinfo2` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(10) NOT NULL,
  `TeacherName` varchar(10) NOT NULL,
  `CoursePlace` varchar(10) NOT NULL,
  `AllStudent` int(11) NOT NULL,
  `StudentNum` int(11) NOT NULL,
  `CourseType` varchar(5) NOT NULL,
  `CourseTime` varchar(20) NOT NULL,
  `CourseCondition` varchar(2) NOT NULL DEFAULT '未满',
  PRIMARY KEY (`CourseID`),
  UNIQUE KEY `CourseName` (`CourseName`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseinfo2
-- ----------------------------
INSERT INTO `courseinfo2` VALUES ('1', '军事理论-综合版', '孙晨伟', '线上', '200', '200', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('2', '艾滋病、性与健康', '马迎华', '线上', '200', '2', '网络选修课', '2024/4/17', '未满');
INSERT INTO `courseinfo2` VALUES ('3', '艺术与审美', '叶朗', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('4', '大学生心理健康教育', '马军', '3教406', '100', '0', '公共选修课', '2024/4/12', '未满');
INSERT INTO `courseinfo2` VALUES ('5', '法律人生', '康雷闪', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('6', '英语听说', '孟晓青', '2教704', '100', '0', '公共选修课', '2024/4/13', '未满');
INSERT INTO `courseinfo2` VALUES ('7', '中华优秀传统文化', '王珂菲', '2教502', '100', '0', '公共选修课', '2024/4/16', '未满');
INSERT INTO `courseinfo2` VALUES ('8', '改革开放与新时代', '洪云', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('9', '新中国史', '洪岩', '1教301', '100', '1', '公共选修课', '2024/4/14', '未满');
INSERT INTO `courseinfo2` VALUES ('10', '社会主义发展史', '姜云龙', '3教203', '100', '0', '公共选修课', '2024/4/18', '未满');
INSERT INTO `courseinfo2` VALUES ('11', '案说中药', '李海燕', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('12', '舌尖上的历史与文化', '胡小松', '线上', '200', '0', '网络选修课', '2024/4/13', '未满');
INSERT INTO `courseinfo2` VALUES ('13', '篮球', '李明达', '篮球场', '100', '0', '公共选修课', '2024/4/17', '未满');
INSERT INTO `courseinfo2` VALUES ('14', '经典影视片解读', '田卉群', '线上', '200', '0', '网络选修课', '2024/4/12', '未满');
INSERT INTO `courseinfo2` VALUES ('15', '认识身边的药用植物', '孙晓东', '线上', '200', '0', '网络选修课', '2024/4/16', '未满');
INSERT INTO `courseinfo2` VALUES ('16', '生产实习', '苏琼\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('17', '化学信息学', '师雅惠\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('18', '科技数据库管理', '彭达池\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('19', '高分子助剂', '郭勇健\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('20', '高性能复合材料', '李更明\r\n', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('21', '现代化学实验与技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('22', '高分子加工', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('23', '仿真实习', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('24', '化工设计', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('25', '化工机械基础', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('26', '综合化学实验', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('27', '应用化学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('28', '教育技术学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('29', '应用数学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('30', '物理实验-探索科学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('31', '运筹学与控制论', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('32', '光学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('33', '理论物理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('34', '光学工程', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('35', '物理电子学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('36', '通信与信息系统', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('37', '信息安全*', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('38', '经济学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('39', '高等物理光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('40', '现代光学实验', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('41', '光电子学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('42', '光谱学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('43', '量子电子学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('45', '工程数学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('46', '光学设计', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('47', '激光原理技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('48', '导波光学', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('49', '薄膜光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('50', '光学材料与工艺', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('51', '辐射度学和色度学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('52', '傅里叶光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('53', '光学信息处理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('54', '线性光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('55', '量子光学', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('56', '光通讯原理', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('57', '计量', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('58', '检测和传感技术', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('59', '光学计量与测试', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('60', '通信与信息系统3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('61', '信息安全*3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('62', '计算机科学与技术3', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('63', '应用化学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('64', '教育技术学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('65', '应用数学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('66', '物理实验-探索科学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('67', '运筹学与控制论4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('68', '光学4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('69', '理论物理4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('70', '光学工程进阶', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('71', '物理电子学4', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('72', '通信与信息系统4', '孙晨伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('73', '网络工程', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('74', '计算机科学与技术4', '孙晨伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('75', '测试测试', '1', '1', '200', '1', '1', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('76', '化学基础', '王明', '实验室', '200', '0', '公共选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo2` VALUES ('77', '生物进化论', '李红', '教室A', '200', '0', '公共选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo2` VALUES ('78', '计算机网络原理', '张强', '实验室', '200', '0', '网络选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo2` VALUES ('79', '人工智能导论', '刘伟', '线上', '200', '0', '网络选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo2` VALUES ('80', '机器学习实践', '陈小明', '实验室', '200', '0', '公共选修课', '2024/4/27', '未满');
INSERT INTO `courseinfo2` VALUES ('81', '心理学概论', '赵丽', '教室B', '200', '0', '网络选修课', '2024/4/24', '未满');
INSERT INTO `courseinfo2` VALUES ('82', '文学经典', '孙阳', '教室A', '200', '0', '网络选修课', '2024/4/26', '未满');
INSERT INTO `courseinfo2` VALUES ('83', '经济学原理', '刘军', '教室B', '200', '0', '网络选修课', '2024/4/23', '未满');
INSERT INTO `courseinfo2` VALUES ('84', '艺术设计基础', '王芳', '实验室', '200', '0', '公共选修课', '2024/4/29', '未满');
INSERT INTO `courseinfo2` VALUES ('85', '音乐鉴赏', '李明', '教室A', '200', '0', '网络选修课', '2024/4/21', '未满');
INSERT INTO `courseinfo2` VALUES ('86', '物理电子学6', '李伟', '线上', '200', '0', '网络选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('87', '生物化学实验', '王红', '实验室', '200', '0', '网络选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo2` VALUES ('88', '地理学导论', '张丽', '教室B', '200', '0', '公共选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo2` VALUES ('89', '计算机图形学', '赵小明', '实验室', '200', '0', '网络选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo2` VALUES ('90', '人工智能实践', '孙丽', '线上', '200', '0', '公共选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo2` VALUES ('91', '机器学习原理', '李小红', '实验室', '200', '0', '网络选修课', '2024/4/27', '未满');
INSERT INTO `courseinfo2` VALUES ('92', '心理学案例分析', '王阳', '教室B', '200', '0', '公共选修课', '2024/4/24', '未满');
INSERT INTO `courseinfo2` VALUES ('93', '文学名著赏析', '刘丽', '教室A', '200', '0', '网络选修课', '2024/4/26', '未满');
INSERT INTO `courseinfo2` VALUES ('94', '经济学实践', '张军', '教室B', '200', '0', '公共选修课', '2024/4/23', '未满');
INSERT INTO `courseinfo2` VALUES ('95', '艺术设计实践', '刘芳', '实验室', '200', '0', '网络选修课', '2024/4/29', '未满');
INSERT INTO `courseinfo2` VALUES ('96', '音乐理论基础', '孙明', '教室A', '200', '0', '公共选修课', '2024/4/21', '未满');
INSERT INTO `courseinfo2` VALUES ('97', '物理电子学导论', '李伟', '线上', '200', '0', '公共选修课', '2024/4/20', '未满');
INSERT INTO `courseinfo2` VALUES ('98', '生物实验技术', '王红', '实验室', '200', '0', '网络选修课', '2024/4/25', '未满');
INSERT INTO `courseinfo2` VALUES ('99', '地理信息系统', '张丽', '教室B', '200', '0', '网络选修课', '2024/4/22', '未满');
INSERT INTO `courseinfo2` VALUES ('100', '计算机算法分析', '赵小明', '实验室', '200', '0', '公共选修课', '2024/4/28', '未满');
INSERT INTO `courseinfo2` VALUES ('101', '人工智能原理', '孙丽', '线上', '200', '0', '网络选修课', '2024/4/30', '未满');
INSERT INTO `courseinfo2` VALUES ('103', '纸飞机模拟驾驶', '殷庆年', '六栋211', '1', '0', '公共选修课', '2024/4/23', '未满');

-- ----------------------------
-- Table structure for studentcourseinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentcourseinfo`;
CREATE TABLE `studentcourseinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_1` (`StudentID`),
  KEY `fk_2` (`CourseID`),
  CONSTRAINT `fk_1` FOREIGN KEY (`StudentID`) REFERENCES `studentinfo` (`StudentID`),
  CONSTRAINT `fk_2` FOREIGN KEY (`CourseID`) REFERENCES `courseinfo2` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentcourseinfo
-- ----------------------------
INSERT INTO `studentcourseinfo` VALUES ('1', '220101', '1');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Sex` char(1) DEFAULT '男',
  `Age` int(11) NOT NULL,
  `Address` varchar(5) NOT NULL,
  `Major` varchar(10) NOT NULL,
  `Classid` varchar(10) NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=220622 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('220101', '谢乐瑶', 'a220101', '女', '19', '湖北仙桃', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220102', '王烨', 'a220102', '男', '19', '湖北安陆', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220103', '谢浩存', 'a220103', '男', '20', '湖北武汉', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220104', '唐梦思', 'a220104', '女', '19', '湖北襄阳', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220105', '周逸依', 'a220105', '女', '19', '湖北荆州', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220106', '蔡卓怡', 'a220106', '女', '19', '湖北恩施', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220107', '陈子奕', 'a220107', '男', '20', '湖北武汉', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220108', '张皓文', 'a220108', '男', '19', '湖北宜昌', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220109', '刘雨晨', 'a220109', '男', '20', '湖北宜昌', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220110', '李泽洋', 'a220110', '女', '20', '湖北襄阳', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220111', '周鑫鑫', 'a220111', '女', '20', '湖北荆门', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220112', '王安', 'a220112', '男', '19', '福建厦门', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220113', '薛浩阳', 'a220113', '男', '19', '湖北武汉', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220114', '曹楠', 'a220114', '女', '19', '湖南长沙', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220115', '崔诺言', 'a220115', '男', '19', '湖北孝感', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220116', '张静雯', 'a220116', '女', '19', '湖北武汉', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220117', '翟苏慧', 'a220117', '女', '19', '江西南昌', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220118', '王俊', 'a220118', '男', '20', '广东广州', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220119', '叶美滢', 'a220119', '女', '19', '湖北襄阳', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220120', '殷庆年', 'a220120', '女', '19', '湖北仙桃', '计算机应用技术', '一班');
INSERT INTO `studentinfo` VALUES ('220121', '陈二十二', 'a220121', '男', '39', '湖北荆州', '数据分析', '二十一班');
INSERT INTO `studentinfo` VALUES ('220122', '卫二十三', 'a220122', '男', '40', '湖北宜昌', '人工智能', '二十二班');
INSERT INTO `studentinfo` VALUES ('220123', '蒋二十四', 'a220123', '男', '41', '湖北襄阳', '云计算', '二十三班');
INSERT INTO `studentinfo` VALUES ('220124', '沈二十五', 'a220124', '男', '42', '湖北十堰', '物联网', '二十四班');
INSERT INTO `studentinfo` VALUES ('220125', '韩二十六', 'a220125', '男', '43', '湖北黄石', '大数据', '二十五班');
INSERT INTO `studentinfo` VALUES ('220126', '杨二十七', 'a220126', '男', '44', '湖北荆门', '软件开发', '二十六班');
INSERT INTO `studentinfo` VALUES ('220127', '朱二十八', 'a220127', '男', '45', '湖北鄂州', '信息安全', '二十七班');
INSERT INTO `studentinfo` VALUES ('220128', '秦二十九', 'a220128', '男', '46', '湖北黄冈', '网络安全', '二十八班');
INSERT INTO `studentinfo` VALUES ('220129', '尤三十', 'a220129', '男', '47', '湖北咸宁', '数据分析', '二十九班');
INSERT INTO `studentinfo` VALUES ('220130', '许三十一', 'a220130', '男', '48', '湖北孝感', '人工智能', '三十班');
INSERT INTO `studentinfo` VALUES ('220131', '陈三十二', 'a220131', '男', '49', '湖北随州', '云计算', '三十一班');
INSERT INTO `studentinfo` VALUES ('220132', '卫三十三', 'a220132', '男', '50', '湖北恩施', '物联网', '三十二班');
INSERT INTO `studentinfo` VALUES ('220133', '蒋三十四', 'a220133', '男', '51', '湖北神农架', '大数据', '三十三班');
INSERT INTO `studentinfo` VALUES ('220134', '沈三十五', 'a220134', '男', '52', '湖北天门', '软件开发', '三十四班');
INSERT INTO `studentinfo` VALUES ('220135', '韩三十六', 'a220135', '男', '53', '湖北潜江', '信息安全', '三十五班');
INSERT INTO `studentinfo` VALUES ('220136', '杨三十七', 'a220136', '男', '54', '湖北神农架', '网络安全', '三十六班');
INSERT INTO `studentinfo` VALUES ('220137', '朱三十八', 'a220137', '男', '55', '湖北天门', '数据分析', '三十七班');
INSERT INTO `studentinfo` VALUES ('220138', '秦三十九', 'a220138', '男', '56', '湖北潜江', '人工智能', '三十八班');
INSERT INTO `studentinfo` VALUES ('220139', '尤四十', 'a220139', '男', '57', '湖北荆州', '云计算', '三十九班');
INSERT INTO `studentinfo` VALUES ('220140', '许四十一', 'a220140', '男', '58', '湖北宜昌', '物联网', '四十班');
INSERT INTO `studentinfo` VALUES ('220141', '陈四十二', 'a220141', '男', '59', '湖北襄阳', '大数据', '四十一班');
INSERT INTO `studentinfo` VALUES ('220142', '卫四十三', 'a220142', '男', '60', '湖北十堰', '软件开发', '四十二班');
INSERT INTO `studentinfo` VALUES ('220143', '蒋四十四', 'a220143', '男', '61', '湖北黄石', '信息安全', '四十三班');
INSERT INTO `studentinfo` VALUES ('220144', '沈四十五', 'a220144', '男', '62', '湖北荆门', '网络安全', '四十四班');
INSERT INTO `studentinfo` VALUES ('220145', '韩四十六', 'a220145', '男', '63', '湖北鄂州', '数据分析', '四十五班');
INSERT INTO `studentinfo` VALUES ('220146', '杨四十七', 'a220146', '男', '64', '湖北黄冈', '人工智能', '四十六班');
INSERT INTO `studentinfo` VALUES ('220147', '朱四十八', 'a220147', '男', '65', '湖北咸宁', '云计算', '四十七班');
INSERT INTO `studentinfo` VALUES ('220148', '秦四十九', 'a220148', '男', '66', '湖北孝感', '物联网', '四十八班');
INSERT INTO `studentinfo` VALUES ('220149', '尤五十', 'a220149', '男', '67', '湖北随州', '大数据', '四十九班');
INSERT INTO `studentinfo` VALUES ('220150', '许五十一', 'a220150', '男', '68', '湖北恩施', '软件开发', '五十班');
INSERT INTO `studentinfo` VALUES ('220151', '陈五十二', 'a220151', '男', '69', '湖北神农架', '信息安全', '五十一班');
INSERT INTO `studentinfo` VALUES ('220152', '卫五十三', 'a220152', '男', '70', '湖北天门', '网络安全', '五十二班');
INSERT INTO `studentinfo` VALUES ('220153', '蒋五十四', 'a220153', '男', '71', '湖北潜江', '数据分析', '五十三班');
INSERT INTO `studentinfo` VALUES ('220154', '沈五十五', 'a220154', '男', '72', '湖北神农架', '人工智能', '五十四班');
INSERT INTO `studentinfo` VALUES ('220155', '韩五十六', 'a220155', '男', '73', '湖北天门', '云计算', '五十五班');
INSERT INTO `studentinfo` VALUES ('220156', '杨五十七', 'a220156', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220157', '朱五十八', 'a220157', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220158', '秦五十九', 'a220158', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220159', '尤六十', 'a220159', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220165', '黄六十五', 'a220165', '男', '74', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220167', '刘六十七', 'a220167', '男', '78', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220170', '郑七十', 'a220170', '男', '79', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220175', '赵七十二', 'a220175', '男', '77', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220177', '孙七十一', 'a220177', '男', '76', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220183', '王六十四', 'a220183', '男', '77', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220189', '周六十八', 'a220189', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220275', '赵六十六', 'a220175', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220291', '吴六十九', 'a220191', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220301', '陈一', 'a220301', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220302', '张二', 'a220302', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220303', '李三', 'a220303', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220304', '王四', 'a220304', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220305', '赵五', 'a220305', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220306', '孙六', 'a220306', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220307', '周七', 'a220307', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220308', '吴八', 'a220308', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220309', '郑九', 'a220309', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220310', '尤十', 'a220310', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220311', '许十一', 'a220311', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220312', '何十二', 'a220312', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220313', '吕十三', 'a220313', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220314', '施十四', 'a220314', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220315', '张十五', 'a220315', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220316', '孟十六', 'a220316', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220317', '曹十七', 'a220317', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220318', '卢十八', 'a220318', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220319', '余十九', 'a220319', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220320', '王二十', 'a220320', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220321', '陈二十一', 'a220321', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220322', '张二十二', 'a220322', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220323', '李二十三', 'a220323', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220324', '王二十四', 'a220324', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220325', '赵二十五', 'a220325', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220326', '孙二十六', 'a220326', '男', '75', '湖北荆州', '大数据', '五十七班');
INSERT INTO `studentinfo` VALUES ('220327', '周二十七', 'a220327', '男', '76', '湖北宜昌', '软件开发', '五十八班');
INSERT INTO `studentinfo` VALUES ('220328', '吴二十八', 'a220328', '男', '77', '湖北襄阳', '信息安全', '五十九班');
INSERT INTO `studentinfo` VALUES ('220329', '郑二十九', 'a220329', '男', '74', '湖北潜江', '物联网', '五十六班');
INSERT INTO `studentinfo` VALUES ('220621', '朱格格', '12345', '女', '19', '湖北恩施', '计算机应用技术', '六班');
