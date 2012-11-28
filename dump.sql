-- --------------------------------------------------------
-- Hôte                          :localhost
-- Server version                :5.5.8-log - MySQL Community Server (GPL)
-- Server OS                     :Win32
-- HeidiSQL Version              :7.0.0.4244
-- Création                      :2012-11-28 16:39:15
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table jobeet.affiliate
DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE IF NOT EXISTS `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_597AA5CFE7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jobeet.affiliate: ~0 rows (approximately)
DELETE FROM `affiliate`;
/*!40000 ALTER TABLE `affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate` ENABLE KEYS */;


-- Dumping structure for table jobeet.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`),
  UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jobeet.category: ~4 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `slug`) VALUES
	(1, 'Design', 'design'),
	(2, 'Programming', 'programming'),
	(3, 'Manager', 'manager'),
	(4, 'Administrator', 'administrator');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table jobeet.category_affiliate
DROP TABLE IF EXISTS `category_affiliate`;
CREATE TABLE IF NOT EXISTS `category_affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9E1A77FF12469DE2` (`category_id`),
  KEY `IDX_9E1A77FF9F12C49A` (`affiliate_id`),
  CONSTRAINT `FK_9E1A77FF12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_9E1A77FF9F12C49A` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jobeet.category_affiliate: ~0 rows (approximately)
DELETE FROM `category_affiliate`;
/*!40000 ALTER TABLE `category_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_affiliate` ENABLE KEYS */;


-- Dumping structure for table jobeet.job
DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `how_to_apply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FBD8E0F85F37A13B` (`token`),
  KEY `IDX_FBD8E0F812469DE2` (`category_id`),
  CONSTRAINT `FK_FBD8E0F812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jobeet.job: ~41 rows (approximately)
DELETE FROM `job`;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`id`, `category_id`, `type`, `company`, `logo`, `url`, `position`, `location`, `description`, `how_to_apply`, `token`, `is_public`, `is_activated`, `email`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 2, 'full-time', 'Company 100', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_100', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(2, 2, 'full-time', 'Company 101', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_101', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(3, 2, 'full-time', 'Company 102', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_102', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(4, 2, 'full-time', 'Company 103', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_103', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(5, 2, 'full-time', 'Company 104', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_104', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(6, 2, 'full-time', 'Company 105', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_105', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(7, 2, 'full-time', 'Company 106', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_106', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(8, 2, 'full-time', 'Company 107', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_107', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(9, 2, 'full-time', 'Company 108', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_108', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(10, 2, 'full-time', 'Company 109', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_109', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(11, 2, 'full-time', 'Company 110', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_110', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(12, 2, 'full-time', 'Company 111', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_111', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(13, 2, 'full-time', 'Company 112', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_112', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(14, 2, 'full-time', 'Company 113', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_113', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(15, 2, 'full-time', 'Company 114', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_114', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(16, 2, 'full-time', 'Company 115', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_115', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(17, 2, 'full-time', 'Company 116', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_116', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(18, 2, 'full-time', 'Company 117', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_117', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(19, 2, 'full-time', 'Company 118', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_118', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(20, 2, 'full-time', 'Company 119', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_119', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(21, 2, 'full-time', 'Company 120', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_120', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(22, 2, 'full-time', 'Company 121', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_121', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(23, 2, 'full-time', 'Company 122', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_122', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(24, 2, 'full-time', 'Company 123', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_123', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(25, 2, 'full-time', 'Company 124', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_124', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(26, 2, 'full-time', 'Company 125', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_125', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(27, 2, 'full-time', 'Company 126', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_126', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(28, 2, 'full-time', 'Company 127', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_127', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(29, 2, 'full-time', 'Company 128', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_128', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(30, 2, 'full-time', 'Company 129', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_129', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(31, 2, 'full-time', 'Company 130', NULL, NULL, 'Web Developer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_130', 1, 1, 'job@example.com', '2012-12-27 15:54:31', '2012-11-27 15:54:31', NULL),
	(32, 2, 'full-time', 'Sensio Labs', 'sensio-labs.gif', 'http://www.sensiolabs.com/', 'Web Developer', 'Paris, France', 'You\'ve already developed websites with symfony and you want to work with Open-Source technologies. You have a minimum of 3 years experience in web development with PHP or Java and you wish to participate to development of Web 2.0 sites using the best frameworks available.', 'Send your resume to fabien.potencier [at] sensio.com', 'job_sensio_labs', 1, 1, 'job@example.com', '2012-12-10 00:00:00', '2012-11-27 15:54:31', NULL),
	(33, 1, 'part-time', 'Extreme Sensio', 'extreme-sensio.gif', 'http://www.extreme-sensio.com/', 'Web Designer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.', 'Send your resume to fabien.potencier [at] sensio.com', 'job_extreme_sensio', 1, 1, 'job@example.com', '2012-12-10 00:00:00', '2012-11-27 15:54:31', NULL),
	(34, 2, 'full-time', 'Sensio Labs', 'sensio-labs.gif', 'http://www.sensiolabs.com/', 'Web Developer Expired', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', 'job_expired', 1, 1, 'job@example.com', '2005-12-31 00:00:00', '2005-12-01 00:00:00', NULL),
	(35, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensiolabs.com/', 'Web Designer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'Send your resume to lorem.ipsum [at] dolor.sit', '3c58f1f404e4864d26c59e517df70dd34d6521b9', 1, NULL, 'job@example.com', '2012-12-28 09:43:41', '2012-11-28 09:43:41', NULL),
	(36, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO1', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', '38401f1908b6c1d503dbf7592efda9fec7ccb5e9', 0, 1, 'for.a.job@example.com', '2012-12-28 09:36:18', '2012-11-28 09:36:18', '2012-11-28 09:36:20'),
	(37, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO1', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', '765749f4e82474ab7f3aa6b26441c116ad5902d3', 0, 1, 'for.a.job@example.com', '2012-12-28 09:37:16', '2012-11-28 09:37:16', '2012-11-28 09:37:18'),
	(39, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO1', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', 'd0c86ce31ebad1b783c324d9d9b4fc2c59d174f5', 0, 1, 'for.a.job@example.com', '2012-12-28 09:40:07', '2012-11-28 09:40:07', '2012-11-28 09:40:09'),
	(41, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO1', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', '87bce1b1ea679205be4b12857b50437b148e4b68', 0, 1, 'for.a.job@example.com', '2012-12-28 09:46:12', '2012-11-28 09:46:12', '2012-11-28 09:46:15'),
	(43, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO4', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', 'edf960639e8697f3f66562eb0c721faa71a96a6b', 0, 1, 'for.a.job@example.com', '2012-12-28 09:46:23', '2012-11-28 09:46:23', '2012-11-28 09:46:25'),
	(44, 1, 'full-time', 'Sensio Labs', NULL, 'http://www.sensio.com/', 'FOO5', 'Atlanta, USA', 'You will work with symfony to develop websites for our customers.', 'Send me an email', '889b2048ed4d2be2a9862e99a7c646d7088effd0', 0, 1, 'for.a.job@example.com', '2012-12-28 09:46:34', '2012-11-28 09:46:29', '2012-11-28 09:46:34');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;


-- Dumping structure for table jobeet.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table jobeet.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`) VALUES
	(1, 'admin', 'nhDr7OyKlXQju+Ge/WKGrPQ9lPBSUFfpK+B1xqx/+8zLZqRNX0+5G1zBQklXUFy86lCpkAofsExlXiorUcKSNQ==');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
