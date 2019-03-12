-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1:3306
-- 生成日期: 2018 年 06 月 21 日 02:45
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `contacts_general`
--

-- --------------------------------------------------------

--
-- 表的结构 `eml_address_list`
--

CREATE TABLE IF NOT EXISTS `eml_address_list` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `deparyment` varchar(40) NOT NULL,
  `position` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tel` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(40) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `eml_address_list`
--

INSERT INTO `eml_address_list` (`id`, `name`, `sex`, `deparyment`, `position`, `phone`, `tel`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, '诸葛原', '男', '技术部', '计算总监', '13552305847', '13552305847', '1128398@qq.com', '北京市朝阳区大望路135号', 1521101253, 1521101253),
(2, '王军', '男', '技术部', '网络运营', '1862546879', '010-19222324', '1862546879@qq.com', '北京市通州区梨园', 1521101253, 1521102440),
(3, '刘德', '男', '财务部', '财务经理', '13587948741', '13587948741', '13587948741@qq.com', '北京市顺义区后沙欲165号', 1521101253, 1521101253),
(4, '刘灿', '男', '编辑部', '部门经理', '1862546879', '1862546879', '1862546879@qq.com', '北京市丰台区178号', 1521101253, 1529548616);

-- --------------------------------------------------------

--
-- 表的结构 `eml_user`
--

CREATE TABLE IF NOT EXISTS `eml_user` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `deparyment` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `roleid` int(11) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `eml_user`
--

INSERT INTO `eml_user` (`id`, `username`, `password`, `name`, `sex`, `deparyment`, `position`, `phone`, `tel`, `email`, `qq`, `address`, `roleid`, `created_at`, `updated_at`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', '男', '', '', '', '', '', '', '', 1, 1371548947, 1521103791),
(2, 'wangjun', 'e10adc3949ba59abbe56e057f20f883e', '王军', '女', '', '', '', '', '', '', '', 2, 1444890849, 1529548754);
