/*
 *  $Copyright: Copyright (c) 2017 Veritas Technologies LLC.
 *  All rights reserved.
 *
 *  THIS SOFTWARE CONTAINS CONFIDENTIAL INFORMATION AND TRADE SECRETS OF
 *  VERITAS TECHNOLOGIES LLC.  USE, DISCLOSURE OR REPRODUCTION IS PROHIBITED
 *  WITHOUT THE PRIOR EXPRESS WRITTEN PERMISSION OF VERITAS TECHNOLOGIES LLC.
 *
 *  The  Licensed  Software  and  Documentation  are  deemed  to be commercial
 *  computer  software  as  defined  in  FAR  12.212 and subject to restricted
 *  rights  as  defined in FAR Section 52.227-19 "Commercial Computer Software
 *  - Restricted  Rights"  and  DFARS 227.7202,  et seq.  "Commercial Computer
 *  Software  and  Commercial Computer Software Documentation," as applicable,
 *  and any successor regulations, whether delivered by Veritas as on premises
 *  or  hosted  services.  Any  use,  modification,  reproduction  release,
 *  performance,  display  or  disclosure  of  the  Licensed  Software  and
 *  Documentation by the U.S. Government shall be solely in accordance with
 *  the terms of this Agreement. IV49-6268-1575-44-15-5 $
 */
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `HyperScale`
--

-- --------------------------------------------------------

USE `HyperScale`;

--
-- Table structure for table `hyperscale_sites`
--

DROP TABLE IF EXISTS `hyperscale_sites`;

CREATE TABLE `hyperscale_sites` (
  `id` varchar(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_racks`
--

DROP TABLE IF EXISTS `hyperscale_racks`;

CREATE TABLE `hyperscale_racks` (
  `id` varchar(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `site_id` varchar(38) DEFAULT NULL,
  `description` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`name`,`site_id`),
  CONSTRAINT `hyperscale_racks_fk_1` FOREIGN KEY (`site_id`) REFERENCES `hyperscale_sites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_nodes`
--

DROP TABLE IF EXISTS `hyperscale_nodes`;

CREATE TABLE `hyperscale_nodes` (
  `hostid` varchar(64) NOT NULL,
  `hostname` varchar(255),
  `ip_address` varchar(16) DEFAULT NULL,
  `data_ip` varchar(16) DEFAULT NULL,
  `personality` varchar(32),
  `status` varchar(32) DEFAULT 'up',
  `total_size` double DEFAULT NULL,
  `free_size` double DEFAULT NULL,
  `hypervisor_id` varchar(38) DEFAULT NULL,
  `rack_id` varchar(38) DEFAULT NULL,
  `of_version` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`hostname`,`personality`),
  CONSTRAINT `hyperscale_nodes_fk_1` FOREIGN KEY (`rack_id`) REFERENCES `hyperscale_racks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_config_metadata`
--

CREATE TABLE IF NOT EXISTS `hyperscale_config_metadata` (
  `id` int(11) NOT NULL,
  `host_ip` varchar(16) NOT NULL,
  `host_id` varchar(38) NOT NULL COMMENT 'Host UUID',
  `personality` varchar(255) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_value` varchar(1024) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Indexes for table `hyperscale_config_metadata`
--
ALTER TABLE `hyperscale_config_metadata`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ip_persona_key` (`host_ip`,`personality`,`config_key`);


--
-- AUTO_INCREMENT for table `hyperscale_config_metadata`
--
ALTER TABLE `hyperscale_config_metadata`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;

--
-- Table structure for table `hyperscale_backups`
--

DROP TABLE IF EXISTS `hyperscale_backups`;

CREATE TABLE `hyperscale_backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_id` varchar(255) NOT NULL UNIQUE,
  `snapshot_id` varchar(36) NOT NULL,
  `object_id` varchar(36) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `object_json` text NOT NULL,
  `backup_time` int(11) DEFAULT NULL,
  `backup_size` BIGINT(20) DEFAULT NULL,
  `backup_status` varchar(255) DEFAULT NULL,
  `backup_type` varchar(16) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_restores`
--

DROP TABLE IF EXISTS `hyperscale_restores`;

CREATE TABLE `hyperscale_restores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restore_id` varchar(255) NOT NULL UNIQUE,
  `backup_id` varchar(255) NOT NULL,
  `object_id` varchar(36) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `object_json` text NOT NULL,
  `restore_time` int(11) DEFAULT NULL,
  `restore_size` BIGINT(20) DEFAULT NULL,
  `restore_status` varchar(255) DEFAULT NULL,
  `restore_type` varchar(255) DEFAULT NULL,
  `restore_from` varchar(16) DEFAULT NULL,
  `intent_json` varchar(65536) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_restore_metadata`
--

DROP TABLE IF EXISTS `hyperscale_restore_metadata`;

CREATE TABLE `hyperscale_restore_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restore_id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restore_id` (`restore_id`),
  CONSTRAINT `hyperscale_restore_metadata_restore_id_fkey` FOREIGN KEY (`restore_id`) REFERENCES `hyperscale_restores` (`restore_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_snapshots`
--

DROP TABLE IF EXISTS `hyperscale_snapshots`;

CREATE TABLE `hyperscale_snapshots` (
  `id` varchar(36) NOT NULL UNIQUE,
  `object_id` varchar(36) NOT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `snapshot_type` varchar(16) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_snapshot_metadata`
--

DROP TABLE IF EXISTS `hyperscale_snapshot_metadata`;

CREATE TABLE `hyperscale_snapshot_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snapshot_id` varchar(36) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(65536) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshot_id` (`snapshot_id`),
  CONSTRAINT `hyperscale_snapshot_metadata_snapshot_id_fkey` FOREIGN KEY (`snapshot_id`) REFERENCES `hyperscale_snapshots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_services`
--

DROP TABLE IF EXISTS `hyperscale_services`;

CREATE TABLE `hyperscale_services` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `report_count` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_backups`
--

DROP TABLE IF EXISTS `hyperscale_vendors`;

CREATE TABLE `hyperscale_vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_id` varchar(255) NOT NULL UNIQUE,
  `vendor_type` varchar(36) NOT NULL,
  `reg_status` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `vendor_path` varchar(255) DEFAULT NULL,
  `vendor_email` varchar(255) DEFAULT NULL,
  `vendor_server_name` varchar(255) NOT NULL,
  `vendor_hostname` varchar(255) NOT NULL,
  `vendor_register_url` varchar(255) DEFAULT NULL,
  `vendor_unregister_url` varchar(255) DEFAULT NULL,
  `vendor_server_port` int(11) NOT NULL,
  `vendor_server_protocol` varchar(36) NOT NULL,
  `vendor_auth_type` varchar(36) NOT NULL,
  `vendor_auth_key` varchar(255) NOT NULL,
  `vendor_auth_value` text NOT NULL,
  `vendor_logfile` varchar(255) DEFAULT NULL,
  `hyperscale_project_id` varchar(255) DEFAULT NULL,
  `hyperscale_user_id` varchar(64) DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_alerts_description`
--

DROP TABLE IF EXISTS `hyperscale_alerts_description`;

CREATE TABLE `hyperscale_alerts_description` (
  `topic` varchar(255),
  `alert_text` text NOT NULL,
  `severity` int,
  `recommended_action` text,
  PRIMARY KEY (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_alerts`
--

DROP TABLE IF EXISTS `hyperscale_alerts`;

CREATE TABLE `hyperscale_alerts` (
  `topic` varchar(255),
  `source_object_id` varchar(255),
  `time_stamp` datetime,
  `object_type` varchar(255) NOT NULL,
  `assoc_object_id` varchar(255) DEFAULT '',
  `alert_text` text NOT NULL,
  `originator` varchar(255),
  PRIMARY KEY (`topic`, `source_object_id`, `assoc_object_id`, `originator`),
  FOREIGN KEY (`topic`) REFERENCES `hyperscale_alerts_description` (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_policy`
--

DROP TABLE IF EXISTS `hyperscale_policy`;

CREATE TABLE `hyperscale_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(108) NOT NULL,
  `policy_type` varchar(48),
  `policy_status` varchar(48),
  `effective_date` varchar(48),
  `schedule` varchar(48),
  `frequency` varchar(48),
  `retention_level` varchar(48),
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `hyperscale_policy_regex`
--

DROP TABLE IF EXISTS `hyperscale_policy_regex`;

CREATE TABLE `hyperscale_policy_regex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(50) NOT NULL,
  `policy_regex` varchar(255) NOT NULL,
  `policy_status` varchar(36) DEFAULT 'assigned',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
