/*
Navicat MySQL Data Transfer

Source Server         : lcoalhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-03-24 21:56:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_help`
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(1) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='帮助表';

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_help_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='帮助分类表';

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_member_report`
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report` (
  `id` bigint(20) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户举报表';

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_prefrence_area`
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优选专区';

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES ('1', '让音质更出众', '音质不打折 完美现场感', null, null, '1');
INSERT INTO `cms_prefrence_area` VALUES ('2', '让音质更出众22', '让音质更出众22', null, null, null);
INSERT INTO `cms_prefrence_area` VALUES ('3', '让音质更出众33', null, null, null, null);
INSERT INTO `cms_prefrence_area` VALUES ('4', '让音质更出众44', null, null, null, null);

-- ----------------------------
-- Table structure for `cms_prefrence_area_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优选专区和产品关系表';

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('1', '1', '12');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('2', '1', '13');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('3', '1', '14');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('4', '1', '18');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('5', '1', '7');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('6', '2', '7');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('7', '1', '22');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('24', '1', '23');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('25', '1', '37');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('26', '2', '37');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('27', '1', '45');
INSERT INTO `cms_prefrence_area_product_relation` VALUES ('28', '1', '47');

-- ----------------------------
-- Table structure for `cms_subject`
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `forward_count` int(11) DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='专题表';

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES ('1', '1', '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', null, '1', '2018-11-11 13:26:55', '100', '1000', '100', null, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', '1', null, null, '精选专题');
INSERT INTO `cms_subject` VALUES ('2', '1', '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', null, '1', '2018-11-12 13:27:00', '100', '1000', '100', null, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', '1', null, null, '精选专题');
INSERT INTO `cms_subject` VALUES ('3', '1', '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', null, '1', '2018-11-13 13:27:05', '100', '1000', '100', null, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', '1', null, null, '精选专题');
INSERT INTO `cms_subject` VALUES ('4', '2', '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', null, '1', '2018-11-01 13:27:09', '100', '1000', '100', null, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('5', '2', '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', null, '1', '2018-11-06 13:27:18', '100', '1000', '100', null, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('6', '2', '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', null, '1', '2018-11-07 13:27:21', '100', '1000', '100', null, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('7', '2', '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', null, '1', '2019-01-29 11:21:55', '100', '1000', '100', null, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('8', '2', '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', null, '1', '2019-01-29 13:07:13', '100', '1000', '100', null, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('9', '2', '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', null, '1', '2019-01-29 13:08:18', '100', '1000', '100', null, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('10', '2', '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', null, '1', '2019-01-29 13:10:02', '100', '1000', '100', null, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', '1', null, null, '家电专题');
INSERT INTO `cms_subject` VALUES ('11', '3', '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', null, '1', '2019-01-29 13:10:45', '100', '1000', '100', null, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', '1', null, null, '美食专题');
INSERT INTO `cms_subject` VALUES ('12', '3', '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', null, '1', '2019-01-29 13:11:41', '100', '1000', '100', null, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', '1', null, null, '美食专题');
INSERT INTO `cms_subject` VALUES ('13', '3', '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', null, '1', '2019-01-29 13:12:38', '100', '1000', '100', null, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', '1', null, null, '美食专题');
INSERT INTO `cms_subject` VALUES ('14', '4', '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', null, '1', '2019-01-29 13:13:53', '100', '1000', '100', null, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', '1', null, null, '数码专题');
INSERT INTO `cms_subject` VALUES ('15', '5', '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', null, '1', '2019-01-29 13:15:12', '100', '1000', '100', null, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', '1', null, null, '服饰专题');
INSERT INTO `cms_subject` VALUES ('16', null, null, 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/1086.jpg?Expires=1551941474&OSSAccessKeyId=TMP.AQHK2vLmlMy3oJMlMBWvglM87Xrf2HYt47qRfMBsIM6pi-ZY79NssDjf3WCNMC4CFQD3xSkmn4pU0x9pXT_q_8RSwfbXBQIVAIw5RZACqfvclAeprBG1qw2HtCSz&Signature=RX5nHQdB7TaNPl%2B5wRW5ipQ7CPk%3D', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `cms_subject_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='专题分类表';

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES ('1', '精选专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jingxuan.png', '3', '1', '100');
INSERT INTO `cms_subject_category` VALUES ('2', '家电专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '7', '1', '0');
INSERT INTO `cms_subject_category` VALUES ('3', '美食专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_meishi.png', '3', '1', '0');
INSERT INTO `cms_subject_category` VALUES ('4', '数码专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '1', '1', '0');
INSERT INTO `cms_subject_category` VALUES ('5', '服饰专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '1', '1', '0');

-- ----------------------------
-- Table structure for `cms_subject_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_subject_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='专题商品关系表';

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES ('2', '1', '27');
INSERT INTO `cms_subject_product_relation` VALUES ('3', '1', '28');
INSERT INTO `cms_subject_product_relation` VALUES ('4', '1', '29');
INSERT INTO `cms_subject_product_relation` VALUES ('5', '2', '30');
INSERT INTO `cms_subject_product_relation` VALUES ('6', '2', '31');
INSERT INTO `cms_subject_product_relation` VALUES ('7', '2', '35');
INSERT INTO `cms_subject_product_relation` VALUES ('29', '2', '36');
INSERT INTO `cms_subject_product_relation` VALUES ('30', '2', '32');
INSERT INTO `cms_subject_product_relation` VALUES ('31', '3', '33');
INSERT INTO `cms_subject_product_relation` VALUES ('38', '3', '34');
INSERT INTO `cms_subject_product_relation` VALUES ('41', '1', '26');

-- ----------------------------
-- Table structure for `cms_topic`
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int(11) DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='话题表';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_topic_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='话题分类表';

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_topic_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `oms_cart_item`
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_sku_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES ('12', '26', '90', '1', '1', '3788.00', '金色', '16G', null, null, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', null, '0', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('13', '27', '98', '1', '3', '2699.00', '黑色', '32G', null, null, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', null, '0', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('14', '28', '102', '1', '1', '649.00', '金色', '16G', null, null, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', null, '0', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('15', '28', '103', '1', '1', '699.00', '金色', '32G', null, null, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', null, '0', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('16', '29', '106', '1', '1', '5499.00', '金色', '32G', null, null, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', null, '0', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('17', '36', null, '5', '1', '3599.00', null, null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/1879e5f23c7bef95e_840_840.png', '一加6T', '一加智能手机', null, 'lisi', '2019-03-16 09:39:43', '2019-03-20 21:46:34', '1', '29', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('18', '27', null, '5', '3', '2699.00', null, null, null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏智能手机', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', null, 'lisi', '2019-03-16 09:39:47', null, '1', '19', null, null, null);
INSERT INTO `oms_cart_item` VALUES ('19', '48', null, '5', '1', '8499.00', null, null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/5bfbc0e5N263aeb9c.jpg', '联想(Lenovo)拯救者Y7000P', 'Y7000P英特尔酷睿 i7 15.6英寸高色域游戏笔记本电脑(i7-8750H 8G 512G GTX1060 144Hz)', null, 'lisi', '2019-03-23 23:42:48', null, '0', '56', null, null, null);

-- ----------------------------
-- Table structure for `oms_company_address`
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司收发货地址表';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES ('1', '深圳发货点', '1', '1', '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES ('2', '北京发货点', '0', '0', '大梨', '18000000000', '北京市', null, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES ('3', '南京发货点', '0', '0', '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for `oms_order`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES ('12', '1', '2', '201809150101000001', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '20.00', '2344.25', '0.00', '10.00', '10.00', '0', '1', '4', '0', '', '', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', 'xxx', '0', '0', null, null, null, null, null, '2018-10-30 14:43:49');
INSERT INTO `oms_order` VALUES ('13', '1', '2', '201809150102000002', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '2', '0', '中通快递', '574345234231·3', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', '2018-10-11 14:04:19', '2019-03-07 16:58:46', null, null, null);
INSERT INTO `oms_order` VALUES ('14', '1', '2', '201809130101000001', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', '顺丰快递', '201707196398345', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, '2018-10-13 13:44:04', '2018-10-16 13:43:41', null, null, null);
INSERT INTO `oms_order` VALUES ('15', '1', '2', '201809130102000002', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '3', '0', '顺丰快递', '201707196398346', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '1', '0', null, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', null, null);
INSERT INTO `oms_order` VALUES ('16', '1', '2', '201809140101000001', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('17', '1', '2', '201809150101000003', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0', '1', '4', '0', '顺丰快递', '201707196398345', '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, '2018-10-12 14:01:28', null, null, null);
INSERT INTO `oms_order` VALUES ('18', '1', '2', '201809150102000004', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '1', '0', '圆通快递', 'xx', '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', null, '2018-10-16 14:42:17', null, null, null);
INSERT INTO `oms_order` VALUES ('19', '1', '2', '201809130101000003', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', null, null, '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('20', '1', '2', '201809130102000004', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '3', '0', null, null, '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('21', '1', '2', '201809140101000002', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('22', '1', '2', '201809150101000005', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0', '1', '4', '0', '顺丰快递', '201707196398345', '15', '0', '0', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, '2018-10-12 14:01:28', null, null, null);
INSERT INTO `oms_order` VALUES ('23', '1', '2', '201809150102000006', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1', '1', '1', '0', '顺丰快递', 'xxx', '15', '0', '0', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', null, '2018-10-16 14:41:28', null, null, null);
INSERT INTO `oms_order` VALUES ('24', '1', '2', '201809130101000005', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '2', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
INSERT INTO `oms_order` VALUES ('25', '1', '2', '201809130102000006', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '10.00', '2344.25', '0.00', '10.00', '5.00', '1', '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', '0', '0', null, null, null, null, null, '2018-10-30 15:08:31');
INSERT INTO `oms_order` VALUES ('26', '1', '2', '201809140101000003', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2', '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `oms_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单中所包含的商品';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES ('21', '12', '201809150101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', null, null, null, '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('22', '12', '201809150101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', '2699.00', '3', '98', '201808270027001', '19', null, null, null, '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('23', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('24', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('25', '12', '201809150101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', null, null, null, '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('26', '13', '201809150102000002', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', null, null, null, '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('27', '13', '201809150102000002', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', '2699.00', '3', '98', '201808270027001', '19', null, null, null, '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('28', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('29', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('30', '13', '201809150102000002', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', null, null, null, '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('31', '14', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', null, null, null, '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('32', '14', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', '2699.00', '3', '98', '201808270027001', '19', null, null, null, '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('33', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('34', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('35', '14', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', null, null, null, '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('36', '15', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', null, null, null, '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('37', '15', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', '2699.00', '3', '98', '201808270027001', '19', null, null, null, '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('38', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('39', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('40', '15', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', null, null, null, '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('41', '16', '201809140101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', null, null, null, '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('42', '16', '201809140101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', '2699.00', '3', '98', '201808270027001', '19', null, null, null, '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('43', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES ('44', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', null, null, null, '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES ('45', '16', '201809140101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', null, null, null, '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499', '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');

-- ----------------------------
-- Table structure for `oms_order_operate_history`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES ('5', '12', '后台管理员', '2018-10-12 14:01:29', '2', '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('6', '13', '后台管理员', '2018-10-12 14:01:29', '2', '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('7', '12', '后台管理员', '2018-10-12 14:13:10', '4', '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES ('8', '13', '后台管理员', '2018-10-12 14:13:10', '4', '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES ('9', '22', '后台管理员', '2018-10-15 16:31:48', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('10', '22', '后台管理员', '2018-10-15 16:35:08', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('11', '22', '后台管理员', '2018-10-15 16:35:59', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('12', '17', '后台管理员', '2018-10-15 16:43:40', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('13', '25', '后台管理员', '2018-10-15 16:52:14', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('14', '26', '后台管理员', '2018-10-15 16:52:14', '4', '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES ('15', '23', '后台管理员', '2018-10-16 14:41:28', '2', '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('16', '13', '后台管理员', '2018-10-16 14:42:17', '2', '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('17', '18', '后台管理员', '2018-10-16 14:42:17', '2', '完成发货');
INSERT INTO `oms_order_operate_history` VALUES ('18', '26', '后台管理员', '2018-10-30 14:37:44', '4', '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES ('19', '25', '后台管理员', '2018-10-30 15:07:01', '0', '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES ('20', '25', '后台管理员', '2018-10-30 15:08:13', '0', '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES ('21', '25', '后台管理员', '2018-10-30 15:08:31', '0', '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES ('22', '25', '后台管理员', '2018-10-30 15:08:39', '4', '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES ('23', '13', '后台管理员', '2019-03-07 16:58:47', '2', '完成发货');

-- ----------------------------
-- Table structure for `oms_order_return_apply`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES ('3', '12', null, '26', '201809150101000001', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('4', '12', '2', '27', '201809150101000001', '2018-10-17 14:40:21', 'test', '3585.98', '大梨', '18000000000', '1', '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', '已经处理了', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('5', '12', '3', '28', '201809150101000001', '2018-10-17 14:44:18', 'test', '3585.98', '大梨', '18000000000', '2', '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES ('8', '13', null, '28', '201809150102000002', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '3', '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', '理由不够充分', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('9', '14', '2', '26', '201809130101000001', '2018-10-17 14:34:57', 'test', '3500.00', '大梨', '18000000000', '2', '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES ('10', '14', null, '27', '201809130101000001', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '3', '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', '就是不退', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('11', '14', '2', '28', '201809130101000001', '2018-10-17 14:44:18', 'test', '591.05', '大梨', '18000000000', '1', '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', '可以退款', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('12', '15', '3', '26', '201809130102000002', '2018-10-17 14:34:57', 'test', '3500.00', '大梨', '18000000000', '2', '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES ('13', '15', null, '27', '201809130102000002', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '3', '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', '无法退货', 'admin', null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('15', '16', null, '26', '201809140101000001', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('16', '16', null, '27', '201809140101000001', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('17', '16', null, '28', '201809140101000001', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('18', '17', null, '26', '201809150101000003', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('19', '17', null, '27', '201809150101000003', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('20', '17', null, '28', '201809150101000003', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('21', '18', null, '26', '201809150102000004', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('22', '18', null, '27', '201809150102000004', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('23', '18', null, '28', '201809150102000004', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('24', '19', null, '26', '201809130101000003', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1', '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('25', '19', null, '27', '201809130101000003', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81', '质量问题', '不够高端', '', null, null, null, null, null);
INSERT INTO `oms_order_return_apply` VALUES ('26', '19', null, '28', '201809130101000003', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00', '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for `oms_order_return_reason`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退货原因表';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES ('1', '质量问题', '1', '0', '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES ('2', '尺码太大', '1', '1', '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES ('3', '颜色不喜欢', '1', '1', '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES ('4', '7天无理由退货', '1', '1', '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES ('5', '价格问题', '1', '0', '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES ('12', '发票问题', '0', '1', '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES ('13', '其他问题', '0', '1', '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES ('14', '物流问题', '0', '1', '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES ('15', '售后问题', '0', '1', '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for `oms_order_setting`
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES ('1', '60', '120', '15', '7', '7');

-- ----------------------------
-- Table structure for `pms_album`
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相册表';

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_album_pic`
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='画册图片表';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_brand`
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES ('1', '思科', 'S', '0', '1', '1', '100', '100', 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/tb4.jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES ('2', '三星', 'S', '100', '1', '1', '100', '100', 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/tb1.jpg', null, '三星的故事');
INSERT INTO `pms_brand` VALUES ('3', '华为', 'H', '100', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', null, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES ('4', '格力', 'G', '30', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', null, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES ('5', '方太', 'F', '20', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', null, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES ('6', '小米', 'M', '500', '1', '1', '100', '100', 'http://e-mall.oss-cn-beijing.aliyuncs.com/brand/1910.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES ('21', 'OPPO', 'O', '0', '1', '1', '88', '500', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES ('51', '苹果', 'A', '200', '1', '1', '55', '200', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', null, '苹果的故事');
INSERT INTO `pms_brand` VALUES ('59', '索尼', 'S', '10', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/brand/1813.jpg', '', '索尼的故事');
INSERT INTO `pms_brand` VALUES ('60', '荣耀', 'R', '0', '0', '0', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/d2ac6df050ae45a7.jpg', '', '');
INSERT INTO `pms_brand` VALUES ('61', '荣耀', 'R', '2', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg.jpg', '', '');
INSERT INTO `pms_brand` VALUES ('62', '卡西欧', 'K', '99', '1', '0', null, null, 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/1086.jpg', '', '卡西欧的故事');
INSERT INTO `pms_brand` VALUES ('63', '一加', 'Y', '18', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg (12).jpg', '', '');
INSERT INTO `pms_brand` VALUES ('64', 'VIVO', 'V', '0', '1', '1', null, null, 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/1911.jpg', '', '');
INSERT INTO `pms_brand` VALUES ('65', '联想', 'L', '14', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/u=3970647028,1054849191&fm=26&gp=0.jpg', '', '联想专区特卖');
INSERT INTO `pms_brand` VALUES ('66', '戴尔', 'D', '33', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg (5).jpg', '', '');
INSERT INTO `pms_brand` VALUES ('67', 'LG', 'L', '0', '0', '0', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg (6).jpg', '', '');
INSERT INTO `pms_brand` VALUES ('68', '佳能', 'J', '34', '1', '1', null, null, 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/tb2.jpg', '', '');
INSERT INTO `pms_brand` VALUES ('69', 'BOSE', 'B', '23', '1', '1', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg (1).jpg', '', '');
INSERT INTO `pms_brand` VALUES ('70', '惠普', 'H', '5', '0', '1', null, null, 'https://e-mall.oss-cn-beijing.aliyuncs.com/brand/tb3.jpg', '', '');

-- ----------------------------
-- Table structure for `pms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品评价表';

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_comment_replay`
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品评价回复表';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_feight_template`
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='运费模版';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_member_price`
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品会员价格表';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES ('26', '7', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('27', '8', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('28', '9', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('29', '10', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('30', '11', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('31', '12', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('32', '13', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('33', '14', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('37', '18', '1', '500.00', null);
INSERT INTO `pms_member_price` VALUES ('44', '7', '2', '480.00', null);
INSERT INTO `pms_member_price` VALUES ('45', '7', '3', '450.00', null);
INSERT INTO `pms_member_price` VALUES ('52', '22', '1', null, null);
INSERT INTO `pms_member_price` VALUES ('53', '22', '2', null, null);
INSERT INTO `pms_member_price` VALUES ('54', '22', '3', null, null);
INSERT INTO `pms_member_price` VALUES ('58', '24', '1', null, null);
INSERT INTO `pms_member_price` VALUES ('59', '24', '2', null, null);
INSERT INTO `pms_member_price` VALUES ('60', '24', '3', null, null);
INSERT INTO `pms_member_price` VALUES ('112', '23', '1', '88.00', '黄金会员');
INSERT INTO `pms_member_price` VALUES ('113', '23', '2', '88.00', '白金会员');
INSERT INTO `pms_member_price` VALUES ('114', '23', '3', '66.00', '钻石会员');
INSERT INTO `pms_member_price` VALUES ('142', '31', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('143', '31', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('144', '31', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('148', '32', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('149', '32', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('150', '32', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('154', '33', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('155', '33', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('156', '33', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('169', '36', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('170', '36', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('171', '36', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('172', '35', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('173', '35', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('174', '35', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('175', '34', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('176', '34', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('177', '34', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('178', '30', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('179', '30', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('180', '30', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('192', '27', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('193', '27', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('194', '27', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('195', '28', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('196', '28', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('197', '28', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('198', '29', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('199', '29', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('200', '29', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('201', '26', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('202', '26', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('203', '26', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('204', '37', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('205', '37', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('206', '37', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('207', '38', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('208', '38', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('209', '38', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('222', '43', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('223', '43', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('224', '43', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('225', '44', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('226', '44', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('227', '44', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('228', '45', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('229', '45', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('230', '45', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('231', '46', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('232', '46', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('233', '46', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('234', '47', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('235', '47', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('236', '47', '3', null, '钻石会员');
INSERT INTO `pms_member_price` VALUES ('237', '48', '1', null, '黄金会员');
INSERT INTO `pms_member_price` VALUES ('238', '48', '2', null, '白金会员');
INSERT INTO `pms_member_price` VALUES ('239', '48', '3', null, '钻石会员');

-- ----------------------------
-- Table structure for `pms_product`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品信息';

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES ('26', '3', '19', '0', '3', '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', '0', '1', '1', '1', '0', '100', '0', '3788.00', null, '3788', '3788', '0', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', '4288.00', '1000', '0', '件', '0.00', '1', '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', null, null, '0', '1', '华为', '手机通讯');
INSERT INTO `pms_product` VALUES ('27', '6', '19', '0', '3', '小米8 全面屏智能手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', '0', '1', '1', '1', '0', '0', '0', '2699.00', null, '2699', '2699', '0', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '2699.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', null, null, '0', '3', '小米', '手机通讯');
INSERT INTO `pms_product` VALUES ('28', '6', '19', '0', '3', '小米 红米5A 全网通版', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', '0', '1', '1', '1', '0', '0', '0', '649.00', null, '649', '649', '0', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', '649.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '4', '小米', '手机通讯');
INSERT INTO `pms_product` VALUES ('29', '51', '19', '0', '3', 'Apple iPhone 8 Plus 64GB', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', '0', '1', '1', '0', '0', '0', '0', '5499.00', null, '5499', '5499', '0', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', '5499.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES ('34', '6', '35', '0', null, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', '0', '0', '0', '0', '0', '0', '0', '3999.00', null, '0', '0', '0', ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', '3999.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '小米', '手机数码');
INSERT INTO `pms_product` VALUES ('36', '58', '29', '0', null, '一加6T', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/1879e5f23c7bef95e_840_840.png', '6799345', '1', '1', '1', '1', '0', '0', '0', '3599.00', null, '0', '0', '0', '一加智能手机', '', '3999.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '一加', '影音娱乐');
INSERT INTO `pms_product` VALUES ('37', '6', '55', '0', '11', '小米互联网电视', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/5be66a11Nb72df941.jpg', '99', '0', '1', '1', '0', '0', '18', '0', '3699.00', null, '11', '100', '0', '小米电视4A 65英寸 L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '小米电视4A 65英寸 L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '3999.00', '100', '0', '人民币', '5670.00', '1', '1,2,3', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/58da139bN24acdd50.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/c10bc8d0320378cb.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/5be66a11Nb72df941.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/58da139bN24acdd50.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/c10bc8d0320378cb.jpg\" /></p>', '', null, null, '0', '0', '小米', '');
INSERT INTO `pms_product` VALUES ('38', '2', '32', '0', '6', '三星S10', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/4d23a004ab9ecdda.jpg', '8889', '0', '1', '1', '0', '0', '199', '0', '10999.00', null, '0', '0', '0', '3D超声波屏下指纹超感官全视屏骁龙855双卡双待全网通', '', '10999.00', '1000', '0', '人民币', '2100.00', '1', '', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/75e157ed82cddff5.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/7abac18ca0e45f30.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/f29e27f46bc990e1.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/75e157ed82cddff5.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/4d23a004ab9ecdda.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/7abac18ca0e45f30.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/f29e27f46bc990e1.jpg\" /></p>', '', null, null, '0', '0', '三星', '影音娱乐');
INSERT INTO `pms_product` VALUES ('43', '70', '56', '0', '10', '惠普（HP）暗影精灵', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b13bbcfNce388ace.jpg', '50845h8096', '0', '1', '0', '1', '0', '197', '0', '6299.00', null, '0', '0', '0', '暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1050Ti 4G独显 IPS FHD）', '暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1050Ti 4G独显 IPS FHD）', '6599.00', '199', '0', '个', '4860.00', '0', '', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b0e4c65N351eb7ea.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b0e4c67N449b51ae.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/212da9c8e0637624.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b0e4c65N351eb7ea.jpg\" /></p>', '', null, null, '0', '0', '惠普', '');
INSERT INTO `pms_product` VALUES ('44', '65', '56', '0', '10', '联想(Lenovo)拯救者', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b13bbcfNce388ace.jpg', '50807y0-8', '0', '1', '0', '1', '0', '280', '0', '6199.00', null, '0', '0', '0', '拯救者Y7000英特尔酷睿i5 15.6英寸高色域游戏笔记本电脑( i5-8300H 8G 512G GTX1050Ti 72% NTSC)', '拯救者Y7000英特尔酷睿i5 15.6英寸高色域游戏笔记本电脑( i5-8300H 8G 512G GTX1050Ti 72% NTSC)', '6599.00', '290', '0', '个', '4682.00', '1', '2,3', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5934467dc526ca7c.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5bc82201Nc7b57537.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5934467dc526ca7c.jpg\" /></p>', '', null, null, '0', '0', '联想', '');
INSERT INTO `pms_product` VALUES ('45', '51', '30', '0', '6', 'Apple AirPods 蓝牙无线耳机', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b16369dN3ff71efd.jpg', 'tt5867894', '0', '1', '1', '1', '0', '500', '0', '1499.00', null, '0', '0', '0', 'Apple AirPods 蓝牙无线耳机', 'Apple AirPods 蓝牙无线耳机', '1699.00', '458', '0', '个', '100.00', '0', '1,3', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5853458bN0ba95462.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5b16369dN94b6ebe5.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/58534587N53c62548.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5853458bN0ba95462.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/58534587N53c62548.jpg\" /></p>', '', null, null, '0', '0', '苹果', '智能手机');
INSERT INTO `pms_product` VALUES ('46', '2', '33', '0', '6', '三星固态硬盘', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5ae2f18eNc6055d9a.jpg', 't65789h', '0', '1', '0', '1', '0', '100', '0', '1399.00', '1299.00', '0', '0', '0', '三星(SAMSUNG) 970 PRO 512G NVMe M.2 SSD固态硬盘（MZ-V7P512BW）', '三星(SAMSUNG) 970 PRO 512G NVMe M.2 SSD固态硬盘（MZ-V7P512BW）', '1499.00', '57', '0', '个', '29.00', '0', '1,2', '', '', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5ae2f18fNe825fd1a.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5ae2f18fN8385ee2b.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5ae2f18eNc6055d9a.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190312/5ae2f18fN8385ee2b.jpg\" /></p>', '', '2019-03-20 00:00:00', '2019-03-29 21:20:32', '0', '1', '三星', '数码配件');
INSERT INTO `pms_product` VALUES ('47', '51', '30', '0', '6', 'Apple iPhone X', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/微信图片_20190322230257.png', '7889051', '0', '1', '1', '1', '0', '999', '0', '6199.00', null, '0', '100', '0', ' (A1865) 64GB 深空灰色 移动联通电信4G手机', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '7199.00', '20', '0', '台', '300.00', '0', '1,2,3', 'iPhone X、全面屏', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机，最值的选择', '', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机，最值的选择', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/微信图片_20190322230257.png\" /></p>', '', null, null, '0', '0', '苹果', '智能手机');
INSERT INTO `pms_product` VALUES ('48', '65', '56', '0', '10', '联想(Lenovo)拯救者Y7000P', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/5bfbc0e5N263aeb9c.jpg', '7005y5420', '0', '1', '1', '1', '0', '500', '0', '8499.00', null, '0', '0', '0', 'Y7000P英特尔酷睿 i7 15.6英寸高色域游戏笔记本电脑(i7-8750H 8G 512G GTX1060 144Hz)', '联想(Lenovo)拯救者Y7000P英特尔酷睿 i7 15.6英寸高色域游戏笔记本电脑(i7-8750H 8G 512G GTX1060 144Hz)\n屏幕规格\n15.6英寸\n显示比例\n宽屏16：9\n物理分辨率\n1920×1080\n屏幕类型\nIPS', '8999.00', '100', '0', '台', '4200.00', '0', '1,2,3', '1066', '色域：72%NTSC', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/7eb2a4ca90ee53d1.jpg,http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/56e92bcf14c511fe.jpg', '联想(Lenovo)拯救者Y7000P英特尔酷睿 i7 15.6英寸高色域游戏笔记本电脑(i7-8750H 8G 512G GTX1060 144Hz)', '商品毛重：4.18kg、显存容量：6G、刷新率：144HZ、游戏性能：吃鸡性能，发烧级', '<p><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/5bfbc0e5N263aeb9c.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/56e92bcf14c511fe.jpg\" /><img class=\"wscnph\" src=\"http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/7eb2a4ca90ee53d1.jpg\" /></p>', '', null, null, '0', '0', '联想', '');

-- ----------------------------
-- Table structure for `pms_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品属性参数表';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES ('1', '1', '尺寸', '2', '1', 'M,X,XL,2XL,3XL,4XL', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('7', '1', '颜色', '2', '1', '黑色,红色,白色,粉色', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('13', '0', '上市年份', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('14', '0', '上市年份1', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('15', '0', '上市年份2', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('16', '0', '上市年份3', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('17', '0', '上市年份4', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('18', '0', '上市年份5', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('19', '0', '适用对象', '1', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('20', '0', '适用对象1', '2', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('21', '0', '适用对象3', '2', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('24', '1', '商品编号', '1', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('25', '1', '适用季节', '1', '1', '春季,夏季,秋季,冬季', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('32', '2', '适用人群', '0', '1', '老年,青年,中年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('33', '2', '风格', '0', '1', '嘻哈风格,基础大众,商务正装', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('35', '2', '颜色', '0', '0', '', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('37', '1', '适用人群', '1', '1', '儿童,青年,中年,老年', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('38', '1', '上市时间', '1', '1', '2017年秋,2017年冬,2018年春,2018年夏', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('39', '1', '袖长', '1', '1', '短袖,长袖,中袖', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('40', '2', '尺码', '0', '1', '29,30,31,32,33,34', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('41', '2', '适用场景', '0', '1', '居家,运动,正装', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('42', '2', '上市时间', '0', '1', '2018年春,2018年夏', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('43', '3', '颜色', '0', '0', '', '100', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('44', '3', '容量', '0', '1', '16G,32G,64G,128G', '0', '0', '0', '0', '0', '0');
INSERT INTO `pms_product_attribute` VALUES ('45', '3', '屏幕尺寸', '0', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('46', '3', '网络', '0', '1', '3G,4G', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('47', '3', '系统', '0', '1', 'Android,IOS', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('48', '3', '电池容量', '0', '0', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `pms_product_attribute` VALUES ('75', '6', '颜色', '1', '1', '银色,深空灰色', '1', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('76', '6', '内存', '1', '1', '64G,256G', '100', '0', '1', '1', '1', '1');
INSERT INTO `pms_product_attribute` VALUES ('77', '10', 'cpu', '0', '1', 'i5-8300H,i7-8750H,i5-8250U,i7-8550U', '1', '0', '1', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('78', '10', '显卡', '1', '1', '1070Max 8G,1060Max 3G,1060Max G,1050 2G,1050 4G,1050Ti 4G', '18', '0', '0', '0', '1', '1');
INSERT INTO `pms_product_attribute` VALUES ('79', '10', '内存', '1', '1', '8G,16G', '1', '0', '1', '1', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('80', '10', '硬盘', '0', '0', '128G SSD  +  1T,256G SSD,256G SSD  +  1T,512G SSD', '2', '0', '0', '0', '1', '0');
INSERT INTO `pms_product_attribute` VALUES ('81', '11', '颜色', '0', '0', '', '1', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `pms_product_attribute_category`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '属性数量',
  `param_count` int(11) DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品属性分类表';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES ('6', '手机', '1', '1');
INSERT INTO `pms_product_attribute_category` VALUES ('10', '笔记本电脑', '3', '1');
INSERT INTO `pms_product_attribute_category` VALUES ('11', '家用电器', '1', '0');

-- ----------------------------
-- Table structure for `pms_product_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存储产品参数信息的表';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES ('1', '9', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('2', '10', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('3', '11', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('4', '12', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('5', '13', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('6', '14', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('7', '18', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('8', '7', '1', 'X');
INSERT INTO `pms_product_attribute_value` VALUES ('9', '7', '1', 'XL');
INSERT INTO `pms_product_attribute_value` VALUES ('10', '7', '1', 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES ('11', '22', '7', 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES ('12', '22', '24', 'no110');
INSERT INTO `pms_product_attribute_value` VALUES ('13', '22', '25', '春季');
INSERT INTO `pms_product_attribute_value` VALUES ('14', '22', '37', '青年');
INSERT INTO `pms_product_attribute_value` VALUES ('15', '22', '38', '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES ('16', '22', '39', '长袖');
INSERT INTO `pms_product_attribute_value` VALUES ('124', '23', '7', '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES ('125', '23', '24', 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES ('126', '23', '25', '春季');
INSERT INTO `pms_product_attribute_value` VALUES ('127', '23', '37', '青年');
INSERT INTO `pms_product_attribute_value` VALUES ('128', '23', '38', '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES ('129', '23', '39', '长袖');
INSERT INTO `pms_product_attribute_value` VALUES ('130', '1', '13', null);
INSERT INTO `pms_product_attribute_value` VALUES ('131', '1', '14', null);
INSERT INTO `pms_product_attribute_value` VALUES ('132', '1', '15', null);
INSERT INTO `pms_product_attribute_value` VALUES ('133', '1', '16', null);
INSERT INTO `pms_product_attribute_value` VALUES ('134', '1', '17', null);
INSERT INTO `pms_product_attribute_value` VALUES ('135', '1', '18', null);
INSERT INTO `pms_product_attribute_value` VALUES ('136', '1', '19', null);
INSERT INTO `pms_product_attribute_value` VALUES ('137', '1', '20', null);
INSERT INTO `pms_product_attribute_value` VALUES ('138', '1', '21', null);
INSERT INTO `pms_product_attribute_value` VALUES ('139', '2', '13', null);
INSERT INTO `pms_product_attribute_value` VALUES ('140', '2', '14', null);
INSERT INTO `pms_product_attribute_value` VALUES ('141', '2', '15', null);
INSERT INTO `pms_product_attribute_value` VALUES ('142', '2', '16', null);
INSERT INTO `pms_product_attribute_value` VALUES ('143', '2', '17', null);
INSERT INTO `pms_product_attribute_value` VALUES ('144', '2', '18', null);
INSERT INTO `pms_product_attribute_value` VALUES ('145', '2', '19', null);
INSERT INTO `pms_product_attribute_value` VALUES ('146', '2', '20', null);
INSERT INTO `pms_product_attribute_value` VALUES ('147', '2', '21', null);
INSERT INTO `pms_product_attribute_value` VALUES ('183', '31', '24', null);
INSERT INTO `pms_product_attribute_value` VALUES ('184', '31', '25', '夏季');
INSERT INTO `pms_product_attribute_value` VALUES ('185', '31', '37', '青年');
INSERT INTO `pms_product_attribute_value` VALUES ('186', '31', '38', '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES ('187', '31', '39', '短袖');
INSERT INTO `pms_product_attribute_value` VALUES ('198', '30', '24', null);
INSERT INTO `pms_product_attribute_value` VALUES ('199', '30', '25', '夏季');
INSERT INTO `pms_product_attribute_value` VALUES ('200', '30', '37', '青年');
INSERT INTO `pms_product_attribute_value` VALUES ('201', '30', '38', '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES ('202', '30', '39', '短袖');
INSERT INTO `pms_product_attribute_value` VALUES ('213', '27', '43', '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES ('214', '27', '45', '5.8');
INSERT INTO `pms_product_attribute_value` VALUES ('215', '27', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('216', '27', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('217', '27', '48', '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES ('218', '28', '43', '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES ('219', '28', '45', '5.0');
INSERT INTO `pms_product_attribute_value` VALUES ('220', '28', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('221', '28', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('222', '28', '48', '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES ('223', '29', '43', '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES ('224', '29', '45', '4.7');
INSERT INTO `pms_product_attribute_value` VALUES ('225', '29', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('226', '29', '47', 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES ('227', '29', '48', '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES ('228', '26', '43', '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES ('229', '26', '45', '5.0');
INSERT INTO `pms_product_attribute_value` VALUES ('230', '26', '46', '4G');
INSERT INTO `pms_product_attribute_value` VALUES ('231', '26', '47', 'Android');
INSERT INTO `pms_product_attribute_value` VALUES ('232', '26', '48', '3000');
INSERT INTO `pms_product_attribute_value` VALUES ('233', '37', '56', '方法');
INSERT INTO `pms_product_attribute_value` VALUES ('234', '37', '70', '铝合金、不锈钢');
INSERT INTO `pms_product_attribute_value` VALUES ('235', '37', '69', 'dfz');
INSERT INTO `pms_product_attribute_value` VALUES ('236', '37', '65', null);
INSERT INTO `pms_product_attribute_value` VALUES ('237', '37', '68', null);
INSERT INTO `pms_product_attribute_value` VALUES ('238', '37', '59', null);
INSERT INTO `pms_product_attribute_value` VALUES ('239', '37', '60', null);
INSERT INTO `pms_product_attribute_value` VALUES ('240', '37', '63', null);
INSERT INTO `pms_product_attribute_value` VALUES ('241', '37', '67', null);
INSERT INTO `pms_product_attribute_value` VALUES ('242', '37', '62', null);
INSERT INTO `pms_product_attribute_value` VALUES ('243', '37', '64', null);
INSERT INTO `pms_product_attribute_value` VALUES ('244', '37', '66', null);
INSERT INTO `pms_product_attribute_value` VALUES ('245', '37', '57', null);
INSERT INTO `pms_product_attribute_value` VALUES ('246', '37', '58', null);
INSERT INTO `pms_product_attribute_value` VALUES ('247', '37', '61', null);
INSERT INTO `pms_product_attribute_value` VALUES ('248', '38', '49', '碳晶黑');
INSERT INTO `pms_product_attribute_value` VALUES ('269', '43', '71', null);
INSERT INTO `pms_product_attribute_value` VALUES ('270', '43', '74', null);
INSERT INTO `pms_product_attribute_value` VALUES ('271', '43', '72', null);
INSERT INTO `pms_product_attribute_value` VALUES ('272', '43', '73', null);
INSERT INTO `pms_product_attribute_value` VALUES ('273', '43', '50', null);
INSERT INTO `pms_product_attribute_value` VALUES ('274', '44', '71', 'Lenovo');
INSERT INTO `pms_product_attribute_value` VALUES ('275', '44', '74', 'Intel i5标准电压版、Intel i7标准电压版、Intel i9标准电压版、AMD Ryzen、桌面级处理器');
INSERT INTO `pms_product_attribute_value` VALUES ('276', '44', '73', '15.5');
INSERT INTO `pms_product_attribute_value` VALUES ('277', '47', '75', '红色');
INSERT INTO `pms_product_attribute_value` VALUES ('278', '47', '76', '256G');
INSERT INTO `pms_product_attribute_value` VALUES ('279', '48', '80', '512G SSD');
INSERT INTO `pms_product_attribute_value` VALUES ('280', '48', '77', 'I7-8750H,i5-8300H');
INSERT INTO `pms_product_attribute_value` VALUES ('281', '48', '79', '8G');
INSERT INTO `pms_product_attribute_value` VALUES ('282', '48', '78', '1050Ti 4G');

-- ----------------------------
-- Table structure for `pms_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES ('2', '0', '手机数码', '0', '100', '件', '1', '1', '1', null, '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES ('3', '0', '电脑整机', '0', '100', '件', '1', '1', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '电脑整机', '电脑整机');
INSERT INTO `pms_product_category` VALUES ('13', '12', '家电子分类1', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES ('14', '12', '家电子分类2', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES ('30', '2', '智能手机', '1', '0', '件', '1', '1', '10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES ('31', '2', '摄影摄像', '1', '0', '个', '1', '1', '8', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '');
INSERT INTO `pms_product_category` VALUES ('32', '2', '影音娱乐', '1', '0', '', '1', '1', '0', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES ('33', '2', '数码配件', '1', '0', '', '1', '1', '0', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES ('34', '2', '智能设备', '1', '0', '', '1', '1', '0', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '');
INSERT INTO `pms_product_category` VALUES ('43', '4', '笔记本整机', '1', '0', '', '1', '1', '0', '', '笔记本整机', '笔记本整机');
INSERT INTO `pms_product_category` VALUES ('52', '0', '外设产品', '0', '0', '个', '1', '1', '3', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/u=2247058343,3295009378&fm=26&gp=0.jpg', '外设产品', '鼠标，键盘，耳机');
INSERT INTO `pms_product_category` VALUES ('53', '2', '电子教育', '1', '0', '件', '1', '1', '6', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190308/timg (13).jpg', '', '');
INSERT INTO `pms_product_category` VALUES ('54', '0', '家用电器', '0', '0', '100', '1', '1', '0', '', '', '');
INSERT INTO `pms_product_category` VALUES ('55', '54', '电视机', '1', '0', '件', '1', '1', '10', '', '4K电视', '电视机');
INSERT INTO `pms_product_category` VALUES ('56', '3', '游戏笔记本', '1', '0', '件', '1', '1', '10', '', '游戏本', '游戏本');
INSERT INTO `pms_product_category` VALUES ('57', '52', '游戏鼠标', '1', '0', '个', '1', '1', '1', '', '游戏鼠标、外设产品', '游戏鼠标、外设产品');
INSERT INTO `pms_product_category` VALUES ('58', '52', '键盘', '1', '0', '个', '1', '1', '1', '', '键盘', '键盘');
INSERT INTO `pms_product_category` VALUES ('59', '3', '工作站', '1', '0', '台', '1', '1', '1777', '', '工作站', '工作站');
INSERT INTO `pms_product_category` VALUES ('60', '3', '台式机', '1', '0', '台式机', '1', '1', '13556', '', '台式机', '台式机');
INSERT INTO `pms_product_category` VALUES ('61', '3', '一体机', '1', '0', '一体机', '1', '1', '145', '', '一体机', '一体机');
INSERT INTO `pms_product_category` VALUES ('62', '54', '冰箱', '1', '0', '台', '1', '1', '142', '', '冰箱', '冰箱');

-- ----------------------------
-- Table structure for `pms_product_category_attribute_relation`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES ('1', '24', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('5', '26', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('7', '28', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('9', '25', '24');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('10', '25', '25');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('11', '55', '57');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('12', '55', '58');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('13', '55', '59');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('14', '56', '74');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('15', '56', '73');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('16', '56', '72');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('17', '59', '78');
INSERT INTO `pms_product_category_attribute_relation` VALUES ('18', '60', '78');

-- ----------------------------
-- Table structure for `pms_product_full_reduction`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品满减表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES ('1', '7', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('2', '8', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('3', '9', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('4', '10', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('5', '11', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('6', '12', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('7', '13', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('8', '14', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('9', '18', '100.00', '20.00');
INSERT INTO `pms_product_full_reduction` VALUES ('10', '7', '200.00', '50.00');
INSERT INTO `pms_product_full_reduction` VALUES ('11', '7', '300.00', '100.00');
INSERT INTO `pms_product_full_reduction` VALUES ('14', '22', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('16', '24', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('34', '23', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('44', '31', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('46', '32', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('48', '33', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('53', '36', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('54', '35', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('55', '34', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('56', '30', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('59', '27', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('60', '28', '500.00', '50.00');
INSERT INTO `pms_product_full_reduction` VALUES ('61', '28', '1000.00', '120.00');
INSERT INTO `pms_product_full_reduction` VALUES ('62', '29', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('63', '26', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('64', '37', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('65', '38', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('70', '43', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('71', '44', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('72', '45', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('73', '46', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('74', '47', '0.00', '0.00');
INSERT INTO `pms_product_full_reduction` VALUES ('75', '48', '0.00', '0.00');

-- ----------------------------
-- Table structure for `pms_product_ladder`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品阶梯价格表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES ('1', '26', '3', '0.70', '2651.60');
INSERT INTO `pms_product_ladder` VALUES ('2', '27', '3', '0.70', '1890.00');
INSERT INTO `pms_product_ladder` VALUES ('3', '28', '3', '0.90', '585.00');
INSERT INTO `pms_product_ladder` VALUES ('4', '29', '3', '0.60', '3300.00');
INSERT INTO `pms_product_ladder` VALUES ('5', '34', '3', '0.85', '3400.00');
INSERT INTO `pms_product_ladder` VALUES ('6', '36', '3', '0.90', '3240.00');
INSERT INTO `pms_product_ladder` VALUES ('70', '37', '100', '0.80', '2960.00');

-- ----------------------------
-- Table structure for `pms_product_operate_log`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int(11) DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) DEFAULT NULL,
  `use_point_limit_old` int(11) DEFAULT NULL,
  `use_point_limit_new` int(11) DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for `pms_product_vertify_record`
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核人',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品审核记录';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES ('1', '1', '2018-04-27 16:36:41', 'test', '1', '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES ('2', '2', '2018-04-27 16:36:41', 'test', '1', '验证通过');

-- ----------------------------
-- Table structure for `pms_sku_stock`
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sp3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='sku的库存';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES ('1', '7', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('2', '8', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('3', '9', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('4', '10', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('5', '11', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('6', '12', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('7', '13', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('8', '14', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('9', '18', 'string', '100.00', '0', '5', 'string', 'string', 'string', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('10', '7', 'string', '0.00', '0', '0', 'string', 'string', 'sp3', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('11', '7', 'string', '0.00', '0', '0', 'string', 'string', 'sp33', 'string', '0', null, '0');
INSERT INTO `pms_sku_stock` VALUES ('12', '22', '111', '99.00', '0', null, 'x', 'M', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('13', '22', '112', '99.00', '0', null, 'xx', 'M', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('78', '23', '201806070023001', '99.00', '0', null, '米白色', 'M', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('79', '23', '201806070023002', '99.00', '0', null, '米白色', 'X', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('80', '23', '201806070023003', '99.00', '0', null, '浅黄色', 'M', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('81', '23', '201806070023004', '99.00', '0', null, '浅黄色', 'X', null, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('98', '27', '201808270027001', '2699.00', '97', null, '黑色', '32G', null, null, null, null, '-24');
INSERT INTO `pms_sku_stock` VALUES ('99', '27', '201808270027002', '2999.00', '100', null, '黑色', '64G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('100', '27', '201808270027003', '2699.00', '100', null, '蓝色', '32G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('101', '27', '201808270027004', '2999.00', '100', null, '蓝色', '64G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('102', '28', '201808270028001', '649.00', '99', null, '金色', '16G', null, null, null, null, '-8');
INSERT INTO `pms_sku_stock` VALUES ('103', '28', '201808270028002', '699.00', '99', null, '金色', '32G', null, null, null, null, '-8');
INSERT INTO `pms_sku_stock` VALUES ('104', '28', '201808270028003', '649.00', '100', null, '银色', '16G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('105', '28', '201808270028004', '699.00', '100', null, '银色', '32G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('106', '29', '201808270029001', '5499.00', '99', null, '金色', '32G', null, null, null, null, '-8');
INSERT INTO `pms_sku_stock` VALUES ('107', '29', '201808270029002', '6299.00', '100', null, '金色', '64G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('108', '29', '201808270029003', '5499.00', '100', null, '银色', '32G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('109', '29', '201808270029004', '6299.00', '100', null, '银色', '64G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('110', '26', '201806070026001', '3788.00', '499', null, '金色', '16G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('111', '26', '201806070026002', '3999.00', '500', null, '金色', '32G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('112', '26', '201806070026003', '3788.00', '500', null, '银色', '16G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('113', '26', '201806070026004', '3999.00', '500', null, '银色', '32G', null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('114', '37', '2394234', '7888.00', '100', '20', '方法', null, null, null, null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('115', '47', '5454685yy', '6599.00', '10', '3', '红色', null, null, 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/微信图片_20190322230257.png', null, null, '0');
INSERT INTO `pms_sku_stock` VALUES ('116', '48', 'i5Y830512120', '7299.00', '300', '10', '512G SSD', 'i5-8300H', '8G', 'http://e-mall.oss-cn-beijing.aliyuncs.com/e-mall/img/20190322/5bfbc0e5N263aeb9c.jpg', null, null, '0');

-- ----------------------------
-- Table structure for `sms_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `platform` int(1) DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int(1) DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠卷表';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES ('2', '0', '全品类通用券', '0', '92', '10.00', '1', '100.00', '2018-08-27 16:40:47', '2018-11-23 16:40:47', '0', '满100减10', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('3', '0', '小米手机专用券', '0', '92', '50.00', '1', '1000.00', '2018-08-27 16:40:47', '2018-11-16 16:40:47', '2', '小米手机专用优惠券', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('4', '0', '手机品类专用券', '0', '92', '300.00', '1', '2000.00', '2018-08-27 16:40:47', '2018-09-15 16:40:47', '1', '手机分类专用优惠券', '100', '0', '8', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('7', '0', 'T恤分类专用优惠券', '0', '93', '50.00', '1', '500.00', '2018-08-27 16:40:47', '2018-08-15 16:40:47', '1', '满500减50', '100', '0', '7', '2018-08-27 16:40:47', null, null);
INSERT INTO `sms_coupon` VALUES ('8', '0', '新优惠券', '0', '100', '100.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-27 00:00:00', '0', '测试', '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('9', '0', '全品类通用券', '0', '100', '5.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('10', '0', '全品类通用券', '0', '100', '15.00', '1', '200.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null, null);
INSERT INTO `sms_coupon` VALUES ('11', '0', '全品类通用券', '0', '1000', '50.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '1000', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('12', '0', '移动端全品类通用券', '1', '1', '10.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('19', '0', '手机分类专用', '0', '100', '100.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-17 00:00:00', '1', '手机分类专用', '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('20', '0', '小米手机专用', '0', '100', '200.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-24 00:00:00', '2', '小米手机专用', '100', '0', '0', null, null, null);
INSERT INTO `sms_coupon` VALUES ('21', '0', 'xxx', '0', '100', '10.00', '1', '100.00', '2018-11-09 00:00:00', '2018-11-30 00:00:00', '2', null, '100', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `sms_coupon_history`
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int(1) DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券使用、领取历史表';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES ('2', '2', '1', '4931048380330002', 'windir', '1', '2018-08-29 14:04:12', '1', '2018-11-12 14:38:47', '12', '201809150101000001');
INSERT INTO `sms_coupon_history` VALUES ('3', '3', '1', '4931048380330003', 'windir', '1', '2018-08-29 14:04:29', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('4', '4', '1', '4931048380330004', 'windir', '1', '2018-08-29 14:04:32', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('11', '7', '1', '4931048380330001', 'windir', '1', '2018-09-04 16:21:50', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('12', '2', '4', '0340981248320004', 'zhensan', '1', '2018-11-12 14:16:50', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('13', '3', '4', '0342977234360004', 'zhensan', '1', '2018-11-12 14:17:10', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('14', '4', '4', '0343342928830004', 'zhensan', '1', '2018-11-12 14:17:13', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('15', '2', '5', '0351883832180005', 'lisi', '1', '2018-11-12 14:18:39', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('16', '3', '5', '0352201672680005', 'lisi', '1', '2018-11-12 14:18:42', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('17', '4', '5', '0352505810180005', 'lisi', '1', '2018-11-12 14:18:45', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('18', '2', '6', '0356114588380006', 'wangwu', '1', '2018-11-12 14:19:21', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('19', '3', '6', '0356382856920006', 'wangwu', '1', '2018-11-12 14:19:24', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('20', '4', '6', '0356656798470006', 'wangwu', '1', '2018-11-12 14:19:27', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('21', '2', '3', '0363644984620003', 'windy', '1', '2018-11-12 14:20:36', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('22', '3', '3', '0363932820300003', 'windy', '1', '2018-11-12 14:20:39', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('23', '4', '3', '0364238275840003', 'windy', '1', '2018-11-12 14:20:42', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('24', '2', '7', '0385034833070007', 'lion', '1', '2018-11-12 14:24:10', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('25', '3', '7', '0385350208650007', 'lion', '1', '2018-11-12 14:24:13', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('26', '4', '7', '0385632733900007', 'lion', '1', '2018-11-12 14:24:16', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('27', '2', '8', '0388779132990008', 'shari', '1', '2018-11-12 14:24:48', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('28', '3', '8', '0388943658810008', 'shari', '1', '2018-11-12 14:24:49', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('29', '4', '8', '0389069398320008', 'shari', '1', '2018-11-12 14:24:51', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('30', '2', '9', '0390753935250009', 'aewen', '1', '2018-11-12 14:25:08', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('31', '3', '9', '0390882954470009', 'aewen', '1', '2018-11-12 14:25:09', '0', null, null, null);
INSERT INTO `sms_coupon_history` VALUES ('32', '4', '9', '0391025542810009', 'aewen', '1', '2018-11-12 14:25:10', '0', null, null, null);

-- ----------------------------
-- Table structure for `sms_coupon_product_category_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES ('4', '19', '30', '手机配件', '手机数码');

-- ----------------------------
-- Table structure for `sms_coupon_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES ('9', '21', '33', '小米（MI）小米电视4A ', '4609652');

-- ----------------------------
-- Table structure for `sms_flash_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int(1) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES ('3', '前端测试专用活动', '2019-03-25', '2019-03-27', '1', '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES ('13', '测试', '2018-11-01', '2018-11-30', '0', '2018-11-19 10:34:24');
INSERT INTO `sms_flash_promotion` VALUES ('14', '开学季，换新装', '2019-03-08', '2019-03-09', '1', '2019-03-08 09:29:49');
INSERT INTO `sms_flash_promotion` VALUES ('15', '3.8女王节', '2019-03-08', '2019-03-09', '0', '2019-03-08 09:36:31');
INSERT INTO `sms_flash_promotion` VALUES ('16', '装备粉红客', '2019-03-07', '2019-03-09', '0', '2019-03-08 09:38:09');
INSERT INTO `sms_flash_promotion` VALUES ('17', '女王献礼', '2019-03-07', '2019-03-09', '0', '2019-03-08 09:38:41');

-- ----------------------------
-- Table structure for `sms_flash_promotion_log`
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时购通知记录';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_flash_promotion_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('1', '2', '1', '26', '3000.00', '10', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('2', '2', '1', '27', '2000.00', '10', '1', '20');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('3', '2', '1', '28', '599.00', '19', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('4', '2', '1', '29', '4999.00', '10', '1', '100');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('9', '2', '2', '26', '2999.00', '100', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('10', '2', '2', '27', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('11', '2', '2', '28', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('12', '2', '2', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('13', '2', '2', '30', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('14', '2', '3', '31', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('15', '2', '3', '32', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('16', '2', '4', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('17', '2', '4', '34', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('18', '2', '5', '36', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('19', '2', '6', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('20', '2', '6', '34', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('21', '3', '1', '26', '3000.00', '100', '1', '10');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('22', '3', '1', '27', '1999.00', '10', '1', '9');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('23', '3', '1', '28', '599.00', '10', '1', '8');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('24', '3', '1', '29', '4999.00', '10', '1', '7');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('25', '3', '2', '31', '90.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('26', '3', '2', '32', '60.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('27', '3', '2', '33', '2299.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('28', '3', '2', '34', '3888.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('29', '3', '3', '36', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('30', '3', '3', '35', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('31', '3', '3', '31', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('32', '3', '3', '32', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('33', '3', '4', '26', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('34', '3', '4', '27', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('35', '3', '4', '28', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('36', '3', '4', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('37', '3', '5', '26', '3688.00', '100', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('38', '3', '5', '27', '2599.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('39', '3', '5', '28', '599.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('40', '3', '5', '29', '4999.00', '10', '1', null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('41', '3', '6', '26', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('42', '3', '6', '27', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('43', '3', '6', '28', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('44', '3', '6', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('45', '5', '3', '26', '3500.00', '100', '2', '1');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('46', '5', '3', '28', '599.00', '100', '5', '2');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('47', '5', '3', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('48', '2', '3', '26', null, null, null, null);

-- ----------------------------
-- Table structure for `sms_flash_promotion_session`
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES ('1', '8:00', '08:00:00', '10:01:00', '1', '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES ('2', '10:00', '10:00:00', '12:00:00', '1', '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('3', '12:00', '12:00:00', '14:00:00', '1', '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES ('4', '14:00', '14:00:00', '16:00:00', '1', '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES ('5', '16:00', '16:00:00', '18:00:00', '1', '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES ('6', '18:00', '18:00:00', '20:00:00', '1', '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('7', '20:00', '20:00:33', '21:00:33', '0', '2018-11-16 13:22:55');
INSERT INTO `sms_flash_promotion_session` VALUES ('8', '新品促销', '14:00:00', '14:30:00', '1', '2019-03-04 14:37:19');

-- ----------------------------
-- Table structure for `sms_home_advertise`
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES ('2', '夏季大热促销', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', '0', '0', '0', null, '夏季大热促销', '0');
INSERT INTO `sms_home_advertise` VALUES ('3', '夏季大热促销1', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '0', '0', '0', null, '夏季大热促销1', '0');
INSERT INTO `sms_home_advertise` VALUES ('4', '夏季大热促销2', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '1', '0', '0', null, '夏季大热促销2', '0');
INSERT INTO `sms_home_advertise` VALUES ('9', '折扣推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'www.baidu.com', '电影推荐广告', '100');
INSERT INTO `sms_home_advertise` VALUES ('10', '品牌促销广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'xxx', null, '99');
INSERT INTO `sms_home_advertise` VALUES ('11', '新品推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', '1', '0', '0', 'xxx', null, '98');

-- ----------------------------
-- Table structure for `sms_home_brand`
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES ('1', '1', '万和', '1', '200');
INSERT INTO `sms_home_brand` VALUES ('2', '2', '三星', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('6', '6', '小米', '1', '300');
INSERT INTO `sms_home_brand` VALUES ('8', '5', '方太', '1', '100');
INSERT INTO `sms_home_brand` VALUES ('33', '51', '苹果', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('35', '3', '华为', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('36', '4', '格力', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('37', '5', '方太', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('38', '1', '万和', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('39', '21', 'OPPO', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('40', '3', '华为', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('41', '21', 'OPPO', '1', '0');

-- ----------------------------
-- Table structure for `sms_home_new_product`
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES ('2', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '200');
INSERT INTO `sms_home_new_product` VALUES ('8', '26', '华为 HUAWEI P20 ', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('9', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('10', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('11', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');

-- ----------------------------
-- Table structure for `sms_home_recommend_product`
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES ('3', '26', '华为 HUAWEI P20 ', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('4', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('5', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('6', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');

-- ----------------------------
-- Table structure for `sms_home_recommend_subject`
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES ('15', '2', '大牌手机低价秒', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('16', '3', '晓龙845新品上市', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('18', '5', '夏季精选', '0', '100');
INSERT INTO `sms_home_recommend_subject` VALUES ('19', '6', '品牌手机降价', '1', '0');

-- ----------------------------
-- Table structure for `ums_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES ('1', 'test', '202cb962ac59075b964b07152d234b70', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', null, '测试账号', null, '2018-09-29 13:55:30', '2018-09-29 13:55:39', '1');
INSERT INTO `ums_admin` VALUES ('3', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-03-24 21:39:06', '1');

-- ----------------------------
-- Table structure for `ums_admin_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户登录日志表';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES ('5', '3', '2018-12-06 13:59:12', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('6', '3', '2018-12-17 13:23:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('7', '3', '2018-12-18 13:51:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('8', '3', '2018-12-18 13:51:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('9', '3', '2019-01-28 16:20:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('10', '3', '2019-01-29 09:16:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('11', '3', '2019-01-29 10:10:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('12', '3', '2019-03-04 10:48:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('13', '3', '2019-03-04 13:16:57', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('14', '3', '2019-03-04 13:55:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('15', '3', '2019-03-04 15:52:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('16', '3', '2019-03-04 16:16:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('17', '3', '2019-03-05 15:23:59', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('18', '3', '2019-03-05 15:26:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('19', '3', '2019-03-05 15:27:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('20', '3', '2019-03-05 16:11:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('21', '3', '2019-03-06 13:55:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('22', '3', '2019-03-06 14:21:56', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('23', '3', '2019-03-06 15:25:36', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('24', '3', '2019-03-07 14:20:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('25', '3', '2019-03-07 15:04:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('26', '3', '2019-03-07 15:45:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('27', '3', '2019-03-07 15:58:12', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('28', '3', '2019-03-07 16:31:54', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('29', '3', '2019-03-08 08:27:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('30', '3', '2019-03-08 08:55:59', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('31', '3', '2019-03-08 13:24:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('32', '3', '2019-03-08 15:24:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('33', '3', '2019-03-12 09:44:24', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('34', '3', '2019-03-12 09:54:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('35', '3', '2019-03-12 20:39:40', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('36', '3', '2019-03-22 21:43:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('37', '3', '2019-03-23 09:56:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('38', '3', '2019-03-23 23:30:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('39', '3', '2019-03-24 21:39:06', '0:0:0:0:0:0:0:1', null, null);

-- ----------------------------
-- Table structure for `ums_admin_permission_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_admin_role_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES ('13', '3', '1');
INSERT INTO `ums_admin_role_relation` VALUES ('15', '3', '2');
INSERT INTO `ums_admin_role_relation` VALUES ('16', '3', '4');
INSERT INTO `ums_admin_role_relation` VALUES ('17', '3', '5');

-- ----------------------------
-- Table structure for `ums_growth_change_history`
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='成长值变化历史记录表';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES ('1', '1', '2018-08-29 17:16:35', '0', '1000', 'test', '测试使用', '1');

-- ----------------------------
-- Table structure for `ums_integration_change_history`
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分变化历史记录表';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_integration_consume_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分消费设置';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES ('1', '100', '50', '100', '1');

-- ----------------------------
-- Table structure for `ums_member`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `gender` int(1) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE,
  UNIQUE KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES ('3', '4', 'windy', 'E10ADC3949BA59ABBE56E057F20F883E', 'windy', '18061581848', '1', '2018-08-03 16:46:38', null, '0', '2019-03-11', '天津', '程序猿', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('4', '4', 'zhengsan', 'E10ADC3949BA59ABBE56E057F20F883E', 'zhengsan', '18061581847', '1', '2018-11-12 14:12:04', null, '0', '2019-03-18', '北京', '公务员', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('5', '4', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', 'lisi', '18061581841', '1', '2018-11-12 14:12:38', null, '0', '2019-03-18', '上海', '项目经理', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('6', '4', 'wangwu', 'E10ADC3949BA59ABBE56E057F20F883E', 'wangwu', '18061581842', '1', '2018-11-12 14:13:09', null, '1', '2019-03-17', '济南', '人事主管', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('7', '4', 'lion', 'E10ADC3949BA59ABBE56E057F20F883E', 'lion', '18061581845', '1', '2018-11-12 14:21:39', null, '1', '2019-03-17', '青岛', '项目组长', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('13', null, '666', 'E10ADC3949BA59ABBE56E057F20F883E', '454', '43567698987', '1', null, null, '0', '2019-03-08', '33', '234', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('14', null, 'wanger', 'E10ADC3949BA59ABBE56E057F20F883E', '王二', '16867453472', '1', null, null, '0', '2019-03-08', '南京', '学生', null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('15', '4', '100000', '96E79218965EB72C92A549DD5A330112', null, '15234567890', '1', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `ums_member_level`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员等级表';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES ('1', '黄金会员', '1000', '0', '199.00', '5', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('2', '白金会员', '5000', '0', '99.00', '10', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('3', '钻石会员', '15000', '0', '69.00', '15', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('4', '普通会员', '1', '1', '199.00', '20', '1', '1', '1', '1', '0', '0', null);

-- ----------------------------
-- Table structure for `ums_member_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员登录记录';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_member_tag_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和标签关系表';

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_product_category_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员与产品分类关系表（用户喜欢的分类）';

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_receive_address`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员收货地址表';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES ('1', '1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES ('3', '1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES ('4', '1', '大梨', '18033441849', '1', '518000', '广东省', '深圳市', '福田区', '东晓街道');

-- ----------------------------
-- Table structure for `ums_member_rule_setting`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员积分成长规则表';

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_statistics_info`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL,
  `collect_subject_count` int(11) DEFAULT NULL,
  `collect_topic_count` int(11) DEFAULT NULL,
  `collect_comment_count` int(11) DEFAULT NULL,
  `invite_friend_count` int(11) DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员统计信息';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_tag`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finish_order_count` int(11) DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户标签表';

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_member_task`
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员任务表';

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for `ums_permission`
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户权限表';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES ('1', '0', '商品', null, null, '0', null, '1', '2018-09-29 16:15:14', '0');
INSERT INTO `ums_permission` VALUES ('2', '1', '商品列表', 'pms:product:read', null, '1', '/pms/product/index', '1', '2018-09-29 16:17:01', '0');
INSERT INTO `ums_permission` VALUES ('3', '1', '添加商品', 'pms:product:create', null, '1', '/pms/product/add', '1', '2018-09-29 16:18:51', '0');
INSERT INTO `ums_permission` VALUES ('4', '1', '商品分类', 'pms:productCategory:read', null, '1', '/pms/productCate/index', '1', '2018-09-29 16:23:07', '0');
INSERT INTO `ums_permission` VALUES ('5', '1', '商品类型', 'pms:productAttribute:read', null, '1', '/pms/productAttr/index', '1', '2018-09-29 16:24:43', '0');
INSERT INTO `ums_permission` VALUES ('6', '1', '品牌管理', 'pms:brand:read', null, '1', '/pms/brand/index', '1', '2018-09-29 16:25:45', '0');
INSERT INTO `ums_permission` VALUES ('7', '2', '编辑商品', 'pms:product:update', null, '2', '/pms/product/updateProduct', '1', '2018-09-29 16:34:23', '0');
INSERT INTO `ums_permission` VALUES ('8', '2', '删除商品', 'pms:product:delete', null, '2', '/pms/product/delete', '1', '2018-09-29 16:38:33', '0');
INSERT INTO `ums_permission` VALUES ('9', '4', '添加商品分类', 'pms:productCategory:create', null, '2', '/pms/productCate/create', '1', '2018-09-29 16:43:23', '0');
INSERT INTO `ums_permission` VALUES ('10', '4', '修改商品分类', 'pms:productCategory:update', null, '2', '/pms/productCate/update', '1', '2018-09-29 16:43:55', '0');
INSERT INTO `ums_permission` VALUES ('11', '4', '删除商品分类', 'pms:productCategory:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:44:38', '0');
INSERT INTO `ums_permission` VALUES ('12', '5', '添加商品类型', 'pms:productAttribute:create', null, '2', '/pms/productAttr/create', '1', '2018-09-29 16:45:25', '0');
INSERT INTO `ums_permission` VALUES ('13', '5', '修改商品类型', 'pms:productAttribute:update', null, '2', '/pms/productAttr/update', '1', '2018-09-29 16:48:08', '0');
INSERT INTO `ums_permission` VALUES ('14', '5', '删除商品类型', 'pms:productAttribute:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:48:44', '0');
INSERT INTO `ums_permission` VALUES ('15', '6', '添加品牌', 'pms:brand:create', null, '2', '/pms/brand/add', '1', '2018-09-29 16:49:34', '0');
INSERT INTO `ums_permission` VALUES ('16', '6', '修改品牌', 'pms:brand:update', null, '2', '/pms/brand/update', '1', '2018-09-29 16:50:55', '0');
INSERT INTO `ums_permission` VALUES ('17', '6', '删除品牌', 'pms:brand:delete', null, '2', '/pms/brand/delete', '1', '2018-09-29 16:50:59', '0');
INSERT INTO `ums_permission` VALUES ('18', '0', '首页', null, null, '0', null, '1', '2018-09-29 16:51:57', '0');
INSERT INTO `ums_permission` VALUES ('19', '0', '会员列表', 'ums:member:read', null, '1', '/ums/member/index', '1', '2019-03-06 14:10:04', '0');
INSERT INTO `ums_permission` VALUES ('20', '19', '添加会员', 'ums:member:create', null, '2', '/ums/member/create', '1', '2019-03-06 14:10:04', '0');
INSERT INTO `ums_permission` VALUES ('21', '19', '修改会员', 'ums:member:update', null, '2', '/ums/member/update', '1', '2019-03-06 14:10:04', '0');
INSERT INTO `ums_permission` VALUES ('22', '19', '删除会员', 'ums:member:delete', null, '2', '/ums/member/delete', '1', '2019-03-06 14:10:04', '0');

-- ----------------------------
-- Table structure for `ums_role`
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES ('1', '商品管理员', '商品管理员', '0', '2018-09-30 15:46:11', '1', '0');
INSERT INTO `ums_role` VALUES ('2', '商品分类管理员', '商品分类管理员', '0', '2018-09-30 15:53:45', '1', '0');
INSERT INTO `ums_role` VALUES ('3', '商品类型管理员', '商品类型管理员', '0', '2018-09-30 15:53:56', '1', '0');
INSERT INTO `ums_role` VALUES ('4', '品牌管理员', '品牌管理员', '0', '2018-09-30 15:54:12', '1', '0');
INSERT INTO `ums_role` VALUES ('5', '超级管理员', '全菜单管理员', '0', '2019-03-06 14:33:03', '1', '1');

-- ----------------------------
-- Table structure for `ums_role_permission_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES ('1', '1', '1');
INSERT INTO `ums_role_permission_relation` VALUES ('2', '1', '2');
INSERT INTO `ums_role_permission_relation` VALUES ('3', '1', '3');
INSERT INTO `ums_role_permission_relation` VALUES ('4', '1', '7');
INSERT INTO `ums_role_permission_relation` VALUES ('5', '1', '8');
INSERT INTO `ums_role_permission_relation` VALUES ('6', '2', '4');
INSERT INTO `ums_role_permission_relation` VALUES ('7', '2', '9');
INSERT INTO `ums_role_permission_relation` VALUES ('8', '2', '10');
INSERT INTO `ums_role_permission_relation` VALUES ('9', '2', '11');
INSERT INTO `ums_role_permission_relation` VALUES ('10', '3', '5');
INSERT INTO `ums_role_permission_relation` VALUES ('11', '3', '12');
INSERT INTO `ums_role_permission_relation` VALUES ('12', '3', '13');
INSERT INTO `ums_role_permission_relation` VALUES ('13', '3', '14');
INSERT INTO `ums_role_permission_relation` VALUES ('14', '4', '6');
INSERT INTO `ums_role_permission_relation` VALUES ('15', '4', '15');
INSERT INTO `ums_role_permission_relation` VALUES ('16', '4', '16');
INSERT INTO `ums_role_permission_relation` VALUES ('17', '4', '17');
INSERT INTO `ums_role_permission_relation` VALUES ('18', '5', '19');
INSERT INTO `ums_role_permission_relation` VALUES ('19', '5', '20');
INSERT INTO `ums_role_permission_relation` VALUES ('20', '5', '21');
INSERT INTO `ums_role_permission_relation` VALUES ('21', '5', '22');
