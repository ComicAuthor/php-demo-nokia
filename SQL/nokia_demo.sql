-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-01-14 02:18:11
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `nokia`
--
DROP DATABASE IF EXISTS `nokia`;
CREATE DATABASE IF NOT EXISTS `nokia` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `nokia`;

-- --------------------------------------------------------

--
-- 表的结构 `address`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `province_id` int(10) NOT NULL COMMENT '省份id',
  `city_id` int(10) NOT NULL COMMENT '城市id',
  `county_id` int(10) NOT NULL COMMENT '区县id',
  `full_address` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '详细地址',
  `people` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '收件人',
  `people_phone` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '收件人手机',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `default_address` int(2) NOT NULL COMMENT '默认地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `address`:
--

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`id`, `province_id`, `city_id`, `county_id`, `full_address`, `people`, `people_phone`, `user_id`, `default_address`) VALUES
(7, 7, 7, 7, '丈八沟街道', '陈江波', '17602946508', 4, 0),
(13, 13, 13, 13, '12345', '陈江波', '1111111111111', 4, 0),
(14, 14, 14, 14, '退欧', '陈江波', '17602945028', 4, 1),
(15, 15, 15, 15, '23456', 'hahahaha', '12345678', 10, 0),
(16, 16, 16, 16, '123456234', 'chahah', '234567', 11, 0),
(17, 17, 17, 17, '1qwertyu', '陈123', '17602121212', 12, 0),
(18, 18, 18, 18, '1234', '1234', '123', 4, 0),
(19, 19, 19, 19, '123456732', '陈江波', '123445', 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '管理员名字',
  `password` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `admin`:
--

-- --------------------------------------------------------

--
-- 表的结构 `city`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `city_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `city`:
--

--
-- 转存表中的数据 `city`
--

INSERT INTO `city` (`id`, `city_name`) VALUES
(7, '西安市'),
(8, '西安市'),
(9, '市辖区'),
(10, '市辖区'),
(11, '市辖区'),
(12, '市辖区'),
(13, '市辖区'),
(14, '铜仁地区'),
(15, '市辖区'),
(16, '市辖区'),
(17, '兰州市'),
(18, '市辖区'),
(19, '西宁市');

-- --------------------------------------------------------

--
-- 表的结构 `county`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `county`;
CREATE TABLE IF NOT EXISTS `county` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '县区id',
  `county_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '县区名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `county`:
--

--
-- 转存表中的数据 `county`
--

INSERT INTO `county` (`id`, `county_name`) VALUES
(7, '雁塔区'),
(8, '雁塔区'),
(9, '东城区'),
(10, '东城区'),
(11, '东城区'),
(12, '东城区'),
(13, '东城区'),
(14, '铜仁市'),
(15, '东城区'),
(16, '东城区'),
(17, '西固区'),
(18, '东城区'),
(19, '城东区');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `goods_spec` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品规格',
  `goods_num` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `goods_price` float NOT NULL COMMENT '商品销售价格',
  `goods_cost_price` float NOT NULL COMMENT '商品成本价格',
  `goods_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商品类型',
  `goods_state` int(11) NOT NULL COMMENT '商品状态',
  `goods_stock` int(11) NOT NULL COMMENT '商品库存',
  `goods_present` text COLLATE utf8_bin NOT NULL COMMENT '商品描述',
  `img` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '图片',
  `goods_detail` longtext COLLATE utf8_bin NOT NULL COMMENT '产品详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `goods`:
--

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `goods_name`, `goods_spec`, `goods_num`, `goods_price`, `goods_cost_price`, `goods_type`, `goods_state`, `goods_stock`, `goods_present`, `img`, `goods_detail`) VALUES
(11, 'Nokia / 诺基亚 X7', ' 暗夜蓝, 4G+64GB', '1', 1699, 1499, '8', 1, 1000, '6.18 英寸全高清屏 / 高通骁龙 710/OIS 光学防抖', '1545902993.jpg', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/n5kZPiEkdS.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/pBR3wRRw6M.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/GDsTBsraw3.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/W3ht2HXFpZ.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/fFRyGMe78E.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/6si3Ginxr5.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/M72j644MPC.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/RpscNxjEYj.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/NpeRFCWRGa.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/heDwFy3KGa.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/x4krt4WBFH.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/EYYSDCkKj4.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/wSpk8nEGkZ.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><br/></p>'),
(14, 'Nokia / 诺基亚 X7', '沁夜黑,4G+64GB', '4', 1699, 1499, '8', 1, 1000, '6.18 英寸全高清屏 / 高通骁龙 710/OIS 光学防抖', '1545917463.jpg', '<p><img src=\"/ueditor/php/upload/image/20181227/1545917258133394.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917261252553.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917263172944.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917268582865.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917272127851.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917279601971.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917282728915.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917283265807.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917285947688.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917286235340.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917287833224.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917287466507.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917289139900.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181227/1545917290210210.jpg\"/></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><br/></p>'),
(16, 'Nokia/诺基亚 3.1 Plus', '白色,3G+32GB', '3001', 1099, 999, '8', 1, 1000, '6英寸全面屏/3500mAH大电池/双景深镜头 13+5MP', '1545962282.jpg', '<p><img src=\"https://product-res.baozun.com/prod/88000027/images/HeBWKA7wCW.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/pjm66s26JN.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/ZM65jTFs2B.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DARtQJ2DMi.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/M5i4aNEkSD.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/zcyRMYppN6.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/5K58wjDdYW.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/823R5Q567S.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/2AwsN6Fpyt.png\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/JTBCcZTGrY.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/yeTXJppciZ.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><br/></p>'),
(17, 'Nokia/诺基亚 3.1 Plus', '藏蓝色,3G+32GB', '3002', 1099, 999, '8', 1, 1000, '6英寸全面屏/3500mAH大电池/双景深镜头 13+5MP', '1545962338.jpg', '<p><img src=\"https://product-res.baozun.com/prod/88000027/images/HeBWKA7wCW.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/pjm66s26JN.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/ZM65jTFs2B.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DARtQJ2DMi.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/M5i4aNEkSD.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/zcyRMYppN6.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/5K58wjDdYW.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/823R5Q567S.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/2AwsN6Fpyt.png\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/JTBCcZTGrY.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/yeTXJppciZ.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><br/></p>'),
(18, 'Nokia/诺基亚 X6', '星空黑,4G+64GB', 'x001', 1299, 1999, '8', 1, 1000, '5.8英寸全面屏/后置双摄1600万+500万/高通骁龙636', '1545962611.jpg', '<p><img src=\"https://product-res.baozun.com/prod/88000027/images/9872075f0e794358a87c2f8a0d19c242.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/670ae857231442829a00feb6f051317a.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/a731ffd5a3344295b9f59bc7f2940bca.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/b092481c99d04d0cb7019837bd09c5b3.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/9bfa6a716f2242d0addf3f7d73455318.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/5d16dcb39d954806ae905343efa46e8f.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/a3cde1460dc14d50ab5c7da464f6c906.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/c1de1947206c47b28f1668295b85aafe.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/4e9461f6627a4ad4a40a883ee1333030.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/a7870d23ccdc4723b4dfb2f7606e1ba9.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/1a27d962ed4a4edb81e5354b0939a1c0.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/3244def19ebe4d02af2a402526672e11.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/6ZXQE88xhy.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/977772bec5374b0999034c290f10b124.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><br/></p>'),
(19, 'Nokia/诺基亚 X5', '波罗的海蓝,3G+32GB', 'x5001', 999, 899, '8', 1, 1000, 'Helio P60高性能CPU/后置双摄1300万+500万/5.86英寸19:9HD+屏幕', '1545966554.jpg', '<p><img src=\"https://product-res.baozun.com/prod/88000027/images/0f30038e6c9c44ae9bb858ceb9b1be8b.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/2577a82536034bf4abb6c16ab54bf77b.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/c06daff0cf9640279852b395578ed1d4.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/81cce7c2b93b4028a5e10542bf45f1f9.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/759903eb7df64d5386d96e7121e79214.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/040626d8678d419593b51222c3ca4f61.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/afd8753b3a6d4792a5ca599bdd78a9f4.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/834b0c68221b425cb71e124929aa782e.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/2ab535b29ad340dfaf053f726332a200.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/jw48KwazmT.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/0323627ab38c48799a53e431f474cbef.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><br/></p>'),
(20, 'Nokia/诺基亚 8 Sirocco', '黑色,6G+128GB', 'Sirocco001', 4699, 4500, '8', 1, 1000, '2k双曲面屏5.5英寸OLED超清屏幕/高通骁龙835/后置双蔡司认证镜头/IP67防尘防水', '1545966725.jpg', '<p><img src=\"/ueditor/php/upload/image/20181228/1545966744642077.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966745115045.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966746551021.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966746314433.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966747116224.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966748130433.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966750316584.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966751198419.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966752790106.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966752830298.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20181228/1545966753423647.jpg\"/></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><span class=\"description-parameters__title\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(57, 73, 102); font-size: 20px; width: 280px;\"></span></p><p class=\"description-parameters__values\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 16px; -webkit-box-flex: 1; flex: 1 1 0%;\"><span class=\"description-parameters__value\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; margin-right: 20px;\"></span></p><p><br/></p>'),
(21, 'Nokia/诺基亚 7 Plus', '黑色,4G+64GB', '7p001', 1899, 1500, '8', 1, 1000, '6英寸全面屏/超长待机3800mAh/后置双摄1200万+1300万蔡司认证镜头/高通骁龙660', '1545966955.jpg', '<p><img src=\"https://product-res.baozun.com/prod/88000027/images/b488270d2f314ef6aab1473aa7b65c4f.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/4bcbcca769ee4a66abb1aee0b5ce1059.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/2ceaf7327bfd446eb031fe7bf4d62dc2.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/0aa157ab9fb2447882b08f65c933ca94.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/027755621f1f41f8aa7f6b5d9e3f031f.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/fwPiGdNBnQ.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/aea9cf21fb0149fa8b746e809004e279.jpg\"/></p><p><img src=\"https://product-res.baozun.com/prod/88000027/images/DhEWS7REmj.jpg\"/></p><p><br/></p>'),
(22, '测试手机', '星空黑,6G+64GB', '12345', 12345, 12312, '8', 1, 23, '1234567', '1546409274.jpg', '<p>qwertyuqwerty23456723456ty7uwdegthyjscdvfg<br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `goods_type`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE IF NOT EXISTS `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `type_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '类名',
  `type_fid` int(11) NOT NULL COMMENT '商品父类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `goods_type`:
--

--
-- 转存表中的数据 `goods_type`
--

INSERT INTO `goods_type` (`id`, `type_name`, `type_fid`) VALUES
(1, '手机', 0),
(8, '智能手机', 1),
(10, '经典手机', 1),
(11, '123', 10);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_state` int(11) NOT NULL COMMENT '订单状态',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_num` int(11) NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `orders`:
--

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `order_state`, `user_id`, `order_num`) VALUES
(43, 0, 4, 1546952847),
(44, 0, 4, 1546994312),
(45, 0, 4, 1546994322),
(46, 0, 4, 1547428174),
(47, 0, 4, 1547428443);

-- --------------------------------------------------------

--
-- 表的结构 `orders_detail`
--
-- 创建时间： 2019-01-02 00:44:33
--

DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_spec` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品规格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `address_id` int(11) NOT NULL COMMENT '地址id',
  `orders_id` int(11) NOT NULL COMMENT '订单id',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `img` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '图片',
  `goods_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `orders_detail`:
--

--
-- 转存表中的数据 `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `goods_id`, `goods_spec`, `goods_num`, `address_id`, `orders_id`, `goods_price`, `img`, `goods_name`) VALUES
(87, 19, '波罗的海蓝, 3G+32GB', 4, 14, 43, 999, '1545966554.jpg', 'Nokia / 诺基亚 X5'),
(88, 16, '白色, 3G+32GB', 3, 7, 44, 1099, '1545962282.jpg', 'Nokia / 诺基亚 3.1 Plus'),
(89, 20, '黑色, 6G+128GB', 2, 14, 45, 4699, '1545966725.jpg', 'Nokia / 诺基亚 8 Sirocco'),
(90, 21, '黑色,4G+64GB', 4, 19, 46, 1899, '1545966955.jpg', 'Nokia/诺基亚 7 Plus'),
(91, 11, '暗夜蓝, 4G+64GB', 4, 7, 47, 1699, '1545902993.jpg', 'Nokia / 诺基亚 X7');

-- --------------------------------------------------------

--
-- 表的结构 `province`
--
-- 创建时间： 2019-01-02 00:44:34
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '省份id',
  `province_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '省份名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `province`:
--

--
-- 转存表中的数据 `province`
--

INSERT INTO `province` (`id`, `province_name`) VALUES
(7, '陕西'),
(8, '陕西'),
(9, '北京'),
(10, '北京'),
(11, '北京'),
(12, '北京'),
(13, '北京'),
(14, '贵州'),
(15, '北京'),
(16, '北京'),
(17, '甘肃'),
(18, '北京'),
(19, '青海');

-- --------------------------------------------------------

--
-- 表的结构 `shopping_car`
--
-- 创建时间： 2019-01-02 00:44:34
--

DROP TABLE IF EXISTS `shopping_car`;
CREATE TABLE IF NOT EXISTS `shopping_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_spec` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品规格',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_price` float NOT NULL COMMENT '商品价格',
  `goods_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `img` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '商品图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `shopping_car`:
--

--
-- 转存表中的数据 `shopping_car`
--

INSERT INTO `shopping_car` (`id`, `user_id`, `goods_spec`, `goods_id`, `goods_num`, `goods_price`, `goods_name`, `img`) VALUES
(36, 11, '黑色,6G+128GB', 20, 1, 4699, 'Nokia/诺基亚 8 Sirocco', '1545966725.jpg'),
(37, 12, '沁夜黑,4G+64GB', 14, 2, 1699, 'Nokia / 诺基亚 X7', '1545917463.jpg'),
(40, 4, '黑色,4G+64GB', 21, 3, 1899, 'Nokia/诺基亚 7 Plus', '1545966955.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--
-- 创建时间： 2019-01-02 00:44:34
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `password` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `user_state` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `user`:
--

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `phone`, `password`, `user_state`) VALUES
(4, '13111111111', 'cd60127f03ca83b35a7df445bfe6648e', '1'),
(10, '15111111111', 'cd60127f03ca83b35a7df445bfe6648e', '1'),
(11, '13511111111', 'cd60127f03ca83b35a7df445bfe6648e', '1'),
(12, '13911111111', 'cd60127f03ca83b35a7df445bfe6648e', '1');

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--
-- 创建时间： 2019-01-02 00:44:34
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `infoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '详情id',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `sex` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `email` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  PRIMARY KEY (`infoid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 表的关系 `user_info`:
--

--
-- 转存表中的数据 `user_info`
--

INSERT INTO `user_info` (`infoid`, `user_id`, `sex`, `email`, `name`) VALUES
(4, '4', '男', '1234654@qq.com', '嗯嗯'),
(5, '10', '男', '92435678765@qq.com', '陈江波'),
(6, '11', '男', '1234578987654@qq.com', 'zwzw'),
(7, '12', '男', '123443300@qq.com', '哈哈');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
