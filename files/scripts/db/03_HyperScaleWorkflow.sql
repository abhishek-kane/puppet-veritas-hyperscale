SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Table structure for table `hyperscale_workflow`
--
USE `HyperScale`;

DROP TABLE IF EXISTS `hyperscale_workflow`;

CREATE TABLE `hyperscale_workflow` (
  `id` varchar(38) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `object_id` varchar(38) NOT NULL DEFAULT '',
  `object_type` varchar(36) NOT NULL DEFAULT '',
  `action` varchar(255) DEFAULT NULL,
  `context` mediumtext,
  `status` varchar(32) DEFAULT 'pending',
  `error_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `hyperscale_workflow_step`
--

DROP TABLE IF EXISTS `hyperscale_workflow_step`;

CREATE TABLE `hyperscale_workflow_step` (
  `wf_id` varchar(38) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `object_id` varchar(38) NOT NULL DEFAULT '',
  `object_type` varchar(36) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `in_context` mediumtext,
  `out_context` mediumtext,
  `status` varchar(32) DEFAULT 'pending',
  `error_code` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL AUTO_INCREMENT,
  `target_vsa` varchar(128) NOT NULL DEFAULT '',
  `target_host` varchar(255) DEFAULT NULL,
  PRIMARY KEY(`wf_id`, `object_id`, `action`, `target_vsa`),
  UNIQUE KEY (`order`),
  CONSTRAINT `wf_id_fkey` FOREIGN KEY (`wf_id`) REFERENCES `hyperscale_workflow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_wf_serializer`
--

DROP TABLE IF EXISTS `hyperscale_wf_serializer`;

CREATE TABLE `hyperscale_wf_serializer` (
  `wf_id` varchar(38) NOT NULL,
  `parent_id` varchar(38) NOT NULL,
  `status` varchar(32) DEFAULT 'pending',
  `owner` varchar(38) DEFAULT NULL,
  `type` varchar(38) DEFAULT NULL,
  `sig` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`wf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

