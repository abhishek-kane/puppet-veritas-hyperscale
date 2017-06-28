SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `HyperScale`
--

-- --------------------------------------------------------

USE `HyperScale`;

--
-- Table structure for table `hyperscale_stats_config`
--

DROP TABLE IF EXISTS `hyperscale_stats_config`;

CREATE TABLE `hyperscale_stats_config` (
      `meter` varchar(255) NOT NULL,
      `type` varchar(16) NOT NULL,
      `unit` varchar(255) NOT NULL,
      `xlabel` varchar(255) DEFAULT NULL,
      `ylabel` varchar(255) DEFAULT NULL,
      PRIMARY KEY (`meter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
