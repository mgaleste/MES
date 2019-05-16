-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 14, 2019 at 11:35 PM
-- Server version: 5.1.63
-- PHP Version: 5.3.5-1ubuntu7.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MES`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogs`
--

CREATE TABLE IF NOT EXISTS `adminlogs` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `module` varchar(45) DEFAULT NULL,
  `task` varchar(45) DEFAULT NULL,
  `timestamps` datetime DEFAULT NULL,
  `activitydone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `adminlogs`
--

INSERT INTO `adminlogs` (`id`, `username`, `ip_address`, `browser`, `module`, `task`, `timestamps`, `activitydone`) VALUES
(1, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-04-19 15:25:38', 'Login'),
(2, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-04-19 22:40:42', 'Login'),
(3, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-04-21 16:34:20', 'Login'),
(4, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'create', '2019-04-21 17:43:33', 'Update Process : test'),
(5, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'create', '2019-04-21 17:48:57', 'Update Process : test'),
(6, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'edit', '2019-04-21 17:53:39', 'Update Process : Cutting'),
(7, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'edit', '2019-04-21 17:57:20', 'Update Process : Cutting'),
(8, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'edit', '2019-04-21 18:02:56', 'Update Process : Manual Polish'),
(9, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'delete', '2019-04-21 18:03:54', 'delete Process '),
(10, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'machine', 'create', '2019-04-21 19:03:22', 'create Machine : Cutter'),
(11, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'machine', 'edit', '2019-04-21 19:08:18', 'edit Machine : Cutter Machine01'),
(12, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'machine', 'delete', '2019-04-21 19:10:54', 'delete machine '),
(13, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-04-21 19:44:10', 'Login'),
(14, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'location', 'create', '2019-04-21 20:07:01', 'create Location : Warehouse'),
(15, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'location', 'create', '2019-04-21 20:08:28', 'create Location : Receiving'),
(16, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'location', 'create', '2019-04-21 20:08:53', 'create Location : Inspection Area'),
(17, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-04-21 20:57:43', 'create Item : Marble Tile'),
(18, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'edit', '2019-04-21 21:01:31', 'edit Item : Marble Tile'),
(19, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'delete', '2019-04-21 21:01:37', 'delete Item Marble Tile | MRBL-TILE'),
(20, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-04-28 18:05:19', 'Login'),
(21, '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 15:39:10', 'Logout'),
(22, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 15:46:54', 'Login'),
(23, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 15:49:27', 'Logout'),
(24, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 15:49:38', 'Login'),
(25, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 16:24:27', 'Logout'),
(26, '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 18:19:06', 'Logout'),
(27, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 18:19:17', 'Login'),
(28, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'create', '2019-05-04 18:20:26', 'create Process : Machine Polish'),
(29, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 19:12:06', 'Login'),
(30, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 19:15:34', 'Logout'),
(31, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 19:15:44', 'Login'),
(32, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 20:09:14', 'Login'),
(33, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-04 21:58:58', 'Logout'),
(34, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 22:00:39', 'Login'),
(35, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-04 23:12:52', 'Login'),
(36, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-05 00:19:06', 'Login'),
(37, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'create', '2019-05-05 00:24:04', 'Create route : CUT-POLISH'),
(38, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-05 10:05:22', 'Login'),
(39, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'edit', '2019-05-05 10:49:11', 'Create route : CUT-POLISH'),
(40, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'edit', '2019-05-05 11:07:57', 'Create route : CUT-POLISH'),
(41, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'edit', '2019-05-05 11:14:32', 'Create route : CUT-POLISH'),
(42, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'edit', '2019-05-05 11:15:50', 'Create route : CUT-POLISH'),
(43, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-05 13:59:11', 'Login'),
(44, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-05 14:00:39', 'create Item : Mable Slab'),
(45, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'edit', '2019-05-05 14:00:48', 'edit Item : Marble Slab'),
(46, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-05 14:01:51', 'create Item : Marble Cyclinder'),
(47, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-05 14:03:25', 'create Item : Table Top'),
(48, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-05 14:03:42', 'create Item : Table Stand'),
(49, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-05 14:04:07', 'create Item : Marble Table'),
(50, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'edit', '2019-05-05 14:04:20', 'edit Item : Marble Tile'),
(51, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:32:18', 'Create billofmaterials : billofmaterials'),
(52, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:32:34', 'Create billofmaterials : billofmaterials'),
(53, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:33:33', 'Create billofmaterials : billofmaterials'),
(54, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:41:06', 'Create billofmaterials : billofmaterials'),
(55, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:42:18', 'Create billofmaterials : billofmaterials'),
(56, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:43:20', 'Create billofmaterials : billofmaterials'),
(57, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:45:09', 'Create billofmaterials : billofmaterials'),
(58, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:46:31', 'Create billofmaterials : billofmaterials'),
(59, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:47:30', 'Create billofmaterials : billofmaterials'),
(60, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:47:59', 'Create billofmaterials : billofmaterials'),
(61, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:49:11', 'Create billofmaterials : billofmaterials'),
(62, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:50:04', 'Create billofmaterials : billofmaterials'),
(63, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:52:01', 'Create billofmaterials : billofmaterials'),
(64, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:52:12', 'Create billofmaterials : billofmaterials'),
(65, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:52:24', 'Create billofmaterials : billofmaterials'),
(66, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:54:09', 'Create billofmaterials : billofmaterials'),
(67, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'create', '2019-05-05 15:56:09', 'Create billofmaterials : billofmaterials'),
(68, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'edit', '2019-05-05 16:06:32', 'Create billofmaterials : billofmaterials'),
(69, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-06 23:03:56', 'Login'),
(70, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'create', '2019-05-06 23:28:03', 'create Item : inventory'),
(71, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'edit', '2019-05-06 23:42:50', 'edit Item : inventory'),
(72, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'create', '2019-05-06 23:44:36', 'create Item : inventory'),
(73, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'create', '2019-05-06 23:48:29', 'create Item : inventory'),
(74, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'create', '2019-05-06 23:49:41', 'create Item : inventory'),
(75, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-07 00:43:12', 'Login'),
(76, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-07 01:26:08', 'create Item : lot'),
(77, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-07 01:27:37', 'create Item : lot'),
(78, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-07 01:28:41', 'create Item : lot'),
(79, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-07 01:30:45', 'create Item : lot'),
(80, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'edit', '2019-05-07 01:52:21', 'edit Process : Cutting'),
(81, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'view', '2019-05-08 00:25:21', 'view Item : lot'),
(82, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'view', '2019-05-08 00:28:05', 'view Item : lot'),
(83, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'view', '2019-05-08 00:28:50', 'view Item : lot'),
(84, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:31:50', 'edit Item : lot'),
(85, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:33:23', 'edit Item : lot'),
(86, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:44:26', 'edit Item : lot'),
(87, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:44:29', 'edit Item : lot'),
(88, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:46:08', 'edit Item : lot'),
(89, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:46:36', 'edit Item : lot'),
(90, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:48:22', 'edit Item : lot'),
(91, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 00:48:45', 'edit Item : lot'),
(92, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:00:01', 'edit Item : lot'),
(93, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:00:46', 'edit Item : lot'),
(94, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:01:40', 'edit Item : lot'),
(95, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:02:08', 'edit Item : lot'),
(96, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:02:28', 'edit Item : lot'),
(97, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:02:33', 'edit Item : lot'),
(98, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:03:08', 'edit Item : lot'),
(99, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:04:15', 'edit Item : lot'),
(100, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:05:33', 'edit Item : lot'),
(101, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:06:47', 'edit Item : lot'),
(102, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 01:07:15', 'edit Item : lot'),
(103, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-08 23:14:39', 'Login'),
(104, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-08 23:20:09', 'create Item : lot'),
(105, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 23:22:48', 'edit Item : lot'),
(106, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 23:24:53', 'edit Item : lot'),
(107, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 23:25:12', 'edit Item : lot'),
(108, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-08 23:25:17', 'edit Item : lot'),
(109, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-09 00:53:07', 'create Item : lot'),
(110, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 00:54:09', 'edit Item : lot'),
(111, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 00:59:27', 'edit Item : lot'),
(112, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:03:10', 'edit Item : lot'),
(113, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:05:03', 'edit Item : lot'),
(114, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:06:26', 'edit Item : lot'),
(115, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:06:29', 'edit Item : lot'),
(116, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-09 01:20:39', 'create Item : lot'),
(117, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:20:42', 'edit Item : lot'),
(118, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:20:47', 'edit Item : lot'),
(119, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:21:10', 'edit Item : lot'),
(120, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'create', '2019-05-09 01:26:08', 'create Process : Inspection'),
(121, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'create', '2019-05-09 01:27:24', 'Create route : Cutting-Inspection-Polish'),
(122, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-09 01:36:36', 'create Item : lot'),
(123, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:36:40', 'edit Item : lot'),
(124, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-09 01:36:46', 'edit Item : lot'),
(125, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-12 13:15:57', 'Login'),
(126, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-12 20:51:25', 'Login'),
(127, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-13 15:02:33', 'Login'),
(128, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:18:51', 'edit Item : lot'),
(129, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:18:58', 'edit Item : lot'),
(130, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-13 16:58:02', 'create Item : lot'),
(131, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:58:10', 'edit Item : lot'),
(132, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:59:02', 'edit Item : lot'),
(133, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:59:08', 'edit Item : lot'),
(134, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-13 16:59:22', 'create Item : lot'),
(135, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:59:25', 'edit Item : lot'),
(136, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 16:59:30', 'edit Item : lot'),
(137, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 17:00:04', 'edit Item : lot'),
(138, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'edit', '2019-05-13 17:00:10', 'edit Item : lot'),
(139, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-13 17:19:13', 'Logout'),
(140, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'login', '2019-05-14 21:34:33', 'Login'),
(141, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'create', '2019-05-14 21:35:24', 'create Item : CFG'),
(142, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'item', 'delete', '2019-05-14 21:35:29', 'delete Item CFG | CFG'),
(143, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'create', '2019-05-14 21:36:03', 'create Process : CFG'),
(144, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'process', 'delete', '2019-05-14 21:36:08', 'delete Process CFG | CFG'),
(145, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'machine', 'create', '2019-05-14 21:36:22', 'create Machine : CFG'),
(146, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'machine', 'delete', '2019-05-14 21:36:27', 'delete Machine '),
(147, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'route', 'delete', '2019-05-14 21:36:36', 'delete route CUT-POLISH | CUTPOL'),
(148, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'billofmaterials', 'delete', '2019-05-14 21:45:47', 'delete billofmaterials '),
(149, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'inventory', 'create', '2019-05-14 22:28:59', 'create Item : inventory'),
(150, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'create', '2019-05-14 22:51:44', 'create Operator'),
(151, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:54:41', 'delete users'),
(152, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:54:41', 'delete users'),
(153, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:54:41', 'delete users'),
(154, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'lot', 'create', '2019-05-14 22:58:24', 'create Item : lot'),
(155, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:59:56', 'delete users'),
(156, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:59:56', 'delete users'),
(157, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 22:59:56', 'delete users'),
(158, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:01:16', ' users'),
(159, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:01:16', ' users'),
(160, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:02:32', ' users'),
(161, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:02:32', ' users'),
(162, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:33', ' users'),
(163, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:33', ' users'),
(164, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:38', ' users'),
(165, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:38', ' users'),
(166, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:59', ' users'),
(167, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:03:59', ' users'),
(168, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:04:13', ' users'),
(169, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:04:13', ' users'),
(170, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:04:40', ' customer'),
(171, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', 'users', 'delete', '2019-05-14 23:04:40', ' customer2'),
(172, 'superadmin', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0', '', 'logout', '2019-05-14 23:06:08', 'Logout');

-- --------------------------------------------------------

--
-- Table structure for table `billofmaterials`
--

CREATE TABLE IF NOT EXISTS `billofmaterials` (
  `billofmaterialsId` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`billofmaterialsId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `billofmaterials`
--

INSERT INTO `billofmaterials` (`billofmaterialsId`, `itemId`, `revision`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(5, 5, 2, 0, 'superadmin', '2019-05-05 16:06:32', 'superadmin', '2019-05-05 16:06:32'),
(4, 1, 1, 0, 'superadmin', '2019-05-05 15:56:09', 'superadmin', '2019-05-05 15:56:09'),
(3, 6, 1, 0, 'superadmin', '2019-05-05 15:52:24', 'superadmin', '2019-05-05 15:52:24'),
(2, 4, 1, 0, 'superadmin', '2019-05-05 15:52:12', 'superadmin', '2019-05-05 15:52:12'),
(1, 5, 1, -1, 'superadmin', '2019-05-05 15:52:01', 'superadmin', '2019-05-05 15:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `billofmaterialsdetails`
--

CREATE TABLE IF NOT EXISTS `billofmaterialsdetails` (
  `billofmaterialsdetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `billofmaterialsId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `usageQuantity` int(11) NOT NULL,
  `usageUnitId` int(11) NOT NULL,
  `baseQuantity` int(11) NOT NULL,
  `baseUnitId` int(11) NOT NULL,
  PRIMARY KEY (`billofmaterialsdetailsId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `billofmaterialsdetails`
--

INSERT INTO `billofmaterialsdetails` (`billofmaterialsdetailsId`, `billofmaterialsId`, `itemId`, `usageQuantity`, `usageUnitId`, `baseQuantity`, `baseUnitId`) VALUES
(1, 1, 3, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1, 1),
(3, 3, 5, 1, 1, 1, 1),
(4, 3, 4, 1, 1, 1, 1),
(5, 4, 2, 1, 1, 1, 1),
(6, 5, 3, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerCode` varchar(20) NOT NULL,
  `customerName` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contactNumber` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `errormsgs`
--

CREATE TABLE IF NOT EXISTS `errormsgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `orig` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1481 ;

--
-- Dumping data for table `errormsgs`
--

INSERT INTO `errormsgs` (`id`, `message`, `orig`) VALUES
(1000, ' hashchk\n', ''),
(1001, ' isamchk\n', ''),
(1002, ' NO\n', ''),
(1003, ' YES\n', ''),
(1004, ' Can''t create file ''%s'' (errno: %d)\n', ''),
(1005, ' Can''t create table ''%s'' (errno: %d)\n', ''),
(1006, ' Can''t create database ''%s'' (errno: %d)\n', ''),
(1007, ' Can''t create database ''%s''; database exists\n', ''),
(1008, ' Can''t drop database ''%s''; database doesn''t exist\n', ''),
(1009, ' Error dropping database (can''t delete ''%s'', errno: %d)\n', ''),
(1010, ' Error dropping database (can''t rmdir ''%s'', errno: %d)\n', ''),
(1011, ' Error on delete of ''%s'' (errno: %d)\n', ''),
(1012, ' Can''t read record in system table\n', ''),
(1013, ' Can''t get status of ''%s'' (errno: %d)\n', ''),
(1014, ' Can''t get working directory (errno: %d)\n', ''),
(1015, ' Can''t lock file (errno: %d)\n', ''),
(1016, ' Can''t open file: ''%s'' (errno: %d)\n', ''),
(1017, ' Can''t find file: ''%s'' (errno: %d)\n', ''),
(1018, ' Can''t read dir of ''%s'' (errno: %d)\n', ''),
(1019, ' Can''t change dir to ''%s'' (errno: %d)\n', ''),
(1020, ' Record has changed since last read in table ''%s''\n', ''),
(1021, ' Disk full (%s); waiting for someone to free some space...\n', ''),
(1022, ' Can''t write; duplicate key in table ''%s''\n', ''),
(1023, ' Error on close of ''%s'' (errno: %d)\n', ''),
(1024, ' Error reading file ''%s'' (errno: %d)\n', ''),
(1025, ' Error on rename of ''%s'' to ''%s'' (errno: %d)\n', ''),
(1026, ' Error writing file ''%s'' (errno: %d)\n', ''),
(1027, ' ''%s'' is locked against change\n', ''),
(1028, ' Sort aborted\n', ''),
(1029, ' View ''%s'' doesn''t exist for ''%s''\n', ''),
(1030, ' Got error %d from storage engine\n', ''),
(1031, ' Table storage engine for ''%s'' doesn''t have this option\n', ''),
(1032, ' Can''t find record in ''%s''\n', ''),
(1033, ' Incorrect information in file: ''%s''\n', ''),
(1034, ' Incorrect key file for table ''%s''; try to repair it\n', ''),
(1035, ' Old key file for table ''%s''; repair it!\n', ''),
(1036, ' Table ''%s'' is read only\n', ''),
(1037, ' Out of memory; restart server and try again (needed %d bytes)\n', ''),
(1038, ' Out of sort memory; increase server sort buffer size\n', ''),
(1039, ' Unexpected EOF found when reading file ''%s'' (errno: %d)\n', ''),
(1040, ' Too many connections\n', ''),
(1041, ' Out of memory; check if mysqld or some other process uses all available memory; if not, you may have to use ''ulimit'' to allow mysqld to use more memory or you can add more swap space\n', ''),
(1042, ' Can''t get hostname for your address\n', ''),
(1043, ' Bad handshake\n', ''),
(1044, ' Access denied for user ''%s''@''%s'' to database ''%s''\n', ''),
(1045, ' Access denied for user ''%s''@''%s'' (using password: %s)\n', ''),
(1046, ' No database selected\n', ''),
(1047, ' Unknown command\n', ''),
(1048, ' Column ''%s'' cannot be null\n', ''),
(1049, ' Unknown database ''%s''\n', ''),
(1050, ' Table ''%s'' already exists\n', ''),
(1051, ' Unknown table ''%s''\n', ''),
(1052, ' Column ''%s'' in %s is ambiguous\n', ''),
(1053, ' Server shutdown in progress\n', ''),
(1054, ' Unknown column ''%s'' in ''%s''\n', ''),
(1055, ' ''%s'' isn''t in GROUP BY\n', ''),
(1056, ' Can''t group on ''%s''\n', ''),
(1057, ' Statement has sum functions and columns in same statement\n', ''),
(1058, ' Column count doesn''t match value count\n', ''),
(1059, ' Identifier name ''%s'' is too long\n', ''),
(1060, ' Duplicate column name ''%s''\n', ''),
(1061, ' Duplicate key name ''%s''\n', ''),
(1062, 'Duplicate Entry', ''),
(1063, ' Incorrect column specifier for column ''%s''\n', ''),
(1064, ' %s near ''%s'' at line %d\n', ''),
(1065, ' Query was empty\n', ''),
(1066, ' Not unique table/alias: ''%s''\n', ''),
(1067, ' Invalid default value for ''%s''\n', ''),
(1068, ' Multiple primary key defined\n', ''),
(1069, ' Too many keys specified; max %d keys allowed\n', ''),
(1070, ' Too many key parts specified; max %d parts allowed\n', ''),
(1071, ' Specified key was too long; max key length is %d bytes\n', ''),
(1072, ' Key column ''%s'' doesn''t exist in table\n', ''),
(1073, ' BLOB column ''%s'' can''t be used in key specification with the used table type\n', ''),
(1074, ' Column length too big for column ''%s'' (max = %lu); use BLOB or TEXT instead\n', ''),
(1075, ' Incorrect table definition; there can be only one auto column and it must be defined as a key\n', ''),
(1076, ' %s: ready for connections. Version: ''%s'' socket: ''%s'' port: %d\n', ''),
(1077, ' %s: Normal shutdown\n', ''),
(1078, ' %s: Got signal %d. Aborting!\n', ''),
(1079, ' %s: Shutdown complete\n', ''),
(1080, ' %s: Forcing close of thread %ld user: ''%s''\n', ''),
(1081, ' Can''t create IP socket\n', ''),
(1082, ' Table ''%s'' has no index like the one used in CREATE INDEX; recreate the table\n', ''),
(1083, ' Field separator argument is not what is expected; check the manual\n', ''),
(1084, ' You can''t use fixed rowlength with BLOBs; please use ''fields terminated by''\n', ''),
(1085, ' The file ''%s'' must be in the database directory or be readable by all\n', ''),
(1086, ' File ''%s'' already exists\n', ''),
(1087, ' Records: %ld Deleted: %ld Skipped: %ld Warnings: %ld\n', ''),
(1088, ' Records: %ld Duplicates: %ld\n', ''),
(1089, ' Incorrect sub part key; the used key part isn''t a string, the used length is longer than the key part, or the storage engine doesn''t support unique sub keys\n', ''),
(1090, ' You can''t delete all columns with ALTER TABLE; use DROP TABLE instead\n', ''),
(1091, ' Can''t DROP ''%s''; check that column/key exists\n', ''),
(1092, ' Records: %ld Duplicates: %ld Warnings: %ld\n', ''),
(1093, ' You can''t specify target table ''%s'' for update in FROM clause\n', ''),
(1094, ' Unknown thread id: %lu\n', ''),
(1095, ' You are not owner of thread %lu\n', ''),
(1096, ' No tables used\n', ''),
(1097, ' Too many strings for column %s and SET\n', ''),
(1098, ' Can''t generate a unique log-filename %s.(1-999)\n', ''),
(1099, ' Table ''%s'' was locked with a READ lock and can''t be updated\n', ''),
(1100, ' Table ''%s'' was not locked with LOCK TABLES\n', ''),
(1101, ' BLOB/TEXT column ''%s'' can''t have a default value\n', ''),
(1102, ' Incorrect database name ''%s''\n', ''),
(1103, ' Incorrect table name ''%s''\n', ''),
(1104, ' The SELECT would examine more than MAX_JOIN_SIZE rows; check your WHERE and use SET SQL_BIG_SELECTS=1 or SET SQL_MAX_JOIN_SIZE=# if the SELECT is okay\n', ''),
(1105, ' Unknown error\n', ''),
(1106, ' Unknown procedure ''%s''\n', ''),
(1107, ' Incorrect parameter count to procedure ''%s''\n', ''),
(1108, ' Incorrect parameters to procedure ''%s''\n', ''),
(1109, ' Unknown table ''%s'' in %s\n', ''),
(1110, ' Column ''%s'' specified twice\n', ''),
(1111, ' Invalid use of group function\n', ''),
(1112, ' Table ''%s'' uses an extension that doesn''t exist in this MySQL version\n', ''),
(1113, ' A table must have at least 1 column\n', ''),
(1114, ' The table ''%s'' is full\n', ''),
(1115, ' Unknown character set: ''%s''\n', ''),
(1116, ' Too many tables; MySQL can only use %d tables in a join\n', ''),
(1117, ' Too many columns\n', ''),
(1118, ' Row size too large. The maximum row size for the used table type, not counting BLOBs, is %ld. You have to change some columns to TEXT or BLOBs\n', ''),
(1119, ' Thread stack overrun: Used: %ld of a %ld stack. Use ''mysqld -O thread_stack=#'' to specify a bigger stack if needed\n', ''),
(1120, ' Cross dependency found in OUTER JOIN; examine your ON conditions\n', ''),
(1121, ' Column ''%s'' is used with UNIQUE or INDEX but is not defined as NOT NULL\n', ''),
(1122, ' Can''t load function ''%s''\n', ''),
(1123, ' Can''t initialize function ''%s''; %s\n', ''),
(1124, ' No paths allowed for shared library\n', ''),
(1125, ' Function ''%s'' already exists\n', ''),
(1126, ' Can''t open shared library ''%s'' (errno: %d %s)\n', ''),
(1127, ' Can''t find function ''%s'' in library\n', ''),
(1128, ' Function ''%s'' is not defined\n', ''),
(1129, ' Host ''%s'' is blocked because of many connection errors; unblock with ''mysqladmin flush-hosts''\n', ''),
(1130, ' Host ''%s'' is not allowed to connect to this MySQL server\n', ''),
(1131, ' You are using MySQL as an anonymous user and anonymous users are not allowed to change passwords\n', ''),
(1132, ' You must have privileges to update tables in the mysql database to be able to change passwords for others\n', ''),
(1133, ' Can''t find any matching row in the user table\n', ''),
(1134, ' Rows matched: %ld Changed: %ld Warnings: %ld\n', ''),
(1135, ' Can''t create a new thread (errno %d); if you are not out of available memory, you can consult the manual for a possible OS-dependent bug\n', ''),
(1136, ' Column count doesn''t match value count at row %ld\n', ''),
(1137, ' Can''t reopen table: ''%s''\n', ''),
(1138, ' Invalid use of NULL value\n', ''),
(1139, ' Got error ''%s'' from regexp\n', ''),
(1140, ' Mixing of GROUP columns (MIN(),MAX(),COUNT(),...) with no GROUP columns is illegal if there is no GROUP BY clause\n', ''),
(1141, ' There is no such grant defined for user ''%s'' on host ''%s''\n', ''),
(1142, ' %s command denied to user ''%s''@''%s'' for table ''%s''\n', ''),
(1143, ' %s command denied to user ''%s''@''%s'' for column ''%s'' in table ''%s''\n', ''),
(1144, ' Illegal GRANT/REVOKE command; please consult the manual to see which privileges can be used\n', ''),
(1145, ' The host or user argument to GRANT is too long\n', ''),
(1146, ' Table ''%s.%s'' doesn''t exist\n', ''),
(1147, ' There is no such grant defined for user ''%s'' on host ''%s'' on table ''%s''\n', ''),
(1148, ' The used command is not allowed with this MySQL version\n', ''),
(1149, ' You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use\n', ''),
(1150, ' Delayed insert thread couldn''t get requested lock for table %s\n', ''),
(1151, ' Too many delayed threads in use\n', ''),
(1152, ' Aborted connection %ld to db: ''%s'' user: ''%s'' (%s)\n', ''),
(1153, ' Got a packet bigger than ''max_allowed_packet'' bytes\n', ''),
(1154, ' Got a read error from the connection pipe\n', ''),
(1155, ' Got an error from fcntl()\n', ''),
(1156, ' Got packets out of order\n', ''),
(1157, ' Couldn''t uncompress communication packet\n', ''),
(1158, ' Got an error reading communication packets\n', ''),
(1159, ' Got timeout reading communication packets\n', ''),
(1160, ' Got an error writing communication packets\n', ''),
(1161, ' Got timeout writing communication packets\n', ''),
(1162, ' Result string is longer than ''max_allowed_packet'' bytes\n', ''),
(1163, ' The used table type doesn''t support BLOB/TEXT columns\n', ''),
(1164, ' The used table type doesn''t support AUTO_INCREMENT columns\n', ''),
(1165, ' INSERT DELAYED can''t be used with table ''%s'' because it is locked with LOCK TABLES\n', ''),
(1166, ' Incorrect column name ''%s''\n', ''),
(1167, ' The used storage engine can''t index column ''%s''\n', ''),
(1168, ' Unable to open underlying table which is differently defined or of non-MyISAM type or doesn''t exist\n', ''),
(1169, ' Can''t write, because of unique constraint, to table ''%s''\n', ''),
(1170, ' BLOB/TEXT column ''%s'' used in key specification without a key length\n', ''),
(1171, ' All parts of a PRIMARY KEY must be NOT NULL; if you need NULL in a key, use UNIQUE instead\n', ''),
(1172, ' Result consisted of more than one row\n', ''),
(1173, ' This table type requires a primary key\n', ''),
(1174, ' This version of MySQL is not compiled with RAID support\n', ''),
(1175, ' You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column\n', ''),
(1176, ' Key ''%s'' doesn''t exist in table ''%s''\n', ''),
(1177, ' Can''t open table\n', ''),
(1178, ' The storage engine for the table doesn''t support %s\n', ''),
(1179, ' You are not allowed to execute this command in a transaction\n', ''),
(1180, ' Got error %d during COMMIT\n', ''),
(1181, ' Got error %d during ROLLBACK\n', ''),
(1182, ' Got error %d during FLUSH_LOGS\n', ''),
(1183, ' Got error %d during CHECKPOINT\n', ''),
(1184, ' Aborted connection %ld to db: ''%s'' user: ''%s'' host: ''%s'' (%s)\n', ''),
(1185, ' The storage engine for the table does not support binary table dump\n', ''),
(1186, ' Binlog closed, cannot RESET MASTER\n', ''),
(1187, ' Failed rebuilding the index of dumped table ''%s''\n', ''),
(1188, ' Error from master: ''%s''\n', ''),
(1189, ' Net error reading from master\n', ''),
(1190, ' Net error writing to master\n', ''),
(1191, ' Can''t find FULLTEXT index matching the column list\n', ''),
(1192, ' Can''t execute the given command because you have active locked tables or an active transaction\n', ''),
(1193, ' Unknown system variable ''%s''\n', ''),
(1194, ' Table ''%s'' is marked as crashed and should be repaired\n', ''),
(1195, ' Table ''%s'' is marked as crashed and last (automatic?) repair failed\n', ''),
(1196, ' Some non-transactional changed tables couldn''t be rolled back\n', ''),
(1197, ' Multi-statement transaction required more than ''max_binlog_cache_size'' bytes of storage; increase this mysqld variable and try again\n', ''),
(1198, ' This operation cannot be performed with a running slave; run STOP SLAVE first\n', ''),
(1199, ' This operation requires a running slave; configure slave and do START SLAVE\n', ''),
(1200, ' The server is not configured as slave; fix in config file or with CHANGE MASTER TO\n', ''),
(1201, ' Could not initialize master info structure; more error messages can be found in the MySQL error log\n', ''),
(1202, ' Could not create slave thread; check system resources\n', ''),
(1203, ' User %s already has more than ''max_user_connections'' active connections\n', ''),
(1204, ' You may only use constant expressions with SET\n', ''),
(1205, ' Lock wait timeout exceeded; try restarting transaction\n', ''),
(1206, ' The total number of locks exceeds the lock table size\n', ''),
(1207, ' Update locks cannot be acquired during a READ UNCOMMITTED transaction\n', ''),
(1208, ' DROP DATABASE not allowed while thread is holding global read lock\n', ''),
(1209, ' CREATE DATABASE not allowed while thread is holding global read lock\n', ''),
(1210, ' Incorrect arguments to %s\n', ''),
(1211, ' ''%s''@''%s'' is not allowed to create new users\n', ''),
(1212, ' Incorrect table definition; all MERGE tables must be in the same database\n', ''),
(1213, ' Deadlock found when trying to get lock; try restarting transaction\n', ''),
(1214, ' The used table type doesn''t support FULLTEXT indexes\n', ''),
(1215, ' Cannot add foreign key constraint\n', ''),
(1216, ' Cannot add or update a child row: a foreign key constraint fails\n', ''),
(1217, ' Cannot delete or update a parent row: a foreign key constraint fails\n', ''),
(1218, ' Error connecting to master: %s\n', ''),
(1219, ' Error running query on master: %s\n', ''),
(1220, ' Error when executing command %s: %s\n', ''),
(1221, ' Incorrect usage of %s and %s\n', ''),
(1222, ' The used SELECT statements have a different number of columns\n', ''),
(1223, ' Can''t execute the query because you have a conflicting read lock\n', ''),
(1224, ' Mixing of transactional and non-transactional tables is disabled\n', ''),
(1225, ' Option ''%s'' used twice in statement\n', ''),
(1226, ' User ''%s'' has exceeded the ''%s'' resource (current value: %ld)\n', ''),
(1227, ' Access denied; you need the %s privilege for this operation\n', ''),
(1228, ' Variable ''%s'' is a SESSION variable and can''t be used with SET GLOBAL\n', ''),
(1229, ' Variable ''%s'' is a GLOBAL variable and should be set with SET GLOBAL\n', ''),
(1230, ' Variable ''%s'' doesn''t have a default value\n', ''),
(1231, ' Variable ''%s'' can''t be set to the value of ''%s''\n', ''),
(1232, ' Incorrect argument type to variable ''%s''\n', ''),
(1233, ' Variable ''%s'' can only be set, not read\n', ''),
(1234, ' Incorrect usage/placement of ''%s''\n', ''),
(1235, ' This version of MySQL doesn''t yet support ''%s''\n', ''),
(1236, ' Got fatal error %d: ''%s'' from master when reading data from binary log\n', ''),
(1237, ' Slave SQL thread ignored the query because of replicate-*-table rules\n', ''),
(1238, ' Variable ''%s'' is a %s variable\n', ''),
(1239, ' Incorrect foreign key definition for ''%s'': %s\n', ''),
(1240, ' Key reference and table reference don''t match\n', ''),
(1241, ' Operand should contain %d column(s)\n', ''),
(1242, ' Subquery returns more than 1 row\n', ''),
(1243, ' Unknown prepared statement handler (%.*s) given to %s\n', ''),
(1244, ' Help database is corrupt or does not exist\n', ''),
(1245, ' Cyclic reference on subqueries\n', ''),
(1246, ' Converting column ''%s'' from %s to %s\n', ''),
(1247, ' Reference ''%s'' not supported (%s)\n', ''),
(1248, ' Every derived table must have its own alias\n', ''),
(1249, ' Select %u was reduced during optimization\n', ''),
(1250, ' Table ''%s'' from one of the SELECTs cannot be used in %s\n', ''),
(1251, ' Client does not support authentication protocol requested by server; consider upgrading MySQL client\n', ''),
(1252, ' All parts of a SPATIAL index must be NOT NULL\n', ''),
(1253, ' COLLATION ''%s'' is not valid for CHARACTER SET ''%s''\n', ''),
(1254, ' Slave is already running\n', ''),
(1255, ' Slave already has been stopped\n', ''),
(1256, ' Uncompressed data size too large; the maximum size is %d (probably, length of uncompressed data was corrupted)\n', ''),
(1257, ' ZLIB: Not enough memory\n', ''),
(1258, ' ZLIB: Not enough room in the output buffer (probably, length of uncompressed data was corrupted)\n', ''),
(1259, ' ZLIB: Input data corrupted\n', ''),
(1260, ' %d line(s) were cut by GROUP_CONCAT()\n', ''),
(1261, ' Row %ld doesn''t contain data for all columns\n', ''),
(1262, ' Row %ld was truncated; it contained more data than there were input columns\n', ''),
(1263, ' Column was set to data type implicit default; NULL supplied for NOT NULL column ''%s'' at row %ld\n', ''),
(1264, ' Out of range value adjusted for column ''%s'' at row %ld\n', ''),
(1265, ' Data truncated for column ''%s'' at row %ld\n', ''),
(1266, ' Using storage engine %s for table ''%s''\n', ''),
(1267, ' Illegal mix of collations (%s,%s) and (%s,%s) for operation ''%s''\n', ''),
(1268, ' Cannot drop one or more of the requested users\n', ''),
(1269, ' Can''t revoke all privileges for one or more of the requested users\n', ''),
(1270, ' Illegal mix of collations (%s,%s), (%s,%s), (%s,%s) for operation ''%s''\n', ''),
(1271, ' Illegal mix of collations for operation ''%s''\n', ''),
(1272, ' Variable ''%s'' is not a variable component (can''t be used as XXXX.variable_name)\n', ''),
(1273, ' Unknown collation: ''%s''\n', ''),
(1274, ' SSL parameters in CHANGE MASTER are ignored because this MySQL slave was compiled without SSL support; they can be used later if MySQL slave with SSL is started\n', ''),
(1275, ' Server is running in --secure-auth mode, but ''%s''@''%s'' has a password in the old format; please change the password to the new format\n', ''),
(1276, ' Field or reference ''%s%s%s%s%s'' of SELECT #%d was resolved in SELECT #%d\n', ''),
(1277, ' Incorrect parameter or combination of parameters for START SLAVE UNTIL\n', ''),
(1278, ' It is recommended to use --skip-slave-start when doing step-by-step replication with START SLAVE UNTIL; otherwise, you will get problems if you get an unexpected slave''s mysqld restart\n', ''),
(1279, ' SQL thread is not to be started so UNTIL options are ignored\n', ''),
(1280, ' Incorrect index name ''%s''\n', ''),
(1281, ' Incorrect catalog name ''%s''\n', ''),
(1282, ' Query cache failed to set size %lu; new query cache size is %lu\n', ''),
(1283, ' Column ''%s'' cannot be part of FULLTEXT index\n', ''),
(1284, ' Unknown key cache ''%s''\n', ''),
(1285, ' MySQL is started in --skip-name-resolve mode; you must restart it without this switch for this grant to work\n', ''),
(1286, ' Unknown table engine ''%s''\n', ''),
(1287, ' ''%s'' is deprecated; use ''%s'' instead\n', ''),
(1288, ' The target table %s of the %s is not updatable\n', ''),
(1289, ' The ''%s'' feature is disabled; you need MySQL built with ''%s'' to have it working\n', ''),
(1290, ' The MySQL server is running with the %s option so it cannot execute this statement\n', ''),
(1291, ' Column ''%s'' has duplicated value ''%s'' in %s\n', ''),
(1292, ' Truncated incorrect %s value: ''%s''\n', ''),
(1293, ' Incorrect table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause\n', ''),
(1294, ' Invalid ON UPDATE clause for ''%s'' column\n', ''),
(1295, ' This command is not supported in the prepared statement protocol yet\n', ''),
(1296, ' Got error %d ''%s'' from %s\n', ''),
(1297, ' Got temporary error %d ''%s'' from %s\n', ''),
(1298, ' Unknown or incorrect time zone: ''%s''\n', ''),
(1299, ' Invalid TIMESTAMP value in column ''%s'' at row %ld\n', ''),
(1300, ' Invalid %s character string: ''%s''\n', ''),
(1301, ' Result of %s() was larger than max_allowed_packet (%ld) - truncated\n', ''),
(1302, ' Conflicting declarations: ''%s%s'' and ''%s%s''\n', ''),
(1303, ' Can''t create a %s from within another stored routine\n', ''),
(1304, ' %s %s already exists\n', ''),
(1305, ' %s %s does not exist\n', ''),
(1306, ' Failed to DROP %s %s\n', ''),
(1307, ' Failed to CREATE %s %s\n', ''),
(1308, ' %s with no matching label: %s\n', ''),
(1309, ' Redefining label %s\n', ''),
(1310, ' End-label %s without match\n', ''),
(1311, ' Referring to uninitialized variable %s\n', ''),
(1312, ' PROCEDURE %s can''t return a result set in the given context\n', ''),
(1313, ' RETURN is only allowed in a FUNCTION\n', ''),
(1314, ' %s is not allowed in stored procedures\n', ''),
(1315, ' The update log is deprecated and replaced by the binary log; SET SQL_LOG_UPDATE has been ignored\n', ''),
(1316, ' The update log is deprecated and replaced by the binary log; SET SQL_LOG_UPDATE has been translated to SET SQL_LOG_BIN\n', ''),
(1317, ' Query execution was interrupted\n', ''),
(1318, ' Incorrect number of arguments for %s %s; expected %u, got %u\n', ''),
(1319, ' Undefined CONDITION: %s\n', ''),
(1320, ' No RETURN found in FUNCTION %s\n', ''),
(1321, ' FUNCTION %s ended without RETURN\n', ''),
(1322, ' Cursor statement must be a SELECT\n', ''),
(1323, ' Cursor SELECT must not have INTO\n', ''),
(1324, ' Undefined CURSOR: %s\n', ''),
(1325, ' Cursor is already open\n', ''),
(1326, ' Cursor is not open\n', ''),
(1327, ' Undeclared variable: %s\n', ''),
(1328, ' Incorrect number of FETCH variables\n', ''),
(1329, ' No data - zero rows fetched, selected, or processed\n', ''),
(1330, ' Duplicate parameter: %s\n', ''),
(1331, ' Duplicate variable: %s\n', ''),
(1332, ' Duplicate condition: %s\n', ''),
(1333, ' Duplicate cursor: %s\n', ''),
(1334, ' Failed to ALTER %s %s\n', ''),
(1335, ' Subselect value not supported\n', ''),
(1336, ' %s is not allowed in stored function or trigger\n', ''),
(1337, ' Variable or condition declaration after cursor or handler declaration\n', ''),
(1338, ' Cursor declaration after handler declaration\n', ''),
(1339, ' Case not found for CASE statement\n', ''),
(1340, ' Configuration file ''%s'' is too big\n', ''),
(1341, ' Malformed file type header in file ''%s''\n', ''),
(1342, ' Unexpected end of file while parsing comment ''%s''\n', ''),
(1343, ' Error while parsing parameter ''%s'' (line: ''%s'')\n', ''),
(1344, ' Unexpected end of file while skipping unknown parameter ''%s''\n', ''),
(1345, ' EXPLAIN/SHOW can not be issued; lacking privileges for underlying table\n', ''),
(1346, ' File ''%s'' has unknown type ''%s'' in its header\n', ''),
(1347, ' ''%s.%s'' is not %s\n', ''),
(1348, ' Column ''%s'' is not updatable\n', ''),
(1349, ' View''s SELECT contains a subquery in the FROM clause\n', ''),
(1350, ' View''s SELECT contains a ''%s'' clause\n', ''),
(1351, ' View''s SELECT contains a variable or parameter\n', ''),
(1352, ' View''s SELECT refers to a temporary table ''%s''\n', ''),
(1353, ' View''s SELECT and view''s field list have different column counts\n', ''),
(1354, ' View merge algorithm can''t be used here for now (assumed undefined algorithm)\n', ''),
(1355, ' View being updated does not have complete key of underlying table in it\n', ''),
(1356, ' View ''%s.%s'' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them\n', ''),
(1357, ' Can''t drop or alter a %s from within another stored routine\n', ''),
(1358, ' GOTO is not allowed in a stored procedure handler\n', ''),
(1359, ' Trigger already exists\n', ''),
(1360, ' Trigger does not exist\n', ''),
(1361, ' Trigger''s ''%s'' is view or temporary table\n', ''),
(1362, ' Updating of %s row is not allowed in %strigger\n', ''),
(1363, ' There is no %s row in %s trigger\n', ''),
(1364, ' Field ''%s'' doesn''t have a default value\n', ''),
(1365, ' Division by 0\n', ''),
(1366, ' Incorrect %s value: ''%s'' for column ''%s'' at row %ld\n', ''),
(1367, ' Illegal %s ''%s'' value found during parsing\n', ''),
(1368, ' CHECK OPTION on non-updatable view ''%s.%s''\n', ''),
(1369, ' CHECK OPTION failed ''%s.%s''\n', ''),
(1370, ' %s command denied to user ''%s''@''%s'' for routine ''%s''\n', ''),
(1371, ' Failed purging old relay logs: %s\n', ''),
(1372, ' Password hash should be a %d-digit hexadecimal number\n', ''),
(1373, ' Target log not found in binlog index\n', ''),
(1374, ' I/O error reading log index file\n', ''),
(1375, ' Server configuration does not permit binlog purge\n', ''),
(1376, ' Failed on fseek()\n', ''),
(1377, ' Fatal error during log purge\n', ''),
(1378, ' A purgeable log is in use, will not purge\n', ''),
(1379, ' Unknown error during log purge\n', ''),
(1380, ' Failed initializing relay log position: %s\n', ''),
(1381, ' You are not using binary logging\n', ''),
(1382, ' The ''%s'' syntax is reserved for purposes internal to the MySQL server\n', ''),
(1383, ' WSAStartup Failed\n', ''),
(1384, ' Can''t handle procedures with different groups yet\n', ''),
(1385, ' Select must have a group with this procedure\n', ''),
(1386, ' Can''t use ORDER clause with this procedure\n', ''),
(1387, ' Binary logging and replication forbid changing the global server %s\n', ''),
(1388, ' Can''t map file: %s, errno: %d\n', ''),
(1389, ' Wrong magic in %s\n', ''),
(1390, ' Prepared statement contains too many placeholders\n', ''),
(1391, ' Key part ''%s'' length cannot be 0\n', ''),
(1392, ' View text checksum failed\n', ''),
(1393, ' Can not modify more than one base table through a join view ''%s.%s''\n', ''),
(1394, ' Can not insert into join view ''%s.%s'' without fields list\n', ''),
(1395, ' Can not delete from join view ''%s.%s''\n', ''),
(1396, ' Operation %s failed for %s\n', ''),
(1397, ' XAER_NOTA: Unknown XID\n', ''),
(1398, ' XAER_INVAL: Invalid arguments (or unsupported command)\n', ''),
(1399, ' XAER_RMFAIL: The command cannot be executed when global transaction is in the %s state\n', ''),
(1400, ' XAER_OUTSIDE: Some work is done outside global transaction\n', ''),
(1401, ' XAER_RMERR: Fatal error occurred in the transaction branch - check your data for consistency\n', ''),
(1402, ' XA_RBROLLBACK: Transaction branch was rolled back\n', ''),
(1403, ' There is no such grant defined for user ''%s'' on host ''%s'' on routine ''%s''\n', ''),
(1404, ' Failed to grant EXECUTE and ALTER ROUTINE privileges\n', ''),
(1405, ' Failed to revoke all privileges to dropped routine\n', ''),
(1406, ' Data too long for column ''%s'' at row %ld\n', ''),
(1407, ' Bad SQLSTATE: ''%s''\n', ''),
(1408, ' %s: ready for connections. Version: ''%s'' socket: ''%s'' port: %d %s\n', ''),
(1409, ' Can''t load value from file with fixed size rows to variable\n', ''),
(1410, ' You are not allowed to create a user with GRANT\n', ''),
(1411, ' Incorrect %s value: ''%s'' for function %s\n', ''),
(1412, ' Table definition has changed, please retry transaction\n', ''),
(1413, ' Duplicate handler declared in the same block\n', ''),
(1414, ' OUT or INOUT argument %d for routine %s is not a variable or NEW pseudo-variable in BEFORE trigger\n', ''),
(1415, ' Not allowed to return a result set from a %s\n', ''),
(1416, ' Cannot get geometry object from data you send to the GEOMETRY field\n', ''),
(1417, ' A routine failed and has neither NO SQL nor READS SQL DATA in its declaration and binary logging is enabled; if non-transactional tables were updated, the binary log will miss their changes\n', ''),
(1418, ' This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)\n', ''),
(1419, ' You do not have the SUPER privilege and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)\n', ''),
(1420, ' You can''t execute a prepared statement which has an open cursor associated with it. Reset the statement to re-execute it.\n', ''),
(1421, ' The statement (%lu) has no open cursor.\n', ''),
(1422, ' Explicit or implicit commit is not allowed in stored function or trigger.\n', ''),
(1423, ' Field of view ''%s.%s'' underlying table doesn''t have a default value\n', ''),
(1424, ' Recursive stored functions and triggers are not allowed.\n', ''),
(1425, ' Too big scale %lu specified for column ''%s''. Maximum is %d.\n', ''),
(1426, ' Too big precision %lu specified for column ''%s''. Maximum is %lu.\n', ''),
(1427, ' For float(M,D), double(M,D) or decimal(M,D), M must be >= D (column ''%s'').\n', ''),
(1428, ' You can''t combine write-locking of system ''%s.%s'' table with other tables\n', ''),
(1429, ' Unable to connect to foreign data source: %s\n', ''),
(1430, ' There was a problem processing the query on the foreign data source. Data source error: %s\n', ''),
(1431, ' The foreign data source you are trying to reference does not exist. Data source error: %s\n', ''),
(1432, ' Can''t create federated table. The data source connection string ''%s'' is not in the correct format\n', ''),
(1433, ' The data source connection string ''%s'' is not in the correct format\n', ''),
(1434, ' Can''t create federated table. Foreign data src error: %s\n', ''),
(1435, ' Trigger in wrong schema\n', ''),
(1436, ' Thread stack overrun: %ld bytes used of a %ld byte stack, and %ld bytes needed. Use ''mysqld -O thread_stack=#'' to specify a bigger stack.\n', ''),
(1437, ' Routine body for ''%s'' is too long\n', ''),
(1438, ' Cannot drop default keycache\n', ''),
(1439, ' Display width out of range for column ''%s'' (max = %lu)\n', ''),
(1440, ' XAER_DUPID: The XID already exists\n', ''),
(1441, ' Datetime function: %s field overflow\n', ''),
(1442, ' Can''t update table ''%s'' in stored function/trigger because it is already used by statement which invoked this stored function/trigger.\n', ''),
(1443, ' The definition of table ''%s'' prevents operation %s on table ''%s''.\n', ''),
(1444, ' The prepared statement contains a stored routine call that refers to that same statement. It''s not allowed to execute a prepared statement in such a recursive manner\n', ''),
(1445, ' Not allowed to set autocommit from a stored function or trigger\n', ''),
(1446, ' Definer is not fully qualified\n', ''),
(1447, ' View ''%s''.''%s'' has no definer information (old table format). Current user is used as definer. Please recreate the view!\n', ''),
(1448, ' You need the SUPER privilege for creation view with ''%s''@''%s'' definer\n', ''),
(1449, ' There is no ''%s''@''%s'' registered\n', ''),
(1450, ' Changing schema from ''%s'' to ''%s'' is not allowed.\n', ''),
(1451, 'Cannot save or delete a record.  \r\n', ' Cannot delete or update a parent row: a foreign key constraint fails (%s)\r\n'),
(1452, ' Cannot add or update a child row: a foreign key constraint fails (%s)\n', ''),
(1453, ' Variable ''%s'' must be quoted with `...`, or renamed\n', ''),
(1454, ' No definer attribute for trigger ''%s''.''%s''. The trigger will be activated under the authorization of the invoker, which may have insufficient privileges. Please recreate the trigger.\n', ''),
(1455, ' ''%s'' has an old format, you should re-create the ''%s'' object(s)\n', ''),
(1456, ' Recursive limit %d (as set by the max_sp_recursion_depth variable) was exceeded for routine %s\n', ''),
(1457, ' Failed to load routine %s. The table mysql.proc is missing, corrupt, or contains bad data (internal code %d)\n', ''),
(1458, ' Incorrect routine name ''%s''\n', ''),
(1459, ' Table upgrade required. Please do "REPAIR TABLE `%s`" to fix it!\n', ''),
(1460, ' AGGREGATE is not supported for stored functions\n', ''),
(1461, ' Can''t create more than max_prepared_stmt_count statements (current value: %lu)\n', ''),
(1462, ' `%s`.`%s` contains view recursion\n', ''),
(1463, ' non-grouping field ''%s'' is used in %s clause\n', ''),
(1464, ' The used table type doesn''t support SPATIAL indexes\n', ''),
(1465, ' Triggers can not be created on system tables\n', ''),
(1466, ' Leading spaces are removed from name ''%s''\n', ''),
(1467, ' Failed to read auto-increment value from storage engine\n', ''),
(1468, ' user name\n', ''),
(1469, ' host name\n', ''),
(1470, ' String ''%s'' is too long for %s (should be no longer than %d)\n', ''),
(1471, ' The target table %s of the %s is not insertable-into\n', ''),
(1472, ' Table ''%s'' is differently defined or of non-MyISAM type or doesn''t exist\n', ''),
(1473, ' Too high level of nesting for select\n', ''),
(1474, ' Name ''%s'' has become ''''\n', ''),
(1475, ' First character of the FIELDS TERMINATED string is ambiguous; please use non-optional and non-empty FIELDS ENCLOSED BY\n', ''),
(1476, ' Invalid column reference (%s) in LOAD DATA\n', ''),
(1477, ' Being purged log %s was not found\n', ''),
(1478, ' XA_RBTIMEOUT: Transaction branch was rolled back: took too long\n', ''),
(1479, ' XA_RBDEADLOCK: Transaction branch was rolled back: deadlock was detected\n', ''),
(1480, ' Too many active concurrent transactions\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `groupCode` varchar(12) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `systemStatus` enum('active','inactive','deleted') NOT NULL DEFAULT 'inactive',
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updatedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateProgram` varchar(60) NOT NULL,
  PRIMARY KEY (`groupCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupCode`, `groupName`, `systemStatus`, `enteredBy`, `enteredDate`, `updateBy`, `updatedate`, `updateProgram`) VALUES
('admin', 'Administrator', 'active', 'superadmin', '2013-10-23 14:46:13', 'superadmin', '2013-10-23 14:46:13', ''),
('customer', 'Customer', 'active', '', '2019-02-10 04:13:07', '', '0000-00-00 00:00:00', ''),
('operator', 'Operator', 'active', '', '2019-04-21 16:43:36', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `group_modules`
--

CREATE TABLE IF NOT EXISTS `group_modules` (
  `moduleCode` int(12) NOT NULL,
  `groupCode` varchar(12) NOT NULL,
  `systemStatus` enum('active','inactive','deleted') NOT NULL DEFAULT 'inactive',
  `enteredBy` varchar(20) DEFAULT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateBy` varchar(20) DEFAULT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateProgram` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`moduleCode`,`groupCode`),
  KEY `fk_group_code` (`groupCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_modules`
--

INSERT INTO `group_modules` (`moduleCode`, `groupCode`, `systemStatus`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`, `updateProgram`) VALUES
(2, 'admin', 'inactive', NULL, '2013-10-23 14:46:14', NULL, '0000-00-00 00:00:00', NULL),
(3, 'admin', 'inactive', NULL, '2013-10-23 14:46:14', NULL, '0000-00-00 00:00:00', NULL),
(4, 'admin', 'inactive', NULL, '2013-10-23 14:46:13', NULL, '0000-00-00 00:00:00', NULL),
(10, 'admin', 'inactive', NULL, '2013-10-23 14:46:13', NULL, '0000-00-00 00:00:00', NULL),
(11, 'admin', 'inactive', NULL, '2019-02-10 02:37:43', NULL, '0000-00-00 00:00:00', NULL),
(12, 'admin', 'inactive', NULL, '2019-02-10 03:28:06', NULL, '0000-00-00 00:00:00', NULL),
(12, 'operator', 'inactive', NULL, '2019-02-10 03:28:06', NULL, '0000-00-00 00:00:00', NULL),
(13, 'admin', 'inactive', NULL, '2019-04-21 16:43:20', NULL, '0000-00-00 00:00:00', NULL),
(14, 'admin', 'inactive', NULL, '2019-04-21 16:42:17', NULL, '0000-00-00 00:00:00', NULL),
(15, 'admin', 'inactive', NULL, '2019-04-21 16:48:56', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_modules_tasks`
--

CREATE TABLE IF NOT EXISTS `group_modules_tasks` (
  `taskCode` int(12) NOT NULL,
  `moduleCode` int(12) NOT NULL,
  `groupCode` varchar(12) NOT NULL,
  `systemStatus` enum('active','inactive','deleted') NOT NULL DEFAULT 'inactive',
  `enteredBy` varchar(20) DEFAULT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateBy` varchar(20) DEFAULT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateProgram` varchar(60) DEFAULT NULL,
  KEY `fk_taskCode` (`taskCode`),
  KEY `fk_moduleCode` (`moduleCode`),
  KEY `fk_group_code` (`groupCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_modules_tasks`
--


-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `inventoryId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `lotId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  `processId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventoryId`, `itemId`, `lotId`, `locationId`, `processId`, `quantity`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 3, 0, 0, 0, 9, 0, 'superadmin', '2019-05-06 23:28:03', 'superadmin', '2019-05-06 23:42:50'),
(2, 2, 0, 0, 0, 4, 0, 'superadmin', '2019-05-06 23:44:36', '', '0000-00-00 00:00:00'),
(4, 5, 5, 0, -1, 1, 26, 'superadmin', '2019-05-09 01:36:36', 'superadmin', '2019-05-13 16:18:58'),
(3, 1, 4, 0, -1, 1, 26, 'superadmin', '2019-05-09 01:20:39', 'superadmin', '2019-05-09 01:21:10'),
(5, 1, 6, 0, -1, 100, 26, 'superadmin', '2019-05-13 16:58:02', 'superadmin', '2019-05-13 16:59:08'),
(6, 5, 7, 0, -1, 1, 26, 'superadmin', '2019-05-13 16:59:22', 'superadmin', '2019-05-13 17:00:10'),
(7, 1, 0, 0, 0, 20, 0, 'superadmin', '2019-05-14 22:28:59', '', '0000-00-00 00:00:00'),
(8, 1, 8, 0, 0, 1, 23, 'superadmin', '2019-05-14 22:58:24', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(50) NOT NULL,
  `itemCode` varchar(50) NOT NULL,
  `itemTypeId` int(11) NOT NULL,
  `unitId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`itemId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemId`, `itemName`, `itemCode`, `itemTypeId`, `unitId`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'Marble Tile', 'FG-TILE', 2, 1, 0, 'superadmin', '2019-04-21 20:57:43', 'superadmin', '2019-05-05 14:04:20'),
(2, 'Marble Slab', 'RM-SLAB', 1, 1, 0, 'superadmin', '2019-05-05 14:00:39', 'superadmin', '2019-05-05 14:00:48'),
(3, 'Marble Cyclinder', 'RM-CYLINDER', 1, 1, 0, 'superadmin', '2019-05-05 14:01:51', '', '0000-00-00 00:00:00'),
(4, 'Table Top', 'SFG-TOP', 3, 1, 0, 'superadmin', '2019-05-05 14:03:25', '', '0000-00-00 00:00:00'),
(5, 'Table Stand', 'SFG-STAND', 3, 1, 0, 'superadmin', '2019-05-05 14:03:42', '', '0000-00-00 00:00:00'),
(6, 'Marble Table', 'FG-TABLE', 2, 1, 0, 'superadmin', '2019-05-05 14:04:07', '', '0000-00-00 00:00:00'),
(7, 'CFG', 'CFG', 2, 1, -1, 'superadmin', '2019-05-14 21:35:24', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `itemtype`
--

CREATE TABLE IF NOT EXISTS `itemtype` (
  `itemTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `itemTypeName` varchar(255) NOT NULL,
  `itemTypeCode` varchar(11) NOT NULL,
  PRIMARY KEY (`itemTypeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `itemtype`
--

INSERT INTO `itemtype` (`itemTypeId`, `itemTypeName`, `itemTypeCode`) VALUES
(1, 'Raw Materials', 'RM'),
(2, 'Finished Goods', 'FG'),
(3, 'Semi Finished Goods', 'SFG'),
(4, 'Service', 'SVC');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(255) NOT NULL,
  `locationCode` varchar(50) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`locationId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `locationName`, `locationCode`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'Warehouse', 'WH', 0, 'superadmin', '2019-04-21 20:07:01', '', '0000-00-00 00:00:00'),
(2, 'Receiving', 'RCV', 0, 'superadmin', '2019-04-21 20:08:28', '', '0000-00-00 00:00:00'),
(3, 'Inspection Area', 'ISP', 0, 'superadmin', '2019-04-21 20:08:53', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE IF NOT EXISTS `lot` (
  `lotId` int(11) NOT NULL AUTO_INCREMENT,
  `lotCode` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `lotStatus` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  `billofmaterialsId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lotId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`lotId`, `lotCode`, `itemId`, `lotStatus`, `routeId`, `billofmaterialsId`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'FG-TILE-1-20190507-013045', 1, 0, 5, 4, 26, 'superadmin', '2019-05-07 01:30:45', 'superadmin', '2019-05-08 01:07:15'),
(2, 'FG-TILE-2-20190508-232009', 1, 0, 5, 4, 26, 'superadmin', '2019-05-08 23:20:09', 'superadmin', '2019-05-08 23:25:17'),
(3, 'FG-TILE-3-20190509-005307', 1, 0, 5, 4, 26, 'superadmin', '2019-05-09 00:53:07', 'superadmin', '2019-05-09 01:06:29'),
(4, 'FG-TILE-4-20190509-012039', 1, 0, 5, 4, 26, 'superadmin', '2019-05-09 01:20:39', 'superadmin', '2019-05-09 01:21:10'),
(5, 'SFG-STAND-5-20190509-013636', 5, 0, 6, 5, 26, 'superadmin', '2019-05-09 01:36:36', 'superadmin', '2019-05-13 16:18:58'),
(6, 'FG-TILE-6-20190513-165802', 1, 0, 5, 4, 26, 'superadmin', '2019-05-13 16:58:02', 'superadmin', '2019-05-13 16:59:08'),
(7, 'SFG-STAND-7-20190513-165922', 5, 0, 6, 5, 26, 'superadmin', '2019-05-13 16:59:22', 'superadmin', '2019-05-13 17:00:10'),
(8, 'FG-TILE-8-20190514-225824', 1, 0, 1, 4, 23, 'superadmin', '2019-05-14 22:58:24', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lothistory`
--

CREATE TABLE IF NOT EXISTS `lothistory` (
  `lothistoryId` int(11) NOT NULL AUTO_INCREMENT,
  `lotId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `processId` int(11) NOT NULL,
  `machineId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `image` longblob NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lothistoryId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `lothistory`
--

INSERT INTO `lothistory` (`lothistoryId`, `lotId`, `statusId`, `processId`, `machineId`, `quantity`, `remarks`, `image`, `enteredBy`, `enteredDate`) VALUES
(1, 4, 23, 0, 0, 1, 'Create Lot', '', 'superadmin', '2019-05-09 01:20:39'),
(2, 4, 1, 1, 0, 1, 'Start Lot', '', 'superadmin', '2019-05-09 01:20:42'),
(3, 4, 1, 1, 1, 1, 'Move Lot', '', 'superadmin', '2019-05-09 01:20:47'),
(4, 4, 26, 3, 0, 1, 'Move Lot', '', 'superadmin', '2019-05-09 01:21:10'),
(5, 5, 23, 0, 0, 1, 'Create Lot', '', 'superadmin', '2019-05-09 01:36:36'),
(6, 5, 1, 1, 0, 1, 'Start Lot', '', 'superadmin', '2019-05-09 01:36:40'),
(7, 5, 1, 1, 1, 1, 'Move Lot', '', 'superadmin', '2019-05-09 01:36:46'),
(8, 5, 1, 4, 0, 1, 'Move Lot', '', 'superadmin', '2019-05-13 16:18:51'),
(9, 5, 26, 2, 0, 1, 'Move Lot', '', 'superadmin', '2019-05-13 16:18:58'),
(10, 6, 23, 0, 0, 1, 'Create Lot', '', 'superadmin', '2019-05-13 16:58:02'),
(11, 6, 1, 1, 0, 1, 'Start Lot', '', 'superadmin', '2019-05-13 16:58:10'),
(12, 6, 1, 1, 1, 100, 'Move Lot', '', 'superadmin', '2019-05-13 16:59:02'),
(13, 6, 26, 3, 0, 100, 'Move Lot', '', 'superadmin', '2019-05-13 16:59:08'),
(14, 7, 23, 0, 0, 1, 'Create Lot', '', 'superadmin', '2019-05-13 16:59:22'),
(15, 7, 1, 1, 0, 1, 'Start Lot', '', 'superadmin', '2019-05-13 16:59:25'),
(16, 7, 1, 1, 1, 1, 'Move Lot', '', 'superadmin', '2019-05-13 16:59:30'),
(17, 7, 1, 4, 0, 1, 'Move Lot', '', 'superadmin', '2019-05-13 17:00:04'),
(18, 7, 26, 2, 0, 1, 'Move Lot', '', 'superadmin', '2019-05-13 17:00:10'),
(19, 8, 23, 0, 0, 1, 'Create Lot', '', 'superadmin', '2019-05-14 22:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `lotimages`
--

CREATE TABLE IF NOT EXISTS `lotimages` (
  `lotimageId` int(11) NOT NULL AUTO_INCREMENT,
  `lotId` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lotimageId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lotimages`
--

INSERT INTO `lotimages` (`lotimageId`, `lotId`, `location`, `enteredBy`, `enteredDate`) VALUES
(3, 6, 'lotImages/20190513165949.jpg', 'superadmin', '2019-05-13 16:59:49'),
(2, 6, 'lotImages/20190513165947.jpg', 'superadmin', '2019-05-13 16:59:47'),
(1, 6, 'lotImages/20190513165945.jpg', 'superadmin', '2019-05-13 16:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE IF NOT EXISTS `machine` (
  `machineId` int(11) NOT NULL AUTO_INCREMENT,
  `machineName` varchar(50) NOT NULL,
  `machineCode` varchar(50) NOT NULL,
  `processId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`machineId`),
  UNIQUE KEY `machineId` (`machineId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`machineId`, `machineName`, `machineCode`, `processId`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'Cutter Machine01', 'CUT01', 1, 0, 'superadmin', '2019-04-21 19:03:22', 'superadmin', '2019-04-21 19:08:18'),
(2, 'CFG', 'CFG', 1, -1, 'superadmin', '2019-05-14 21:36:22', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `machinetype`
--

CREATE TABLE IF NOT EXISTS `machinetype` (
  `machineTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `machineTypeName` int(11) NOT NULL,
  PRIMARY KEY (`machineTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `machinetype`
--


-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `moduleCode` int(12) NOT NULL,
  `moduleName` varchar(20) NOT NULL,
  `moduleCaption` varchar(80) NOT NULL,
  `moduleStat` varchar(20) NOT NULL,
  `moduleGroup` varchar(50) NOT NULL,
  `menuOrder` int(3) NOT NULL,
  `remarks` varchar(60) NOT NULL,
  `stat` enum('active','inactive') NOT NULL,
  `type` varchar(20) NOT NULL,
  `remarks2` varchar(60) NOT NULL,
  `is_category` enum('yes','no') NOT NULL,
  `is_postingdate` enum('yes','no') NOT NULL,
  `is_author` enum('yes','no') NOT NULL,
  `is_image` enum('yes','no') NOT NULL,
  `is_title` enum('yes','no') NOT NULL,
  `is_content` enum('yes','no') NOT NULL,
  `is_tag` enum('yes','no') NOT NULL,
  `imagepath` varchar(60) NOT NULL,
  PRIMARY KEY (`moduleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`moduleCode`, `moduleName`, `moduleCaption`, `moduleStat`, `moduleGroup`, `menuOrder`, `remarks`, `stat`, `type`, `remarks2`, `is_category`, `is_postingdate`, `is_author`, `is_image`, `is_title`, `is_content`, `is_tag`, `imagepath`) VALUES
(1, 'login', 'Log In', 'system', 'login', 0, 'login', 'active', 'login', '', '', '', '', '', '', '', '', ''),
(2, 'users', 'Users', 'back', 'users', 10, 'users', 'active', 'users', 'users', '', '', '', '', '', '', '', 'users.png'),
(3, 'users', 'User Groups', 'back', 'users', 2, 'users', 'active', 'user_group', 'groups', '', '', '', '', '', '', '', 'users_groups.png'),
(4, 'logs', 'Admin Logs', 'back', 'logs', 6, 'logs', 'inactive', 'admin_logs', 'adminlogs', '', '', '', '', '', '', '', 'report_card.png'),
(5, 'dashboard', 'Dashboard', 'system', 'home', 0, '', 'active', 'home', '', '', '', '', '', '', '', '', ''),
(6, 'forgot', 'Forgot Password', 'system', 'profile', 6, 'forgot', 'active', 'forgot', '', '', '', '', '', '', '', '', ''),
(7, 'profile', 'User Profile', 'system', 'profile', 7, 'profile', 'active', 'profile', '', '', '', '', '', '', '', '', ''),
(8, 'profile', 'Profile Information', 'system', 'profile', 8, 'info', 'active', 'info', '', '', '', '', '', '', '', '', ''),
(9, 'profile', 'Change Password', 'system', 'profile', 9, 'pass', 'active', 'pass', '', '', '', '', '', '', '', '', ''),
(10, 'item', 'Item', 'back', 'item', 1, 'profile', 'active', 'item', 'item', '', '', '', '', '', '', '', ''),
(11, 'process', 'Process', 'system', 'process', 2, 'process', 'active', 'process', '', '', '', '', '', '', '', '', ''),
(12, 'inventory', 'Inventory', 'system', 'inventory', 7, 'inventory', 'active', 'inventory', 'inventory', '', '', '', '', '', '', '', ''),
(13, 'machine', 'Machine', 'system', 'machine', 3, 'machine', 'active', 'machine', 'machine', '', '', '', '', '', '', '', ''),
(14, 'billofmaterials', 'Bill Of Materials', 'system', 'billofmaterials', 5, 'billofmaterials', 'active', 'billofmaterials', 'billofmaterials', '', '', '', '', '', '', '', ''),
(15, 'route', 'Item Process Route', 'system', 'route', 4, 'route', 'active', 'route', 'route', '', '', '', '', '', '', '', ''),
(16, 'location', 'Locations', 'system', 'location', 6, 'location', 'active', 'location', 'location', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `modules_tasks`
--

CREATE TABLE IF NOT EXISTS `modules_tasks` (
  `taskCode` int(12) NOT NULL,
  `moduleCode` int(12) NOT NULL,
  KEY `fk_taskCode` (`taskCode`),
  KEY `fk_moduleCode` (`moduleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules_tasks`
--

INSERT INTO `modules_tasks` (`taskCode`, `moduleCode`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(1, 10),
(2, 10),
(3, 10),
(4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE IF NOT EXISTS `process` (
  `processId` int(11) NOT NULL AUTO_INCREMENT,
  `processName` varchar(50) NOT NULL,
  `processCode` varchar(50) NOT NULL,
  `isManual` int(11) NOT NULL,
  `isMachine` int(11) NOT NULL,
  `isInspected` int(11) NOT NULL,
  `isSubcon` int(11) NOT NULL,
  `multiOut` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`processId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`processId`, `processName`, `processCode`, `isManual`, `isMachine`, `isInspected`, `isSubcon`, `multiOut`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'Cutting', 'CUT', 0, 1, 0, 0, 1, 0, 'superadmin', '2019-04-21 17:43:33', 'superadmin', '2019-05-07 01:52:21'),
(2, 'Manual Polish', 'MPOL', 1, 0, 0, 0, 0, 0, 'superadmin', '2019-04-21 17:48:57', 'superadmin', '2019-04-21 18:02:56'),
(3, 'Machine Polish', 'MAPOL', 0, 1, 0, 0, 0, 0, 'superadmin', '2019-05-04 18:20:26', '', '0000-00-00 00:00:00'),
(4, 'Inspection', 'INSP', 0, 0, 1, 0, 0, 0, 'superadmin', '2019-05-09 01:26:08', '', '0000-00-00 00:00:00'),
(5, 'CFG', 'CFG', 1, 0, 0, 0, 0, -1, 'superadmin', '2019-05-14 21:36:03', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE IF NOT EXISTS `reference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_id` int(10) unsigned DEFAULT NULL,
  `ref_name` varchar(100) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `remarks1` varchar(250) NOT NULL DEFAULT '',
  `remarks2` longtext,
  `remarks3` longtext,
  `remarks4` longtext,
  `remarks5` longtext,
  `publishedtime` time DEFAULT NULL,
  `publisheddate` date DEFAULT NULL,
  `publishedby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`,`remarks1`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`id`, `ref_id`, `ref_name`, `name`, `remarks1`, `remarks2`, `remarks3`, `remarks4`, `remarks5`, `publishedtime`, `publisheddate`, `publishedby`) VALUES
(1, NULL, 'main_charset', 'iso-8859-1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'main_title', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'main_author', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'main_description', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'main_keywords', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'apanel_charset', 'iso-8859-1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 'apanel_title', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'apanel_author', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'apanel_description', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'apanel_keywords', 'MES for Marble Products', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'display_items', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, 'display_items', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'display_items', '15', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, 'display_items', '20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, 'display_items', '25', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, 'display_items', '50', 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `routeId` int(11) NOT NULL AUTO_INCREMENT,
  `routeName` varchar(50) NOT NULL,
  `routeCode` varchar(50) NOT NULL,
  `itemId` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`routeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`routeId`, `routeName`, `routeCode`, `itemId`, `revision`, `statusId`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`) VALUES
(1, 'CUT-POLISH', 'CUTPOL', 1, 0, -1, 'superadmin', '2019-05-05 00:24:04', '', '0000-00-00 00:00:00'),
(2, 'CUT-POLISH', 'CUTPOL', 1, 1, 28, 'superadmin', '2019-05-05 10:49:11', 'superadmin', '2019-05-05 10:49:11'),
(3, 'CUT-POLISH', 'CUTPOL', 1, 2, 28, 'superadmin', '2019-05-05 11:07:57', 'superadmin', '2019-05-05 11:07:57'),
(4, 'CUT-POLISH', 'CUTPOL', 1, 3, 28, 'superadmin', '2019-05-05 11:14:32', 'superadmin', '2019-05-05 11:14:32'),
(5, 'CUT-POLISH', 'CUTPOL', 1, 4, 0, 'superadmin', '2019-05-05 11:15:50', 'superadmin', '2019-05-05 11:15:50'),
(6, 'Cutting-Inspection-Polish', 'CUT-INSP-POL', 5, 1, 0, 'superadmin', '2019-05-09 01:27:24', 'superadmin', '2019-05-09 01:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `routedetails`
--

CREATE TABLE IF NOT EXISTS `routedetails` (
  `routeDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `routeId` int(11) NOT NULL,
  `processId` int(11) NOT NULL,
  PRIMARY KEY (`routeDetailsId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `routedetails`
--

INSERT INTO `routedetails` (`routeDetailsId`, `routeId`, `processId`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 2, 3),
(5, 2, 1),
(6, 3, 1),
(7, 3, 3),
(8, 4, 1),
(9, 4, 3),
(10, 5, 1),
(11, 5, 3),
(12, 6, 1),
(13, 6, 4),
(14, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusId`, `name`, `color`, `type`) VALUES
(29, 'Active', '00FF00', 'all'),
(28, 'Archived', '525252', 'all'),
(-1, 'deleted', 'CCFFCC', 'all'),
(27, 'Cancelled', 'FF0000', 'lot'),
(26, 'Completed', '00FF00', 'lot'),
(25, 'Scrap', 'FF0000', 'lot'),
(24, 'On Hold', 'EF7C09', 'lot'),
(1, 'In Process', 'EFDC09', 'lot'),
(23, 'New', '0000FF', 'lot');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `taskCode` int(12) NOT NULL,
  `taskName` varchar(20) NOT NULL,
  PRIMARY KEY (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`taskCode`, `taskName`) VALUES
(1, 'list'),
(2, 'create'),
(3, 'update'),
(4, 'delete'),
(5, 'approve'),
(6, 'dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `unitId` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(255) NOT NULL,
  `unitCode` varchar(255) NOT NULL,
  PRIMARY KEY (`unitId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unitId`, `unitName`, `unitCode`) VALUES
(1, 'Piece(s)', 'pc(s)'),
(2, 'Gram(s)', 'g(s)'),
(3, 'Unit(s)', 'unit(s)'),
(4, 'Kilogram(s)', 'kg(s)'),
(5, 'Set(s)', 'set(s)'),
(6, 'Pounds', 'lbs'),
(7, 'Liters', 'L'),
(8, 'Milimeter', 'mm'),
(9, 'Meter', 'm'),
(10, 'Mililiter', 'ml');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `groupCode` varchar(12) NOT NULL,
  `isLogin` varchar(10) NOT NULL,
  `lastLogin` datetime NOT NULL,
  `userAgent` varchar(20) NOT NULL,
  `systemStatus` enum('active','inactive','deleted') NOT NULL DEFAULT 'inactive',
  `enteredBy` varchar(20) NOT NULL,
  `enteredDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateBy` varchar(20) NOT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateProgram` varchar(60) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_users_group_code` (`groupCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `firstName`, `middleName`, `lastName`, `groupCode`, `isLogin`, `lastLogin`, `userAgent`, `systemStatus`, `enteredBy`, `enteredDate`, `updateBy`, `updateDate`, `updateProgram`) VALUES
('Operator', 'e10adc3949ba59abbe56e057f20f883e', 'Operator', '', 'Operator', 'operator', '', '0000-00-00 00:00:00', '', 'active', 'superadmin', '2019-05-14 23:04:59', 'superadmin', '2019-05-14 22:51:44', ''),
('superadmin', 'e10adc3949ba59abbe56e057f20f883e', 'Super', 'Duper', 'Admin', 'admin', '', '2013-10-17 13:41:48', '', 'active', 'superadmin', '2013-10-17 13:41:48', 'superadmin', '2013-10-04 14:23:20', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_modules`
--
ALTER TABLE `group_modules`
  ADD CONSTRAINT `group_modules_ibfk_4` FOREIGN KEY (`moduleCode`) REFERENCES `modules` (`moduleCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `group_modules_ibfk_5` FOREIGN KEY (`groupCode`) REFERENCES `groups` (`groupCode`) ON UPDATE CASCADE;

--
-- Constraints for table `group_modules_tasks`
--
ALTER TABLE `group_modules_tasks`
  ADD CONSTRAINT `group_modules_tasks_ibfk_10` FOREIGN KEY (`groupCode`) REFERENCES `groups` (`groupCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `group_modules_tasks_ibfk_8` FOREIGN KEY (`taskCode`) REFERENCES `tasks` (`taskCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `group_modules_tasks_ibfk_9` FOREIGN KEY (`moduleCode`) REFERENCES `modules` (`moduleCode`) ON UPDATE CASCADE;

--
-- Constraints for table `modules_tasks`
--
ALTER TABLE `modules_tasks`
  ADD CONSTRAINT `modules_tasks_ibfk_7` FOREIGN KEY (`taskCode`) REFERENCES `tasks` (`taskCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `modules_tasks_ibfk_8` FOREIGN KEY (`moduleCode`) REFERENCES `modules` (`moduleCode`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`groupCode`) REFERENCES `groups` (`groupCode`) ON UPDATE CASCADE;
