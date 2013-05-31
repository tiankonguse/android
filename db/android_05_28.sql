-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 05 月 28 日 19:43
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `android_gameplatform`
--

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'there is a rank that should be filter.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(102, '时下热门'),
(401, '休闲益智'),
(402, '角色冒险'),
(403, '动作格斗'),
(404, '策略游戏'),
(405, '体育竞速'),
(406, '飞行射击'),
(407, '卡片棋牌'),
(408, '经营养成'),
(410, '其他游戏');

-- --------------------------------------------------------

--
-- 表的结构 `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'game name',
  `img` varchar(255) NOT NULL COMMENT 'the game image',
  `apk` varchar(255) NOT NULL COMMENT 'download link',
  `star` varchar(45) NOT NULL COMMENT 'star ',
  `size` varchar(45) DEFAULT NULL COMMENT 'how byte it is.',
  `time` varchar(45) DEFAULT NULL,
  `info` mediumtext COMMENT 'introduction',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `game`
--

INSERT INTO `game` (`id`, `name`, `img`, `apk`, `star`, `size`, `time`, `info`) VALUES
(97169, '蜘蛛侠', 'http://hiphotos.baidu.com/wisegame/pic/item/b243ad4bd11373f08db326f6a50f4bfbfaed04ce.jpg', 'http://gdown.baidu.com/data/wisegame/17568aaa820519eb/SpiderMan.apk', '8', '4999173', '2012-03-16', '蜘蛛侠是游戏巨头 Gameloft 的又一款大作，Gameloft 真是越来越给力了，…'),
(102828, '刺客信条', 'http://hiphotos.baidu.com/wisegame/pic/item/d78f8c5494eef01fea2d4fafe1fe9925bc317d9b.jpg', 'http://gdown.baidu.com/data/wisegame/55c9683b207da66f/Assassin.apk', '8', '3110719', '2012-05-29', '注意：本游戏需要数据包支持。数据包下载地址：http://down.aimi8.com/a…'),
(444168, 'CS斩首行动(3D版)', 'http://hiphotos.baidu.com/wisegame/pic/item/b588d43f8794a4c2b02770810ef41bd5ad6e3910.jpg', 'http://gdown.baidu.com/data/wisegame/dfb92acbe5822485/CSzhanshouxingdong3Dban.apk', '7', '1099503', '2011-05-29', '需要先安装Java游戏管理器，可在安智市场搜索下载。CS反恐行动介绍： 全…'),
(444280, '消灭星星', 'http://hiphotos.baidu.com/wisegame/pic/item/c70f4bfbfbedab6481bf686bf736afc378311e4f.jpg', 'http://gdown.baidu.com/data/wisegame/603b4406d6b05179/xiaomiexingxing.apk', '9', '1110504', '2011-10-13', ''),
(1300626, '神庙逃亡', 'http://hiphotos.baidu.com/wisegame/pic/item/c7c27d1ed21b0ef460955b67dcc451da81cb3e8e.jpg', 'http://gdown.baidu.com/data/wisegame/f2554cc4bdfa9164/TempleRun.apk', '9', '24449845', '2012-03-27', ''),
(1414715, '暴力摩托', 'http://hiphotos.baidu.com/wisegame/pic/item/e8d4b31c8701a18be0dd6cbf9e2f07082838fe08.jpg', 'http://gdown.baidu.com/data/wisegame/6bcadb4355138f83/AdrenalineCrew.apk', '8', '34339954', '2012-10-18', 'Race Stunt Fight! Motorcycles(暴力摩托，也叫Adrenaline Crew)是一款画…'),
(1515870, '拳皇', 'http://hiphotos.baidu.com/wisegame/pic/item/18cb0a46f21fbe09823a0ce26b600c338644ade5.jpg', 'http://gdown.baidu.com/data/wisegame/f4caa249749f997b/quanhuang.apk', '8', '6930155', '2012-10-31', '拳皇[1.2.5]按“-“开始游戏,a键大拳,b键小拳,x键小脚,y键大脚,R键超重击…'),
(1919211, '忍者神龟', 'http://hiphotos.baidu.com/wisegame/pic/item/5adbb6fd5266d01669a4b0f9972bd40734fa35a5.jpg', 'http://gdown.baidu.com/data/wisegame/7e4c7cd7892e8376/renzheshengui.apk', '8', '3736326', '2012-01-16', '忍者神龟，结合冒险动作为一体的小游戏，如果你是忍者神龟迷就赶快加入到…'),
(2077970, '龙珠Z', 'http://hiphotos.baidu.com/wisegame/pic/item/0e224f4a20a446238b94c6719922720e0cf3d743.jpg', 'http://gdown.baidu.com/data/wisegame/83180caa26a75851/longzhuZ.apk', '8', '10439541', '2013-01-05', '按“-“开始游戏,A拳,B脚,X蓄气,Y换人,L必杀,R超必杀,方便游戏一年后,赛…'),
(2236366, '忍者突袭(奢华版)', 'http://hiphotos.baidu.com/wisegame/pic/item/20166d224f4a20a47901900b90529822730ed0db.jpg', 'http://gdown.baidu.com/data/wisegame/fed3d50a43575575/NinjaRushDeluxe.apk', '8', '4367639', '2012-11-15', '忍者突袭(Ninja Rush),消灭敌人,冲向丛林的尽头!来自Feelingtouch的又一…'),
(2237620, '极限摩托 精(简版)', 'http://hiphotos.baidu.com/wisegame/pic/item/e18ba61ea8d3fd1fe82d3ff6304e251f94ca5fd2.jpg', 'http://gdown.baidu.com/data/wisegame/b818c2dd0c0214d3/TrialXFree.apk', '9', '24109411', '2013-01-08', '《极限摩托 Trial Xtreme》是一款从iOS平台上移植过来的3D摩托车游戏，在…'),
(2309742, '超音速飞行', 'http://hiphotos.baidu.com/wisegame/pic/item/562ac65c103853434d02fb469213b07ecb80888c.jpg', 'http://gdown.baidu.com/data/wisegame/e9e3a5ba816c715a/TurboFly3DDemo.apk', '7', '6114652', '2012-03-02', '一款以未来世界为背景的快节奏竞速类游戏。通过比赛的胜利可以解除新的赛…'),
(2343653, '忍者跳跃奢华版', 'http://hiphotos.baidu.com/wisegame/pic/item/b209b3de9c82d15895da80dc810a19d8bc3e4207.jpg', 'http://gdown.baidu.com/data/wisegame/e7bf9d3bd65a95f6/NinJumpDeluxe.apk', '9', '33872705', '2013-02-01', '一流的忍者跳跃豪华版(NinJump Deluxe)的应用程序现在免费了!该版本包括…'),
(2463927, 'DNF:地下城与勇士', 'http://hiphotos.baidu.com/wisegame/pic/item/ccc379310a55b3196523bd5c42a98226cefc17c4.jpg', 'http://gdown.baidu.com/data/wisegame/e46b4cfe4c30194d/DNFdixiachengyuyongshi.apk', '8', '30093625', '2013-02-26', '当之无愧的第一网游,最纯正的2D横板格斗游戏,《地下城与勇士》正式推出移…'),
(2701211, '恐龙快打', 'http://hiphotos.baidu.com/wisegame/pic/item/c3ec08fa513d26975456ff5154fbb2fb4316d831.jpg', 'http://gdown.baidu.com/data/wisegame/329510a702bb7e8c/konglongkuaida.apk', '8', '10138426', '2013-03-21', '经典的格斗游戏。本游戏支持ARMV7以上的CPU。介绍不用多说了，大家都很熟…'),
(2817783, '欢乐斗地主(完整版)', 'http://hiphotos.baidu.com/wisegame/pic/item/ce4bd11373f082020e879c594afbfbedab641bba.jpg', 'http://gdown.baidu.com/data/wisegame/cf6866a5759f1d23/QQHLDDZ.apk', '9', '20400629', '2013-04-07', ''),
(2834781, '雪人兄弟', 'http://hiphotos.baidu.com/wisegame/pic/item/a98065380cd7912330ccc113ac345982b2b780ad.jpg', 'http://gdown.baidu.com/data/wisegame/71e1f0d640d659c4/xuerenxiongdi.apk', '8', '1210628', '2013-04-09', '★游戏介绍:CAPCOM出品,游戏的设定很Q，目的还是英雄救美女，每关分为10…'),
(2897648, '超级玛丽', 'http://hiphotos.baidu.com/wisegame/pic/item/fc3df8dcd100baa1e7e745d54610b912c9fc2e90.jpg', 'http://gdown.baidu.com/data/wisegame/09269b864c60b353/chaojimali.apk', '8', '723429', '2013-04-17', '这个版本是无敌的，可以让你玩通关！ 一款经典的动作冒险类游戏。《超级…'),
(2927779, '拳皇97', 'http://hiphotos.baidu.com/wisegame/pic/item/f4dda144ad345982984e31cf0df431adcaef84a3.jpg', 'http://gdown.baidu.com/data/wisegame/b949e8b6e15d0a57/quanhuang97.apk', '8', '34447599', '2013-04-22', '经典的格斗游戏.介绍不用多说了,大家都很熟悉了. 这个版本的特点：1、可…'),
(2931723, '街头霸王II', 'http://hiphotos.baidu.com/wisegame/pic/item/2234970a304e251f1cf81aaaa686c9177f3e5351.jpg', 'http://gdown.baidu.com/data/wisegame/bf21c612b4931d1d/jietoubawangII.apk', '9', '9761434', '2013-04-22', '《街头霸王2》是第一款强调人人对战格斗游戏，而且它可以选择的角色在当…'),
(2957621, '跳跃忍者', 'http://hiphotos.baidu.com/wisegame/pic/item/252309f790529822a1770485d6ca7bcb0a46d434.jpg', 'http://gdown.baidu.com/data/wisegame/e7b4757c02a80892/NinJump.apk', '8', '16132221', '2013-04-25', 'NinJump已攀升到Android的！“然而，另一个辉煌片免费搭乘乐趣”口袋玩家…'),
(2959565, '魂斗罗', 'http://hiphotos.baidu.com/wisegame/pic/item/e30a19d8bc3eb135cd0acff4a71ea8d3fc1f44b4.jpg', 'http://gdown.baidu.com/data/wisegame/20da8e95b89245d3/hundouluojinhuageming.apk', '9', '21057798', '2013-05-13', '浓缩了整整一代人的青春和热血的《魂斗罗》手机版即将上线,你是否做好准…'),
(2959579, '水果忍者', 'http://hiphotos.baidu.com/wisegame/pic/item/caec8a13632762d09ffaf0eaa1ec08fa503dc69b.jpg', 'http://dl.m.duoku.com/game/43000/43766/shuiguorenzhe_v1.8.5.apk', '8', '39472562', '2013-04-25', ''),
(2999390, '滑板少年', 'http://hiphotos.baidu.com/wisegame/pic/item/20166d224f4a20a4f34e2b9e91529822720ed013.jpg', 'http://gdown.baidu.com/data/wisegame/3e5f361e33f15e8b/SkaterBoy.apk', '9', '6653111', '2013-04-28', 'Speeding Up, Jumping，performing various tricks in the air and land…'),
(3016845, '街机拳皇97格斗', 'http://hiphotos.baidu.com/wisegame/pic/item/2c4a20a4462309f707beda4c730e0cf3d6cad69f.jpg', 'http://gdown.baidu.com/data/wisegame/07a1056921a7b010/jiejiquanhuang97gedou.apk', '9', '35822229', '2013-05-03', '拳皇97，是80后孩子最喜欢的街机格斗游戏之一，是一款SNK公司发布于1997…'),
(3017008, '宫爆老奶奶', 'http://hiphotos.baidu.com/wisegame/pic/item/6a24ab18972bd4070e1da5a37a899e510eb30991.jpg', 'http://gdown.baidu.com/data/wisegame/b260fdada5f25c11/gongbaolaonainai.apk', '8', '26285904', '2013-05-03', '介绍： 最炫宫爆风，奶奶会武功！ iOS平台推出不久便长居付费游戏榜前列…'),
(3032902, '地铁冲浪', 'http://hiphotos.baidu.com/wisegame/pic/item/7ad8bc3eb13533fadc23486fa9d3fd1f40345bde.jpg', 'http://gdown.baidu.com/data/wisegame/1bfa5469e5cc3c1e/SubwaySurf.apk', '8', '25911490', '2013-05-07', ''),
(3042456, '捕鱼达人', 'http://hiphotos.baidu.com/wisegame/pic/item/6955b319ebc4b745277db455cefc1e178b821583.jpg', 'http://dl.m.duoku.com/game/31000/31522/FishingJoy_v1.8.7_20130508.apk', '8', '29649293', '2013-05-08', ''),
(3053728, '英雄战魂', 'http://hiphotos.baidu.com/wisegame/pic/item/b258ccbf6c81800ac497d74ab03533fa828b4700.jpg', 'http://gdown.baidu.com/data/wisegame/72e62381d2b76607/yingxiongzhanhun.apk', '8', '94483047', '2013-05-09', '全新资料片《光影对决》华丽更新,震撼来袭：两大全新职业——“暗夜”刺…'),
(3063135, '神庙逃亡2', 'http://hiphotos.baidu.com/wisegame/pic/item/b42a6059252dd42a19978aee023b5bb5c8eab8dd.jpg', 'http://dl.m.duoku.com/game/49000/49554/shenmiaotaowang2_v1.1.4-0002.apk', '9', '29229933', '2013-05-10', '神庙逃亡2 官方中文版全面发布 提示：如在游戏体验过程中遇到任何问题,请拨打客服电话4000826898. 神庙逃亡2迎来最大更新,全新的游戏体验,完全的中文汉化,更棒的游戏场景,更加完善的游戏系统。 神庙逃亡续作神庙逃亡2强势首发登陆中国,领跑全球！ 神庙逃亡2是神庙逃亡的续集,带来了轰动全球的超凡反响！ 神庙逃亡拥有超过1亿7千万的下载,它重新定义了游戏这个词的含义。马上…...\r\n展开'),
(3083587, '保卫萝卜', 'http://hiphotos.baidu.com/wisegame/pic/item/e4d6277f9e2f07086b236db0e824b899a901f258.jpg', 'http://gdown.baidu.com/data/wisegame/c05b305b15da9d2b/baoweiluobu.apk', '9', '34667130', '2013-05-14', ''),
(3101714, '忍者神龟3超强版', 'http://hiphotos.baidu.com/wisegame/pic/item/354e9258d109b3de66099827cdbf6c81810a4ccf.jpg', 'http://gdown.baidu.com/data/wisegame/62e4d4be433c604c/renzheshengui3chaoqiangban.apk', '8', '1052739', '2013-05-16', '这个版本必杀不扣血,命无限,可以让你玩通关! 《忍者神龟》讲述了在纽约市…'),
(3112137, '黄金矿工II', 'http://hiphotos.baidu.com/wisegame/pic/item/2c4a20a4462309f77c01755d730e0cf3d7cad610.jpg', 'http://gdown.baidu.com/data/wisegame/8d34c3bcd5d5231e/GoldMiners.apk', '9', '9002670', '2013-05-17', '在Golden Miner2中,游戏场景由1代中的单一场景,扩增为“澳大利亚沙漠”,…'),
(3141915, '找你妹', 'http://hiphotos.baidu.com/wisegame/pic/item/841190ef76c6a7ef39c3af96fcfaaf51f2de669d.jpg', 'http://gdown.baidu.com/data/wisegame/c22e24a1f1d6299f/FindSomething.apk', '9', '62266460', '2013-05-20', ''),
(3157702, '植物大战僵尸无尽版', 'http://hiphotos.baidu.com/wisegame/pic/item/ce4bd11373f0820265dfe98e4afbfbedab641b35.jpg', 'http://gdown.baidu.com/data/wisegame/54faa61e92480f55/PlantsVsZombies.apk', '8', '10738214', '2013-05-22', ''),
(3175775, '拳皇98格斗', 'http://hiphotos.baidu.com/wisegame/pic/item/1fd98d1001e939016a38768c7aec54e736d1964e.jpg', 'http://gdown.baidu.com/data/wisegame/e3583594c4ba05f2/quanhuang98gedou.apk', '9', '46995019', '2013-05-24', 'KOF98集KOF94~KOF97之大成，过去数代中的角色济济一堂，参加格斗，名副其…'),
(3175812, '拳皇2002', 'http://hiphotos.baidu.com/wisegame/pic/item/d1b7d0a20cf431ad8aebb88b4a36acaf2edd9843.jpg', 'http://gdown.baidu.com/data/wisegame/3a39be7cc6c0cbcf/quanhuang2002.apk', '10', '65779530', '2013-05-24', '拳皇2002：由于拳皇2001的失败，新公司SNK PLAYMORE宣称：拳皇2002将回复…'),
(3175888, '三国志', 'http://hiphotos.baidu.com/wisegame/pic/item/ff82d158ccbf6c81f887d65abd3eb13532fa40d4.jpg', 'http://gdown.baidu.com/data/wisegame/5d87e4ffedca50cb/sanguozhi.apk', '9', '10792006', '2013-05-24', '儿时游戏厅经典的三国志，登陆Android客户端，桃园三结义，一起闯世界，…'),
(3197352, '滑雪小子2', 'http://hiphotos.baidu.com/wisegame/pic/item/90deb48f8c5494ee1c187faf2cf5e0fe99257e4a.jpg', 'http://gdown.baidu.com/data/wisegame/828157b890086646/iStunt2.apk', '8', '22709740', '2013-05-28', '滑雪小子2 iStunt 2 - Snowboard滑雪题材的游戏，一直都是运动类游戏中热…');

-- --------------------------------------------------------

--
-- 表的结构 `map`
--

DROP TABLE IF EXISTS `map`;
CREATE TABLE IF NOT EXISTS `map` (
  `class_id` int(11) NOT NULL COMMENT 'rank also in here',
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`,`game_id`),
  KEY `tk_android_class_idx` (`class_id`),
  KEY `tk_android_name_idx` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `map`
--

INSERT INTO `map` (`class_id`, `game_id`) VALUES
(102, 444280),
(102, 1300626),
(102, 2817783),
(102, 2959579),
(102, 3032902),
(102, 3042456),
(102, 3063135),
(102, 3083587),
(102, 3141915),
(102, 3157702),
(403, 97169),
(403, 102828),
(403, 444168),
(403, 1414715),
(403, 1515870),
(403, 1919211),
(403, 2077970),
(403, 2236366),
(403, 2237620),
(403, 2309742),
(403, 2343653),
(403, 2463927),
(403, 2701211),
(403, 2834781),
(403, 2897648),
(403, 2927779),
(403, 2931723),
(403, 2957621),
(403, 2959565),
(403, 2999390),
(403, 3016845),
(403, 3017008),
(403, 3053728),
(403, 3063135),
(403, 3101714),
(403, 3112137),
(403, 3175775),
(403, 3175812),
(403, 3175888),
(403, 3197352);

--
-- 限制导出的表
--

--
-- 限制表 `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `tk_android_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tk_android_name` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
