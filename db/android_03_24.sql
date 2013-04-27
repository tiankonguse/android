-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 03 月 24 日 14:27
-- 服务器版本: 5.1.68
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tiankong_tksite`
--

-- --------------------------------------------------------

--
-- 表的结构 `tk_android_class`
--

CREATE TABLE IF NOT EXISTS `tk_android_class` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tk_android_class`
--

INSERT INTO `tk_android_class` (`id`, `name`, `link`) VALUES
(102, '全部游戏', 'http://as.baidu.com/a/asgame?cid=102'),
(401, '休闲益智', 'http://as.baidu.com/a/asgame?cid=401'),
(402, '角色冒险', 'http://as.baidu.com/a/asgame?cid=402'),
(403, '动作格斗', 'http://as.baidu.com/a/asgame?cid=403'),
(404, '策略游戏', 'http://as.baidu.com/a/asgame?cid=404'),
(405, '体育竞速', 'http://as.baidu.com/a/asgame?cid=405'),
(406, '飞行射击', 'http://as.baidu.com/a/asgame?cid=406'),
(407, '卡片棋牌', 'http://as.baidu.com/a/asgame?cid=407'),
(408, '经营养成', 'http://as.baidu.com/a/asgame?cid=408'),
(410, '其他游戏', 'http://as.baidu.com/a/asgame?cid=400&amp;s=1');

-- --------------------------------------------------------

--
-- 表的结构 `tk_android_class_name`
--

CREATE TABLE IF NOT EXISTS `tk_android_class_name` (
  `tk_android_class` int(11) NOT NULL,
  `tk_android_name` int(11) NOT NULL,
  PRIMARY KEY (`tk_android_class`,`tk_android_name`),
  KEY `tk_android_class_idx` (`tk_android_class`),
  KEY `tk_android_name_idx` (`tk_android_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tk_android_class_name`
--

INSERT INTO `tk_android_class_name` (`tk_android_class`, `tk_android_name`) VALUES
(102, 439235),
(102, 447594),
(102, 838592),
(102, 864557),
(102, 1054357),
(102, 1911229),
(102, 2027093),
(102, 2118772),
(102, 2207984),
(102, 2326409),
(102, 2336351),
(102, 2345748),
(102, 2516519),
(102, 2559640),
(102, 2571662),
(102, 2593096),
(102, 2605567),
(102, 2611822),
(102, 2620862),
(102, 2632235),
(102, 2635955),
(102, 2655989),
(102, 2656228),
(102, 2691716),
(102, 2693285),
(102, 2708747);

-- --------------------------------------------------------

--
-- 表的结构 `tk_android_name`
--

CREATE TABLE IF NOT EXISTS `tk_android_name` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `link` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `apk` varchar(255) NOT NULL,
  `star` varchar(45) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `introduction` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tk_android_name`
--

INSERT INTO `tk_android_name` (`id`, `name`, `link`, `img`, `apk`, `star`, `size`, `time`, `introduction`) VALUES
(439235, '小小蜘蛛', 'http://as.baidu.com/a/item?docid=439235&pre=web_am_asgame&pos=asgame_1003_6&f=asgame_1003_6', 'http://hiphotos.baidu.com/wisegame/pic/item/d5fd5266d0160924badefcb6d40735fae7cd34a7.jpg', 'http://www.ggg.cn/download/w/26328?marketChannel=baidu001', ' ', ' ', ' ', ' '),
(447594, '三国塔防-蜀传', 'http://as.baidu.com/a/item?docid=447594&pre=web_am_asgame&pos=asgame_1003_8&f=asgame_1003_8', 'http://hiphotos.baidu.com/wisegame/pic/item/b588d43f8794a4c2c5d665850ef41bd5ac6e39a3.jpg', 'http://www.ggg.cn/download/w/23470?marketChannel=baidu001', ' ', ' ', ' ', ' '),
(838592, '武林-神雕侠侣', 'http://as.baidu.com/a/item?docid=838592&pre=web_am_asgame&pos=asgame_1003_7&f=asgame_1003_7', 'http://hiphotos.baidu.com/wisegame/pic/item/55d3d539b6003af37159474c342ac65c1038b63f.jpg', 'http://www.anzhi.com/dl_app.php?s=352148&channel=baidu', ' ', ' ', ' ', ' '),
(864557, '武林OL', 'http://as.baidu.com/a/item?docid=864557&pre=web_am_asgame&pos=asgame_1003_11&f=asgame_1003_11', 'http://hiphotos.baidu.com/wisegame/pic/item/b588d43f8794a4c2937853b00ef41bd5ac6e39d6.jpg', 'http://gdown.baidu.com/data/wisegame/411f2b62c01c2572/WuLinOL.apk', ' ', ' ', ' ', ' '),
(1054357, '燃烧的蔬菜', 'http://as.baidu.com/a/item?docid=1054357&pre=web_am_asgame&pos=asgame_1003_4&f=asgame_1003_4', 'http://hiphotos.baidu.com/wisegame/pic/item/4d738bd4b31c8701f47ddcf4267f9e2f0608ffdd.jpg', 'http://apk.hiapk.com/down?aid=832958&em=13', ' ', ' ', ' ', ' '),
(1911229, '消灭星星(中文…', 'http://as.baidu.com/a/item?docid=1911229&pre=web_am_asgame&pos=asgame_1003_1&f=asgame_1003_1', 'http://hiphotos.baidu.com/wisegame/pic/item/6bfa513d269759ee7940d9d9b3fb43166d22df94.jpg', 'http://www.anzhi.com/dl_app.php?s=711943&channel=baidu', ' ', ' ', ' ', ' '),
(2027093, '武士Ⅱ：复仇', 'http://as.baidu.com/a/item?docid=2027093&pre=web_am_asgame&pos=asgame_1003_8&f=asgame_1003_8', 'http://hiphotos.baidu.com/wisegame/pic/item/ae11728b4710b912ac0ec124c3fdfc0393452218.jpg', 'http://gdown.baidu.com/data/wisegame/e6b8fd8908727ea8/wushiIIfuchou.apk', ' ', ' ', ' ', ' '),
(2118772, 'QQ御剑', 'http://as.baidu.com/a/item?docid=2118772&pre=web_am_asgame&pos=asgame_1003_12&f=asgame_1003_12', 'http://hiphotos.baidu.com/wisegame/pic/item/d9a1cd11728b4710b7369f0ac3cec3fdfd0323de.jpg', 'http://market.nduoa.com/apk/download/486129?from=baidu', ' ', ' ', ' ', ' '),
(2207984, '仙侠传说Onlin…', 'http://as.baidu.com/a/item?docid=2207984&pre=web_am_asgame&pos=asgame_1003_13&f=asgame_1003_13', 'http://hiphotos.baidu.com/wisegame/pic/item/b3a20cf431adcbef8ce95cccacaf2edda2cc9f1f.jpg', 'http://gdown.baidu.com/data/wisegame/63db75bc58bc5b24/xianxiachuanshuoOnline.apk', ' ', ' ', ' ', ' '),
(2326409, '忘仙', 'http://as.baidu.com/a/item?docid=2326409&pre=web_am_asgame&pos=asgame_1003_10&f=asgame_1003_10', 'http://hiphotos.baidu.com/wisegame/pic/item/28fbfbedab64034f2998b60baec379310a551d61.jpg', 'http://gdown.baidu.com/data/wisegame/c8df6e9b02c6d595/wangxian.apk', ' ', ' ', ' ', ' '),
(2336351, '斗神诀OL', 'http://as.baidu.com/a/item?docid=2336351&pre=web_am_asgame&pos=asgame_1003_11&f=asgame_1003_11', 'http://hiphotos.baidu.com/wisegame/pic/item/e126cffc1e178a828f782397f703738da977e845.jpg', 'http://gdown.baidu.com/data/wisegame/3ecee02dcbcf4829/doushenjueOL.apk', ' ', ' ', ' ', ' '),
(2345748, '永生门', 'http://as.baidu.com/a/item?docid=2345748&pre=web_am_asgame&pos=asgame_1003_10&f=asgame_1003_10', 'http://hiphotos.baidu.com/wisegame/pic/item/b258ccbf6c81800a00079336b03533fa828b4723.jpg', 'http://gdown.baidu.com/data/wisegame/16da2024d6e222f0/yongshengmen.apk', ' ', ' ', ' ', ' '),
(2516519, '风云天下', 'http://as.baidu.com/a/item?docid=2516519&pre=web_am_asgame&pos=asgame_1003_7&f=asgame_1003_7', 'http://hiphotos.baidu.com/wisegame/pic/item/ccc379310a55b319eb012f5f42a98226cffc171b.jpg', 'http://gdown.baidu.com/data/wisegame/005e6002b6b13c6a/fengyuntianxiaOL.apk', ' ', ' ', ' ', ' '),
(2559640, '英雄联盟控', 'http://as.baidu.com/a/item?docid=2559640&pre=web_am_asgame&pos=asgame_1003_0&f=asgame_1003_0', 'http://hiphotos.baidu.com/wisegame/pic/item/56fae6cd7b899e5114d6683943a7d933c8950d46.jpg', 'http://www.appchina.com/market/d/645408/cop.baidu_0/com.mandi.lol.apk', ' ', ' ', ' ', ' '),
(2571662, '麻將天下', 'http://as.baidu.com/a/item?docid=2571662&pre=web_am_asgame&pos=asgame_1003_2&f=asgame_1003_2', 'http://hiphotos.baidu.com/wisegame/pic/item/bec451da81cb39db5ed8dd7bd1160924ab183087.jpg', 'http://down.android.d.cn/6/22/6897_104870?http://c.downandroid.com/android/new/game1/54/111854/mjtx_1362379268719.apk?f=baidu_1', ' ', ' ', ' ', ' '),
(2593096, '英雄杀', 'http://as.baidu.com/a/item?docid=2593096&pre=web_am_asgame&pos=asgame_1003_6&f=asgame_1003_6', 'http://hiphotos.baidu.com/wisegame/pic/item/c4efce1b9d16fdfab97be5c1b58f8c5494ee7b8d.jpg', 'http://www.coolapk.com/dl?v=QVBLNmVkNTBkOWltaQ&h=4fe5c98e1f6f3a4867a6f3ea4eae7113&from=baidu', ' ', ' ', ' ', ' '),
(2605567, '真实赛车3', 'http://as.baidu.com/a/item?docid=2605567&pre=web_am_asgame&pos=asgame_1003_5&f=asgame_1003_5', 'http://hiphotos.baidu.com/wisegame/pic/item/f8504fc2d56285355119973391ef76c6a7ef6323.jpg', 'http://android.155.cn/baidu.download.php?net=0&resource_id=173874', ' ', ' ', ' ', ' '),
(2611822, '君王2', 'http://as.baidu.com/a/item?docid=2611822&pre=web_am_asgame&pos=asgame_1003_9&f=asgame_1003_9', 'http://hiphotos.baidu.com/wisegame/pic/item/39afa40f4bfbfbed7c41ba6d79f0f736afc31f8c.jpg', 'http://gdown.baidu.com/data/wisegame/4cd56841f8a95b0d/junwang2.apk', ' ', ' ', ' ', ' '),
(2620862, '一站到底', 'http://as.baidu.com/a/item?docid=2620862&pre=web_am_asgame&pos=asgame_1003_1&f=asgame_1003_1', 'http://hiphotos.baidu.com/wisegame/pic/item/4d738bd4b31c8701906af8f4267f9e2f0608ffc0.jpg', 'http://apk.hiapk.com/down?aid=1260159&em=13', ' ', ' ', ' ', ' '),
(2632235, '终极狂飙3D漂移', 'http://as.baidu.com/a/item?docid=2632235&pre=web_am_asgame&pos=asgame_1003_3&f=asgame_1003_3', 'http://hiphotos.baidu.com/wisegame/pic/item/6946f21fbe096b6381b807430d338744ebf8ac04.jpg', 'http://gdown.baidu.com/data/wisegame/66fb20fac05899ee/zhongjikuangbiao3Dpiaoyi.apk', ' ', ' ', ' ', ' '),
(2635955, '无畏摩托', 'http://as.baidu.com/a/item?docid=2635955&pre=web_am_asgame&pos=asgame_1003_0&f=asgame_1003_0', 'http://hiphotos.baidu.com/wisegame/pic/item/85cd7b899e510fb30b893d84d833c895d1430c14.jpg', 'http://gdown.baidu.com/data/wisegame/30938ac4a2a9eaec/RecklessMoto.apk', ' ', ' ', ' ', ' '),
(2655989, '高速骑士 High…', 'http://as.baidu.com/a/item?docid=2655989&pre=web_am_asgame&pos=asgame_1003_4&f=asgame_1003_4', 'http://hiphotos.baidu.com/wisegame/pic/item/603b5bb5c9ea15ce57144100b7003af33b87b2c5.jpg', 'http://down.mumayi.com/110343/mbaidu', ' ', ' ', ' ', ' '),
(2656228, '七彩祖玛2', 'http://as.baidu.com/a/item?docid=2656228&pre=web_am_asgame&pos=asgame_1003_5&f=asgame_1003_5', 'http://hiphotos.baidu.com/wisegame/pic/item/b3a20cf431adcbef9293670eadaf2edda3cc9f17.jpg', 'http://gdown.baidu.com/data/wisegame/7149d4acb74af085/MarbleBlast2.apk', ' ', ' ', ' ', ' '),
(2691716, '愤怒的小鸟 An…', 'http://as.baidu.com/a/item?docid=2691716&pre=web_am_asgame&pos=asgame_1003_2&f=asgame_1003_2', 'http://hiphotos.baidu.com/wisegame/pic/item/c4efce1b9d16fdfa8930f5e3b58f8c5494ee7b5a.jpg', 'http://down.mumayi.com/248074/mbaidu', ' ', ' ', ' ', ' '),
(2693285, '醉江湖OL', 'http://as.baidu.com/a/item?docid=2693285&pre=web_am_asgame&pos=asgame_1003_12&f=asgame_1003_12', 'http://hiphotos.baidu.com/wisegame/pic/item/e1025aafa40f4bfba67e9958024f78f0f736180b.jpg', 'http://gdown.baidu.com/data/wisegame/c27132b46012cb0f/zuijianghuOL.apk', ' ', ' ', ' ', ' '),
(2708747, '真实赛车3', 'http://as.baidu.com/a/item?docid=2708747&pre=web_am_asgame&pos=asgame_1003_3&f=asgame_1003_3', 'http://hiphotos.baidu.com/wisegame/pic/item/38b5c9ea15ce36d34677d53d3bf33a87e950b148.jpg', 'http://gdown.baidu.com/data/wisegame/045f681dfed56073/RealRacing3.apk', ' ', ' ', ' ', ' ');

--
-- 限制导出的表
--

--
-- 限制表 `tk_android_class_name`
--
ALTER TABLE `tk_android_class_name`
  ADD CONSTRAINT `tk_android_class` FOREIGN KEY (`tk_android_class`) REFERENCES `tk_android_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tk_android_name` FOREIGN KEY (`tk_android_name`) REFERENCES `tk_android_name` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
