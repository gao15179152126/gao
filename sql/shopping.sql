/*
 Navicat MySQL Data Transfer

 Source Server         : GaoZhaohui
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 31/08/2019 11:12:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `cmoney` double(13, 2) NULL DEFAULT NULL,
  `cstatus` int(11) NULL DEFAULT NULL,
  `cnum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 395 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (385, 'zhaohui.gao@luckincoffee.com', 59, 23.00, 1, 1);
INSERT INTO `cart` VALUES (386, 'zhaohui.gao@luckincoffee.com', 63, 25.00, 1, 1);
INSERT INTO `cart` VALUES (393, 'zhao.gao@luckincoffee.com', 59, 23.00, 1, 1);
INSERT INTO `cart` VALUES (394, 'zhao.gao@luckincoffee.com', 63, 25.00, 1, 1);

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `couponId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `discount` float(3, 1) NULL DEFAULT NULL,
  `couponName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`couponId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (1, '1', '10', 10.0, '不使用优惠券');
INSERT INTO `coupon` VALUES (17, '156704014911820', 'zhaohui.gao@luckincoffee.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (19, '156704014911820', 'gao@qq.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (22, '156704014911820', 'gaotest@qq.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (23, '156704014911820', 'qwe@qq.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (24, '156704014911820', 'asd@qq.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (25, '156704014911820', 'zxc@qq.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (26, '156704014911820', 'qweasd@qq.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (27, '156704014911820', 'zhaotest@qq.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (28, '156704014911820', 'huitest@qq.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (30, '156706208519020', 'zhaohui.gao@luckincoffee.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (31, '156706208519020', 'gg@qq.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (34, '156713452629820', 'zhao.gao@luckincoffee.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (36, '156713477470020', 'zhaohui.gao@luckincoffee.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (37, '156713398309710', 'zhaohui.gao@luckincoffee.com', 5.8, '5.8折全场优惠券');
INSERT INTO `coupon` VALUES (38, '156713398309710', 'zhao.gao@luckincoffee.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (39, '156713452629820', 'zhaohui.gao@luckincoffee.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (40, '156715404443620', 'zhao.gao@luckincoffee.com', 6.8, '6.8折全场优惠券');
INSERT INTO `coupon` VALUES (41, '156715410565720', 'zhao.gao@luckincoffee.com', 8.8, '8.8折全场优惠券');
INSERT INTO `coupon` VALUES (42, '156715410565720', 'zhaohui.gao@luckincoffee.com', 6.8, '6.8折全场优惠券');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `odid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `pprice` double(13, 2) NULL DEFAULT NULL,
  `pnum` int(11) NULL DEFAULT NULL,
  `ono` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`odid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (179, 59, 23.00, 1, '156689739777010');
INSERT INTO `orderdetail` VALUES (180, 58, 23.00, 1, '156689739777010');
INSERT INTO `orderdetail` VALUES (181, 67, 28.00, 1, '156690443371573');
INSERT INTO `orderdetail` VALUES (182, 59, 23.00, 1, '156690443371573');
INSERT INTO `orderdetail` VALUES (183, 59, 23.00, 1, '156690452059273');
INSERT INTO `orderdetail` VALUES (184, 59, 23.00, 1, '156690453341473');
INSERT INTO `orderdetail` VALUES (185, 67, 28.00, 1, '156690489941210');
INSERT INTO `orderdetail` VALUES (186, 61, 23.00, 1, '156690489941210');
INSERT INTO `orderdetail` VALUES (187, 60, 23.00, 1, '156690489941210');
INSERT INTO `orderdetail` VALUES (188, 59, 23.00, 13, '156690489941210');
INSERT INTO `orderdetail` VALUES (189, 58, 27.00, 1, '156690495052710');
INSERT INTO `orderdetail` VALUES (190, 59, 23.00, 1, '156704014911820');
INSERT INTO `orderdetail` VALUES (191, 58, 27.00, 1, '156705647635410');
INSERT INTO `orderdetail` VALUES (192, 58, 27.00, 1, '156706091871520');
INSERT INTO `orderdetail` VALUES (193, 58, 27.00, 1, '156706208519020');
INSERT INTO `orderdetail` VALUES (194, 58, 27.00, 1, '156706873756520');
INSERT INTO `orderdetail` VALUES (195, 58, 27.00, 1, '156707017452420');
INSERT INTO `orderdetail` VALUES (196, 58, 27.00, 1, '156707060873220');
INSERT INTO `orderdetail` VALUES (197, 58, 27.00, 1, '156707073554120');
INSERT INTO `orderdetail` VALUES (198, 58, 27.00, 1, '156707165773620');
INSERT INTO `orderdetail` VALUES (199, 58, 27.00, 1, '156707204889820');
INSERT INTO `orderdetail` VALUES (200, 58, 27.00, 1, '156707261286620');
INSERT INTO `orderdetail` VALUES (201, 58, 27.00, 1, '156707300381720');
INSERT INTO `orderdetail` VALUES (202, 58, 27.00, 1, '156707302551620');
INSERT INTO `orderdetail` VALUES (203, 58, 27.00, 1, '156712559627620');
INSERT INTO `orderdetail` VALUES (204, 58, 27.00, 1, '156712572334620');
INSERT INTO `orderdetail` VALUES (205, 59, 23.00, 1, '156712581036020');
INSERT INTO `orderdetail` VALUES (206, 58, 27.00, 1, '156712831043720');
INSERT INTO `orderdetail` VALUES (207, 58, 27.00, 1, '156712874588220');
INSERT INTO `orderdetail` VALUES (208, 58, 27.00, 1, '156712980563320');
INSERT INTO `orderdetail` VALUES (209, 62, 23.00, 1, '156712998348920');
INSERT INTO `orderdetail` VALUES (210, 76, 22.00, 1, '156713016553220');
INSERT INTO `orderdetail` VALUES (211, 58, 27.00, 1, '156713021280420');
INSERT INTO `orderdetail` VALUES (212, 58, 27.00, 1, '156713073542620');
INSERT INTO `orderdetail` VALUES (213, 58, 27.00, 1, '156713118969620');
INSERT INTO `orderdetail` VALUES (214, 58, 27.00, 1, '156713134539420');
INSERT INTO `orderdetail` VALUES (215, 58, 27.00, 1, '156713147061020');
INSERT INTO `orderdetail` VALUES (216, 59, 23.00, 1, '156713279878020');
INSERT INTO `orderdetail` VALUES (217, 58, 27.00, 1, '156713306721120');
INSERT INTO `orderdetail` VALUES (218, 58, 27.00, 1, '156713320339010');
INSERT INTO `orderdetail` VALUES (219, 59, 23.00, 1, '156713380439010');
INSERT INTO `orderdetail` VALUES (220, 58, 27.00, 1, '156713398309710');
INSERT INTO `orderdetail` VALUES (221, 58, 27.00, 1, '156713450584420');
INSERT INTO `orderdetail` VALUES (222, 59, 23.00, 1, '156713452629820');
INSERT INTO `orderdetail` VALUES (223, 59, 23.00, 1, '156713477470020');
INSERT INTO `orderdetail` VALUES (224, 58, 27.00, 1, '156713477470020');
INSERT INTO `orderdetail` VALUES (225, 59, 23.00, 1, '156715404443620');
INSERT INTO `orderdetail` VALUES (226, 59, 23.00, 1, '156715410565720');
INSERT INTO `orderdetail` VALUES (227, 62, 23.00, 1, '156715410565720');
INSERT INTO `orderdetail` VALUES (228, 64, 25.00, 1, '156715410565720');
INSERT INTO `orderdetail` VALUES (229, 60, 23.00, 1, '156715410565720');
INSERT INTO `orderdetail` VALUES (230, 67, 28.00, 1, '156715410565720');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `odate` datetime(0) NULL DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `omoney` double(13, 2) NULL DEFAULT NULL,
  `ostatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ono` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE INDEX `ono`(`ono`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES (125, '2019-08-27 17:16:38', 'zhaohui.gao@luckincoffee.com', 40.48, '已取消', '156689739777010', NULL);
INSERT INTO `orderlist` VALUES (126, '2019-08-27 19:13:54', 'gao@qq.com', 51.00, '已完成', '156690443371573', '特防波特曼财富');
INSERT INTO `orderlist` VALUES (127, '2019-08-27 19:15:21', 'gao@qq.com', 23.00, '已取消', '156690452059273', NULL);
INSERT INTO `orderlist` VALUES (128, '2019-08-27 19:15:33', 'gao@qq.com', 23.00, '已取消', '156690453341473', NULL);
INSERT INTO `orderlist` VALUES (129, '2019-08-27 19:21:39', 'zhaohui.gao@luckincoffee.com', 328.24, '已完成', '156690489941210', '厦门市翔安区鼓锣三里');
INSERT INTO `orderlist` VALUES (130, '2019-08-27 19:22:31', 'zhaohui.gao@luckincoffee.com', 23.76, '已取消', '156690495052710', NULL);
INSERT INTO `orderlist` VALUES (131, '2019-08-29 08:55:49', 'zhao.gao@luckincoffee.com', 23.00, '已付款', '156704014911820', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (132, '2019-08-29 13:27:56', 'zhaohui.gao@luckincoffee.com', 23.76, '已取消', '156705647635410', NULL);
INSERT INTO `orderlist` VALUES (133, '2019-08-29 14:41:59', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156706091871520', NULL);
INSERT INTO `orderlist` VALUES (134, '2019-08-29 15:01:25', 'zhao.gao@luckincoffee.com', 27.00, '已付款', '156706208519020', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (135, '2019-08-29 16:52:18', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156706873756520', NULL);
INSERT INTO `orderlist` VALUES (136, '2019-08-29 17:16:15', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156707017452420', NULL);
INSERT INTO `orderlist` VALUES (137, '2019-08-29 17:23:29', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156707060873220', NULL);
INSERT INTO `orderlist` VALUES (138, '2019-08-29 17:25:36', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156707073554120', NULL);
INSERT INTO `orderlist` VALUES (139, '2019-08-29 17:40:58', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156707165773620', NULL);
INSERT INTO `orderlist` VALUES (140, '2019-08-29 17:47:29', 'zhao.gao@luckincoffee.com', 23.76, '已付款', '156707204889820', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (141, '2019-08-29 17:56:53', 'zhao.gao@luckincoffee.com', 23.76, '已付款', '156707261286620', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (142, '2019-08-29 18:03:24', 'zhao.gao@luckincoffee.com', 23.76, '已付款', '156707300381720', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (143, '2019-08-29 18:03:46', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156707302551620', NULL);
INSERT INTO `orderlist` VALUES (144, '2019-08-30 08:39:56', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156712559627620', NULL);
INSERT INTO `orderlist` VALUES (145, '2019-08-30 08:42:03', 'zhao.gao@luckincoffee.com', 23.76, '已付款', '156712572334620', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (146, '2019-08-30 08:43:30', 'zhao.gao@luckincoffee.com', 23.00, '已取消', '156712581036020', NULL);
INSERT INTO `orderlist` VALUES (147, '2019-08-30 09:25:10', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156712831043720', NULL);
INSERT INTO `orderlist` VALUES (148, '2019-08-30 09:32:26', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156712874588220', NULL);
INSERT INTO `orderlist` VALUES (149, '2019-08-30 09:50:06', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156712980563320', NULL);
INSERT INTO `orderlist` VALUES (150, '2019-08-30 09:53:03', 'zhao.gao@luckincoffee.com', 23.00, '已取消', '156712998348920', NULL);
INSERT INTO `orderlist` VALUES (151, '2019-08-30 09:56:06', 'zhao.gao@luckincoffee.com', 22.00, '已取消', '156713016553220', NULL);
INSERT INTO `orderlist` VALUES (152, '2019-08-30 09:56:53', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713021280420', NULL);
INSERT INTO `orderlist` VALUES (153, '2019-08-30 10:05:35', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713073542620', NULL);
INSERT INTO `orderlist` VALUES (154, '2019-08-30 10:13:10', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713118969620', NULL);
INSERT INTO `orderlist` VALUES (155, '2019-08-30 10:15:45', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713134539420', NULL);
INSERT INTO `orderlist` VALUES (156, '2019-08-30 10:17:51', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713147061020', NULL);
INSERT INTO `orderlist` VALUES (157, '2019-08-30 10:39:59', 'zhao.gao@luckincoffee.com', 23.00, '已取消', '156713279878020', NULL);
INSERT INTO `orderlist` VALUES (158, '2019-08-30 10:44:27', 'zhao.gao@luckincoffee.com', 27.00, '已取消', '156713306721120', NULL);
INSERT INTO `orderlist` VALUES (159, '2019-08-30 10:46:43', 'zhaohui.gao@luckincoffee.com', 23.76, '已取消', '156713320339010', NULL);
INSERT INTO `orderlist` VALUES (160, '2019-08-30 10:56:44', 'zhaohui.gao@luckincoffee.com', 20.24, '已取消', '156713380439010', NULL);
INSERT INTO `orderlist` VALUES (161, '2019-08-30 10:59:43', 'zhaohui.gao@luckincoffee.com', 23.76, '已付款', '156713398309710', '厦门市翔安区鼓锣三里');
INSERT INTO `orderlist` VALUES (162, '2019-08-30 11:08:26', 'zhao.gao@luckincoffee.com', 23.76, '已完成', '156713450584420', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (163, '2019-08-30 11:08:46', 'zhao.gao@luckincoffee.com', 23.00, '已付款', '156713452629820', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (164, '2019-08-30 11:12:55', 'zhao.gao@luckincoffee.com', 34.00, '已付款', '156713477470020', '特房波特曼财富中心');
INSERT INTO `orderlist` VALUES (165, '2019-08-30 16:34:04', 'zhao.gao@luckincoffee.com', 15.64, '已付款', '156715404443620', '厦门市翔安区鼓锣三里');
INSERT INTO `orderlist` VALUES (166, '2019-08-30 16:35:06', 'zhao.gao@luckincoffee.com', 105.21, '已付款', '156715410565720', '特房波特曼财富中心');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `ptype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pprice` double(13, 2) NULL DEFAULT NULL,
  `pimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pamount` int(11) NULL DEFAULT NULL,
  `pdetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (58, '大师咖啡', '美式咖啡', 22.00, '25e1e10b-45c4-4b86-b22e-77e4e8dfa7bacaffe-americano.jpg', 92, '简单即是美味，萃取经典浓缩咖啡，以水调和，香气浓郁蔓溢。');
INSERT INTO `product` VALUES (59, '大师咖啡', '拿铁', 23.00, 'cac3d74c-570e-4aa6-aaa0-516c598862a8caffe-latte.jpg', 81, '本色的经典咖啡。新鲜萃取的浓缩咖啡中缓缓倒入蒸煮牛奶，覆上轻柔奶泡，简单的香与纯。');
INSERT INTO `product` VALUES (60, '大师咖啡', '摩卡', 23.00, '76420bf7-49e9-46bc-ad97-4d40c57fb149caffe-mocha.jpg', 98, '摩卡最初是指一种带有巧克力风味的咖啡豆，现在，这份巧克力咖啡仍然带给你纯正的温暖。在浓缩咖啡中加入摩卡酱，与蒸煮牛奶一起交织出丝滑与醇厚。');
INSERT INTO `product` VALUES (61, '大师咖啡', '卡布奇若', 23.00, '1292a2d0-10ec-4666-944b-857f8acd6f28cappuccino.jpg', 99, '蒸煮牛奶与浓缩咖啡相融合，用丰厚绵密的奶泡覆顶，再撒上肉桂粉或可可粉。');
INSERT INTO `product` VALUES (62, '大师咖啡', '焦糖玛奇朵', 23.00, '6ac75820-bd6d-41d3-b506-199b3d1b64becaramel-macchiato.jpg', 99, '玛奇朵在意大利语中的意思是“印记”。从蒸煮牛奶和添加风味糖浆开始，再倒入醇厚的浓缩咖啡，留下属于玛奇朵的独有印记。');
INSERT INTO `product` VALUES (63, '大师咖啡', '馥芮白', 25.00, '0e9fee48-eca5-47a8-be09-a389611178ceflat-white.jpg', 1, '选用星巴克精萃浓缩咖啡制成，融合绵密奶泡，风味更浓郁和甘甜。');
INSERT INTO `product` VALUES (64, '大师咖啡', '榛果风味拿铁', 25.00, '7e8cdec8-ea4d-4860-b980-bcbc2383f395hazelnut-flavored-latte.jpg', 10, '榛果风味与醇厚的浓缩咖啡相得益彰，融合在蒸煮牛奶中，带给你特别温暖的醇香。');
INSERT INTO `product` VALUES (65, '大师咖啡', '香草风味拿铁', 25.00, 'eb613632-2432-4c0f-b2ba-018f37659ebdvanilla-flavored-latte.jpg', 100, '清雅香甜的香草风味糖浆让浓缩咖啡变得浪漫起来，开启拿铁的香草浪漫之旅。');
INSERT INTO `product` VALUES (66, '小鹿茶', '冰摇红莓黑加仑茶', 28.00, 'f6af8c3f-13dd-4fc5-b624-d3ec45424d0eblackcurrant-raspberry.jpg', 100, '红莓黑加仑果汁融合醇香冰红茶，两款风格各异的莓子与冰红茶摇出各自的果香，却又浑然一体，迷恋在莓与茶的酸甜中。');
INSERT INTO `product` VALUES (67, '小鹿茶', '冰摇芒果花草茶', 28.00, 'e8f13609-81db-4384-85c9-2225e0b0f6c2iced-shaken-mango-herbal-juiced-tea.jpg', 97, '香草风味糖浆与牛奶和冰块搅打出的奶香清甜，口感清爽怡人。');
INSERT INTO `product` VALUES (68, '小鹿茶', '冰摇柚柚蜂蜜红茶', 28.00, 'a78715f8-3f3d-4264-a06c-344e2efaf285iced-shaken-honey-ruby-grapefruit-black-tea.jpg', 100, '混合了韩国柚子的清香、以色列柚汁的甘甜、美国粉柚汁的果香融于醇香红茶，颗颗饱满果粒和清甜柚子皮，点缀上洋槐蜂蜜层层深入的口感，让TA对这杯沁人心脾念念不忘 。');
INSERT INTO `product` VALUES (69, '小鹿茶', '冰摇桃桃乌龙茶', 28.00, '6c3bf74c-2f6d-4b62-a526-c5497fdc1b70iced-shaken-peach-green-tea.jpg', 100, '内含原榨桃汁加上吃得到的大颗白桃果肉， 吃上一口，尝上一块，留住唇间的鲜醇甘厚。更有茶香留恋回味，给TA淘气的味蕾茶选。');
INSERT INTO `product` VALUES (70, '幸运小食', '阿馥奇朵', 28.00, 'f8114d26-124b-4d24-a129-55cf06bd3cf0affogato.jpg', 100, '双份精萃浓缩咖啡，新西兰进口香草冰淇淋');
INSERT INTO `product` VALUES (71, '瑞纳冰', '焦糖浓缩咖啡星冰乐', 25.00, 'a35a160c-269f-480f-bc8e-745079ca5609caramel-espresso-frappuccino.jpg', 100, '香醇浓缩咖啡融于浓郁的焦糖咖啡星冰乐，最后在顶部的搅打稀奶油上淋上焦糖风味酱。让你停不了口的美味。');
INSERT INTO `product` VALUES (72, '瑞纳冰', '抹茶星冰乐', 25.00, '5815fa3c-80c7-4cae-9287-d49fcceaf480green-tea-frappuccino.jpg', 100, '抹茶的清新，加一份牛奶的丝滑，与冰块和稀奶油搅拌出特有的清爽。');
INSERT INTO `product` VALUES (73, '瑞纳冰', '摩卡星冰乐', 26.00, '433be917-e702-4a5e-9891-34a3277c2448mocha-frappuccino.jpg', 0, '摩卡酱与星冰乐烘焙咖啡、在牛奶加冰块中绽放快乐，伴着雪白的稀奶油，让你每个瞬间都充满活力。');
INSERT INTO `product` VALUES (74, '瑞纳冰', '摩卡可可碎片星冰乐', 25.00, '1e7c396a-97ed-4292-826b-c2b6c3060f97mocha-java-chip-frappuccino.jpg', 100, '摩卡酱和咖啡在冰块的碰撞下魅力四射，可可碎片带来不同的口感，顶部覆以稀奶油与摩卡酱，让浓郁变得更加有趣。(可可碎片为代可可脂巧克力)');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` double(13, 2) NULL DEFAULT 0.00,
  `vip` int(2) NULL DEFAULT 0,
  `point` double(11, 2) NULL DEFAULT 0.00,
  `headimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'zhaohui.gao@luckincoffee.com', '123456', '高招辉', '15179152126', 806.64, 6, 396.00, 'espresso.jpg', '管理员');
INSERT INTO `user` VALUES (20, 'zhao.gao@luckincoffee.com', '123', '高招', '1517915', 817.35, 1, 146.65, 'ef0ca90b-89f4-4bc8-a60f-a04f2eac1974caffe-americano.jpg', '正常');
INSERT INTO `user` VALUES (66, 'gaotest@qq.com', '123456', '高', '12345678911', 0.00, 0, 0.00, 'espresso.jpg', '正常');
INSERT INTO `user` VALUES (67, 'zhaotest@qq.com', '123456', '招', '15834646372', 0.00, 0, 0.00, 'espresso.jpg', '正常');
INSERT INTO `user` VALUES (68, 'huitest@qq.com', '123456', '辉', '17548364892', 0.00, 0, 22.00, 'espresso.jpg', '禁用');
INSERT INTO `user` VALUES (69, 'qwe@qq.com', '123456', 'qwe', '18473626274', 0.00, 0, 0.00, 'espresso.jpg', '禁用');
INSERT INTO `user` VALUES (70, 'asd@qq.com', '654321', 'asd', '18463628283', 0.00, 0, 0.00, 'espresso.jpg', '正常');
INSERT INTO `user` VALUES (71, 'zxc@qq.com', '653271', 'zxc', '15783726422', 0.00, 0, 0.00, 'espresso.jpg', '正常');
INSERT INTO `user` VALUES (72, 'qweasd@qq.com', '123456', 'qweasd', '17466283865', 0.00, 0, 0.00, 'espresso.jpg', '正常');
INSERT INTO `user` VALUES (73, 'gao@qq.com', '123', '高招辉', '15179152126', 949.00, 0, 51.00, '7a877741-3093-481c-b5f1-4c2b9ffe09fbcaffe-americano.jpg', '正常');
INSERT INTO `user` VALUES (74, 'gg@qq.com', '123', 'gg', '11237182365', 0.00, 0, 0.00, 'espresso.jpg', '正常');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress`  (
  `uaid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES (7, 'zhaohui.gao@luckincoffee.com', '厦门市翔安区鼓锣三里');
INSERT INTO `useraddress` VALUES (22, 'zhaohui.gao@luckincoffee.com', '特房波特曼财富中心');
INSERT INTO `useraddress` VALUES (24, 'zhao.gao@luckincoffee.com', '特房波特曼财富中心');
INSERT INTO `useraddress` VALUES (25, 'gao@qq.com', '特防波特曼财富');
INSERT INTO `useraddress` VALUES (27, 'zhao.gao@luckincoffee.com', '厦门市翔安区鼓锣三里');

SET FOREIGN_KEY_CHECKS = 1;
