-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.1.33-community - MySQL Community Server (GPL)
-- OS Server:                    Win32
-- HeidiSQL Versi:               9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ojs.access_keys
CREATE TABLE IF NOT EXISTS `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.access_keys: ~0 rows (approximately)
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;


-- Dumping structure for table ojs.announcements
CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.announcements: ~0 rows (approximately)
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;


-- Dumping structure for table ojs.announcement_settings
CREATE TABLE IF NOT EXISTS `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.announcement_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.announcement_types
CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.announcement_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;


-- Dumping structure for table ojs.announcement_type_settings
CREATE TABLE IF NOT EXISTS `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.announcement_type_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.authors: ~0 rows (approximately)
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;


-- Dumping structure for table ojs.author_settings
CREATE TABLE IF NOT EXISTS `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.author_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.auth_sources
CREATE TABLE IF NOT EXISTS `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.auth_sources: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;


-- Dumping structure for table ojs.citations
CREATE TABLE IF NOT EXISTS `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `citation_state` bigint(20) NOT NULL,
  `raw_citation` text,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  `lock_id` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_assoc_seq` (`assoc_type`,`assoc_id`,`seq`),
  KEY `citations_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.citations: ~0 rows (approximately)
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;


-- Dumping structure for table ojs.citation_settings
CREATE TABLE IF NOT EXISTS `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.citation_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.completed_payments
CREATE TABLE IF NOT EXISTS `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.completed_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;


-- Dumping structure for table ojs.controlled_vocabs
CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.controlled_vocabs: ~9 rows (approximately)
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT IGNORE INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
	(9, 'interest', 0, 0),
	(4, 'mods34-genre-marcgt', 0, 0),
	(2, 'mods34-name-role-roleTerms-marcrelator', 0, 0),
	(1, 'mods34-name-types', 0, 0),
	(5, 'mods34-physicalDescription-form-marcform', 0, 0),
	(3, 'mods34-typeOfResource', 0, 0),
	(6, 'nlm30-publication-types', 0, 0),
	(8, 'openurl10-book-genres', 0, 0),
	(7, 'openurl10-journal-genres', 0, 0);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;


-- Dumping structure for table ojs.controlled_vocab_entries
CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.controlled_vocab_entries: ~45 rows (approximately)
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT IGNORE INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 1),
	(5, 2, 2),
	(6, 2, 3),
	(7, 2, 4),
	(8, 2, 5),
	(9, 2, 6),
	(10, 2, 7),
	(11, 3, 1),
	(12, 3, 2),
	(13, 3, 3),
	(14, 4, 1),
	(15, 4, 2),
	(16, 4, 3),
	(17, 4, 4),
	(18, 4, 5),
	(19, 4, 6),
	(20, 4, 7),
	(21, 4, 8),
	(22, 4, 9),
	(23, 4, 10),
	(24, 4, 11),
	(25, 4, 12),
	(26, 5, 1),
	(27, 5, 2),
	(28, 6, 1),
	(29, 6, 2),
	(30, 6, 3),
	(31, 6, 4),
	(32, 7, 1),
	(33, 7, 2),
	(34, 7, 3),
	(35, 7, 4),
	(36, 7, 5),
	(37, 7, 6),
	(38, 7, 7),
	(39, 8, 1),
	(40, 8, 2),
	(41, 8, 3),
	(42, 8, 4),
	(43, 8, 5),
	(44, 8, 6),
	(45, 8, 7);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;


-- Dumping structure for table ojs.controlled_vocab_entry_settings
CREATE TABLE IF NOT EXISTS `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.controlled_vocab_entry_settings: ~52 rows (approximately)
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT IGNORE INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(1, '', 'name', 'personal', 'string'),
	(2, '', 'name', 'corporate', 'string'),
	(3, '', 'name', 'conference', 'string'),
	(4, '', 'description', 'Author', 'string'),
	(4, '', 'name', 'aut', 'string'),
	(5, '', 'description', 'Contributor', 'string'),
	(5, '', 'name', 'ctb', 'string'),
	(6, '', 'description', 'Editor', 'string'),
	(6, '', 'name', 'edt', 'string'),
	(7, '', 'description', 'Illustrator', 'string'),
	(7, '', 'name', 'ill', 'string'),
	(8, '', 'description', 'Photographer', 'string'),
	(8, '', 'name', 'pht', 'string'),
	(9, '', 'description', 'Sponsor', 'string'),
	(9, '', 'name', 'spn', 'string'),
	(10, '', 'description', 'Translator', 'string'),
	(10, '', 'name', 'trl', 'string'),
	(11, '', 'name', 'multimedia', 'string'),
	(12, '', 'name', 'still image', 'string'),
	(13, '', 'name', 'text', 'string'),
	(14, '', 'name', 'article', 'string'),
	(15, '', 'name', 'book', 'string'),
	(16, '', 'name', 'conference publication', 'string'),
	(17, '', 'name', 'issue', 'string'),
	(18, '', 'name', 'journal', 'string'),
	(19, '', 'name', 'newspaper', 'string'),
	(20, '', 'name', 'picture', 'string'),
	(21, '', 'name', 'review', 'string'),
	(22, '', 'name', 'periodical', 'string'),
	(23, '', 'name', 'series', 'string'),
	(24, '', 'name', 'thesis', 'string'),
	(25, '', 'name', 'web site', 'string'),
	(26, '', 'name', 'electronic', 'string'),
	(27, '', 'name', 'print', 'string'),
	(28, '', 'name', 'journal', 'string'),
	(29, '', 'name', 'book', 'string'),
	(30, '', 'name', 'conf-proc', 'string'),
	(31, '', 'name', 'thesis', 'string'),
	(32, '', 'name', 'journal', 'string'),
	(33, '', 'name', 'issue', 'string'),
	(34, '', 'name', 'article', 'string'),
	(35, '', 'name', 'proceeding', 'string'),
	(36, '', 'name', 'conference', 'string'),
	(37, '', 'name', 'preprint', 'string'),
	(38, '', 'name', 'unknown', 'string'),
	(39, '', 'name', 'book', 'string'),
	(40, '', 'name', 'bookitem', 'string'),
	(41, '', 'name', 'proceeding', 'string'),
	(42, '', 'name', 'conference', 'string'),
	(43, '', 'name', 'report', 'string'),
	(44, '', 'name', 'document', 'string'),
	(45, '', 'name', 'unknown', 'string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.custom_issue_orders
CREATE TABLE IF NOT EXISTS `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.custom_issue_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;


-- Dumping structure for table ojs.custom_section_orders
CREATE TABLE IF NOT EXISTS `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.custom_section_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;


-- Dumping structure for table ojs.data_object_tombstones
CREATE TABLE IF NOT EXISTS `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.data_object_tombstones: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;


-- Dumping structure for table ojs.data_object_tombstone_oai_set_objects
CREATE TABLE IF NOT EXISTS `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.data_object_tombstone_oai_set_objects: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;


-- Dumping structure for table ojs.data_object_tombstone_settings
CREATE TABLE IF NOT EXISTS `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.data_object_tombstone_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.edit_decisions
CREATE TABLE IF NOT EXISTS `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.edit_decisions: ~0 rows (approximately)
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;


-- Dumping structure for table ojs.email_log
CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;


-- Dumping structure for table ojs.email_log_users
CREATE TABLE IF NOT EXISTS `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_log_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;


-- Dumping structure for table ojs.email_templates
CREATE TABLE IF NOT EXISTS `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_templates: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;


-- Dumping structure for table ojs.email_templates_data
CREATE TABLE IF NOT EXISTS `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_templates_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_templates_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_data` ENABLE KEYS */;


-- Dumping structure for table ojs.email_templates_default
CREATE TABLE IF NOT EXISTS `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_templates_default: ~58 rows (approximately)
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT IGNORE INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
	(1, 'NOTIFICATION', 0, 1, NULL, NULL),
	(2, 'NOTIFICATION_MAILLIST', 0, 1, NULL, NULL),
	(3, 'NOTIFICATION_MAILLIST_WELCOME', 0, 1, NULL, NULL),
	(4, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL),
	(5, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
	(6, 'PASSWORD_RESET', 0, 1, NULL, NULL),
	(7, 'USER_REGISTER', 0, 1, NULL, NULL),
	(8, 'USER_VALIDATE', 0, 1, NULL, NULL),
	(9, 'REVIEWER_REGISTER', 0, 1, NULL, NULL),
	(10, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL),
	(11, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL),
	(12, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL),
	(13, 'SUBMISSION_ACK', 1, 1, NULL, 65536),
	(14, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536),
	(15, 'SUBMISSION_UNSUITABLE', 1, 1, 512, 65536),
	(16, 'EDITOR_ASSIGN', 1, 1, 256, 512),
	(17, 'REVIEW_CANCEL', 1, 1, 512, 4096),
	(18, 'REVIEW_REQUEST', 1, 1, 512, 4096),
	(19, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 512, 4096),
	(20, 'REVIEW_REQUEST_ONECLICK', 1, 1, 512, 4096),
	(21, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 512, 4096),
	(22, 'REVIEW_REQUEST_ATTACHED', 0, 1, 512, 4096),
	(23, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 512, 4096),
	(24, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096),
	(25, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
	(26, 'REVIEW_CONFIRM', 1, 1, 4096, 512),
	(27, 'REVIEW_DECLINE', 1, 1, 4096, 512),
	(28, 'REVIEW_ACK', 1, 1, 512, 4096),
	(29, 'REVIEW_REMIND', 0, 1, 512, 4096),
	(30, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096),
	(31, 'REVIEW_REMIND_ONECLICK', 0, 1, 512, 4096),
	(32, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
	(33, 'EDITOR_DECISION_ACCEPT', 0, 1, 512, 65536),
	(34, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 17, 65536),
	(35, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 17, 65536),
	(36, 'EDITOR_DECISION_REVISIONS', 0, 1, 512, 65536),
	(37, 'EDITOR_DECISION_RESUBMIT', 0, 1, 512, 65536),
	(38, 'EDITOR_DECISION_DECLINE', 0, 1, 512, 65536),
	(39, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 512, 65536),
	(40, 'EDITOR_RECOMMENDATION', 0, 1, 17, 16),
	(41, 'COPYEDIT_REQUEST', 1, 1, 512, 8192),
	(42, 'LAYOUT_REQUEST', 1, 1, 512, 768),
	(43, 'LAYOUT_COMPLETE', 1, 1, 768, 512),
	(44, 'EMAIL_LINK', 0, 1, 1048576, NULL),
	(45, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576),
	(46, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576),
	(47, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576),
	(48, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576),
	(49, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576),
	(50, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152),
	(51, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152),
	(52, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152),
	(53, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152),
	(54, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL),
	(55, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 512),
	(56, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL),
	(57, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
	(58, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;


-- Dumping structure for table ojs.email_templates_default_data
CREATE TABLE IF NOT EXISTS `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.email_templates_default_data: ~77 rows (approximately)
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT IGNORE INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
	('CITATION_EDITOR_AUTHOR_QUERY', 'id_ID', 'Penyuntingan Sitiran', '{$authorFirstName},<br />\n<br />\nMohon verifikasi atau berikan sitasi yang benar untuk rujukan berikut dari artikel Anda, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nTerimakasih!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'Email ini memungkinkan copyeditor untuk meminta informasi tambahan tentang rujukan dari penulis.'),
	('COPYEDIT_REQUEST', 'id_ID', 'Permohonan Copyediting', '{$participantName}:<br />\n<br />\nKami meminta Anda melakukan copyediting terhadap &quot;{$submissionTitle}&quot; untuk {$contextName} mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Buka semua file yang ada di file Draft dan lakukan copyediting, tambahkan Diskusi Copyediting sesuai kebutuhan.<br />\n3. Simpan file yang telah di-copyedit, dan unggah ke panel Sudah Copyedit.<br />\n4. Beritahu Editor bahwa semua file telah siap, dan bahwa proses Produksi dapat dimulai.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$participantUsername}<br />\n<br />\n{$editorialContactSignature}', 'Email ini dari Editor Bagian ke Copyeditor naskah agar memulai proses copyediting.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),
	('EDITOR_ASSIGN', 'id_ID', 'Penugasan Editorial', '{$editorialContactName}:<br />\n<br />\nNaskah, &quot;{$submissionTitle},&quot; di {$contextName} telah ditugaskan kepada Anda sebagai Editor Bagian untuk memastikan selesainya seluruh proses editorial.<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$editorUsername}<br />\n<br />\nTerimakasih,<br />\n{$editorialContactSignature}', 'Email ini memberitahu Editor Bagian bahwa Editor telah memberikan tugas untuk mengawasi suatu naskah dalam menyelesaikan proses editorial. Email ini memberikan informasi mengenai naskah dan cara mengaksesnya di website jurnal.'),
	('EDITOR_DECISION_ACCEPT', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Diterima<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final "Naskah Diterima".'),
	('EDITOR_DECISION_DECLINE', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Ditolak<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final "Naskah Ditolak".'),
	('EDITOR_DECISION_RESUBMIT', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Kirim Ulang untuk Review<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa Penulis perlu mengirim ulang naskahnya.'),
	('EDITOR_DECISION_REVISIONS', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Perlu Revisi<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final "Perlu Revisi".'),
	('EDITOR_DECISION_SEND_TO_EXTERNAL', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Dikirimkan ke Reviewer Eksternal<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirimkan ke reviewer eksternal.'),
	('EDITOR_DECISION_SEND_TO_PRODUCTION', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nProses editing naskah Anda, &quot;{$submissionTitle},&quot; telah selesai.  Kami sekarang mengirimkannya ke produksi.<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirim ke produksi.'),
	('EMAIL_LINK', 'id_ID', 'Artikel Menarik', 'Anda mungkin tertarik dengan &quot;{$submissionTitle}&quot; oleh {$authorName} diterbitkan di Vol {$volume}, No {$number} ({$year}) {$contextName} yang tersedia di &quot;{$articleUrl}&quot;.', 'Template email ini memungkinkan pembaca terdaftar mengirimkan informasi tentang suatu artikel kepada seseorang yang mungkin akan tertarik. Email ini tersedia di Alat Baca dan harus diaktifkan oleh Manajer Jurnal di halaman Administrasi Alat Baca.'),
	('LAYOUT_COMPLETE', 'id_ID', 'Galley Selesai', '{$editorialContactName}:<br />\n<br />\nGalley telah dipersiapkan bagi naskah, &quot;{$submissionTitle},&quot; di {$contextName} dan siap untuk proofreading.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$participantName}', 'Email from the Layout Editor kepada Editor Bagian memberitahukan bahwa proses layout telah selesai.'),
	('LAYOUT_REQUEST', 'id_ID', 'Permohonan Galley', '{$participantName}:<br />\n<br />\nNaskah &quot;{$submissionTitle}&quot; di {$contextName} memerlukan pembuatan galley dengan mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Login ke jurnal dan gunakan file Siap Produksi untuk membuat galley sesuai standar jurnal.<br />\n3. Unggah galley ke bagian File Galley.<br />\n4. Beritahu Editor menggunakan Diskusi Produksi bahwa galley telah diunggah dan siap digunakan.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionLayoutUrl}<br />\nNama pengguna: {$participantUsername}<br />\n<br />\nJika Anda tidak dapat melakukan tugas ini saat ini atau mempunyai pertanyaan, silakan hubungi kami.  Terimakasih atas kontribusi Anda ke jurnal ini.<br />\n<br />\n{$editorialContactSignature}', 'Email dari Editor Bagian kepada Layout Editor memberitahukan bahwa mereka telah ditugaskan untuk melakukan layout editing terhadap suatu naskah.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),
	('LOCKSS_EXISTING_ARCHIVE', 'id_ID', 'Permohonan Pengarsipan untuk {$contextName}', 'Yang terhormat [Pustakawan Universitas]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nURL Publisher Manifest LOCKSS jurnal kami adalah: {$contextUrl}/gateway/lockss<br />\n<br />\nKami memahami bahwa Anda telah bergabung dengan LOCKSS. Jika kami perlu memberikan metadata tambahan untuk mendaftarkan jurnal kami di versi LOCKSS Anda, dengan senang hati kami akan memberikannya.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini meminta penjaga arsip LOCKSS untuk mempertimbangkan memasukkan jurnal ini ke dalam arsip mereka. Email ini memberikan URL Publisher Manifest LOCKSS jurnal.'),
	('LOCKSS_NEW_ARCHIVE', 'id_ID', 'Permohonan Pengarsipan untuk {$contextName}', 'Yang terhormat [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nProgram LOCKSS &amp;lt;http://lockss.org/&amp;gt;, suatu gerakan perpustakaan/penerbit internasional, merupakan contoh nyata penyimpanan dan pengarsipan terdistribusi, detail tambahan dapat dilihat di bawah. Piranti lunak ini, yang berjalan di komputer biasa, merupakan piranti lunak yang gratis; sistemnya mudah di-online-kan; tidak membutuhkan banyak perawatan.<br />\n<br />\nUntuk membantu mengarsipkan jurnal kami, kami mengundang Anda untuk menjadi anggota komunitas LOCKSS, guna membantu mengumpulkan dan menyimpan judul-judul karya anggota fakultas Anda dan ilmuwan lainnya di seluruh dunia. Jika berkenan, silakan mengunjungi website LOCKSS untuk informasi mengenai bagaimana cara kerja sistem ini. Kami berharap Anda berkenan mendukung pengarsipan jurnal ini.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini mendorong penerima untuk berpartisipasi di gerakan LOCKSS dan memasukkan jurnal ini dalam arsip. Email ini memberikan informasi tentang gerakan LOCKSS dan cara untuk bergabung.'),
	('MANUAL_PAYMENT_NOTIFICATION', 'id_ID', ' Pemberitahuan Pembayaran Manual ', ' Pembayaran manual harus diproses untuk jurnal dan {$contextName} pengguna {$userFullName} (nama pengguna &quot;{$userName}&quot;).<br />\nThe item being paid for &quot;{$itemName}&quot;. <br />\nBiaya adalah {$itemCost} ({$itemCurrencyCode}). <br />\nSurat elektronik ini dibuat oleh plugin pembayaran manual IOJS.', ' Email ini digunakan untuk memberitahukan kontak manajer jurnal bahwa pembayaran manual dibutuhkan.'),
	('NOTIFICATION', 'id_ID', 'Notifikasi baru dari {$siteTitle}', 'Anda memperoleh satu notifikasi baru dari {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nTautan: {$url}<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna terdaftar yang memilih untuk memperoleh jenis notifikasi ini dikirimkan melalui email.'),
	('NOTIFICATION_CENTER_DEFAULT', 'id_ID', 'Pesan terkait {$contextName}', 'Silakan tuliskan pesan Anda.', 'Pesan default (kosong) yang digunakan di Pengelola Pesan Pusat Notifikasi.'),
	('NOTIFICATION_MAILLIST', 'id_ID', 'Notifikasi baru dari {$siteTitle}', 'Anda memperoleh satu notifikasi baru dari {$siteTitle}:<br />\n--<br />\n{$notificationContents}<br />\n<br />\nTautan: {$url}<br />\n--<br />\n<br />\nJika Anda ingin berhenti menerima email notifikasi, silakan klik {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna tidak terdaftar pada mailing list notifikasi.'),
	('NOTIFICATION_MAILLIST_WELCOME', 'id_ID', 'Selamat datang di mailing list {$siteTitle}!', 'Anda telah mendaftar untuk menerima notifikasi dari {$siteTitle}.<br />\n<br />\nSilakan klik tautan berikut untuk mengkonfirmasi dan menambahkan alamat email Anda ke mailing list: {$confirmLink}<br />\n<br />\nJika Anda ingin berhenti menerima email notifikasi, silakan klik {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna tidak terdaftar yang baru saja mendaftarkan diri ke mailing list.'),
	('OPEN_ACCESS_NOTIFY', 'id_ID', 'Terbitan Sudah Open Access', 'Readers:<br />\n<br />\n{$contextName} telah menjadikan terbitan berikut Open Access. Kami mengundang Anda untuk menelaah Daftar Isi berikut dan mengunjungi website kami ({$contextUrl}) untuk membaca artikel dan item yang Anda minati.<br />\n<br />\nTerimakasih atas perhatiannya,<br />\n{$editorialContactSignature}', 'Email ini dikirimkan ke pembaca terdaftar yang meminta untuk dikirimkan email pemberitahuan saat suatu terbitan menjadi Open Access.'),
	('PASSWORD_RESET', 'id_ID', 'Reset Sandi', 'Sandi akun Anda di website {$siteTitle} telah berhasil di-reset. Silakan simpan nama pengguna dan sandi ini karena akan dibutuhkan untuk semua kegiatan terkait jurnal di website ini.<br />\n<br />\nNama pengguna Anda: {$username}<br />\nSandi: {$password}<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna terdaftar saat proses reset password berhasil sesuai prosedur di email PASSWORD_RESET_CONFIRM.'),
	('PASSWORD_RESET_CONFIRM', 'id_ID', 'Konfirmasi Reset Sandi', 'Kami menerima permintaan reset sandi untuk akun Anda di website {$siteTitle}.<br />\n<br />\nJika Anda tidak merasa mengajukan permintaan ini, abaikan pesan ini dan sandi Anda tidak akan diubah.  Jika Anda memang ingin melakukan reset sandi, klik tautan berikut ini.<br />\n<br />\nReset sandi saya: {$url}<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna terdaftar ketika lupa sandi atau tidak dapat login. Email ini memberikan URL untuk melakukan reset sandi.'),
	('PAYPAL_INVESTIGATE_PAYMENT', 'id_ID', ' Kegiatan pembayaran paypal yang tidak biasa ', ' IOJS telah menemukan kegiatan yang tidak biasa yang berhubungan dengan bantuan pembayaran paypal untuk jurnal {$contextName}. Kegiatan ini mungkin dibutuhkan investigasi yang lebih lanjut atau intervensi manual. Emai ini diciptakan oleh OJS PayPal plugin.<br />\nInformasi posting penuh untuk permohonan:<br />\n{$postInfo}<br />\nInformasi tambahan (jika tersedia):<br />\n{$additionalInfo}<br />\nVariasi Server :<br />\n{$serverVars}<br />\n', ' Email ini digunakan untuk memberitahukan jurnal kontak utama yang mempunyai kegiatan yang mencurigakan atau kegiatan yang membutuhkan intervensi manual yang ditemukan oleh plugin paypal.'),
	('PUBLISH_NOTIFY', 'id_ID', 'Terbitan Baru', 'Readers:<br />\n<br />\n{$contextName} baru saja menerbitkan terbitan terbarunya di {$contextUrl}. Kami mengundang Anda untuk membaca Daftar Isi dan selanjutnya mengunjungi website kami untuk membaca artikel yang Anda minati.<br />\n<br />\nTerimakasih atas perhatian Anda,<br />\n{$editorialContactSignature}', 'Email ini dikirimkan ke pembaca terdaftar melalui tautan "Beritahu Pengguna" di Beranda Pengguna Editor. Email ini memberitahu pembaca tentang terbitan baru dan mengundang pembaca untuk mengunjungi jurnal melalui URL yang diberikan.'),
	('REVIEWER_REGISTER', 'id_ID', 'Registrasi sebagai Reviewer di {$contextName}', 'Dengan mempertimbangkan keahlian Anda, kami memasukkan nama Anda dalam database reviewer di {$contextName}. Hal ini tidak bersifat mengikat, hanya sekedar memudahkan kami untuk mengundang Anda untuk melakukan review terhadap suatu naskah. Ketika memperoleh undangan untuk melakukan review suatu naskah, Anda dapat melihat judul dan abstrak naskah tersebut, dan Anda berhak menentukan apakah akan menerima atau menolak undangan tersebut. Anda juga dapat meminta dihapus dari daftar reviewer kapan saja Anda menghendaki.<br />\n<br />\nKami menyertakan nama pengguna dan sandi Anda, yang digunakan dalam semua interaksi dengan jurnal melalui website. Anda dapat melakukan update profil, termasuk minat review Anda.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke reviewer baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),
	('REVIEW_ACK', 'id_ID', 'Ucapan Terimakasih atas Review Artikel', '{$reviewerName}:<br />\n<br />\nTerimakasih telah menyelesaikan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami sangat menghargai kontribusi Anda terhadap kualitas karya yang kami publikasikan.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian untuk mengkonfirmasi penerimaan review dan mengucapkan terimakasih atas kontribusinya.'),
	('REVIEW_CANCEL', 'id_ID', 'Permohonan Review Dibatalkan', '{$reviewerName}:<br />\n<br />\nKami memutuskan untuk membatalkan permohonan review kami kepada Anda untuk naskah, &quot;{$submissionTitle},&quot; di {$contextName}. Kami mohon maaf sebesar-besarnya untuk ketidaknyamanan ini dan kami harap di masa mendatang Anda dapat membantu proses review di jurnal ini.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian kepada Reviewer yang sedang melakukan review untuk memberitahukan pembatalan review.'),
	('REVIEW_CONFIRM', 'id_ID', 'Dapat Melakukan Review', 'Editor:<br />\n<br />\nSaya dapat dan bersedia melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakan kepada saya, dan saya berencana untuk menyelesaikan review ini sesuai tenggat, {$reviewDueDate}, atau sebelumnya.<br />\n<br />\n{$reviewerName}', 'Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review diterima dan akan diselesaikan pada tanggal yang ditetapkan.'),
	('REVIEW_DECLINE', 'id_ID', 'Tidak Dapat Melakukan Review', 'Editor:<br />\n<br />\nMohon maaf saat ini saya tidak dapat melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakann kepada saya, dan lain waktu silakan menghubungi saya lagi.<br />\n<br />\n{$reviewerName}', 'Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review ditolak.'),
	('REVIEW_REMIND', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),
	('REVIEW_REMIND_AUTO', 'id_ID', 'Pengingat Otomatis Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. Kami masih tetap menanti review tersebut segera setelah Anda dapat menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
	('REVIEW_REMIND_AUTO_ONECLICK', 'id_ID', 'Pengingat Review Naskah Otomatis', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. We were hoping to have this review by {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website)'),
	('REVIEW_REMIND_ONECLICK', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),
	('REVIEW_REQUEST', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat di REVIEW_REQUEST_ATTACHED.)'),
	('REVIEW_REQUEST_ATTACHED', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; dan kami mengharapkan Anda berkenan melakukan review. Panduan Review untuk jurnal ini disertakan di bawah, dan naskah telah dilampirkan bersama email ini. Review beserta rekomendasi Anda, kami harap telah diemailkan sebelum tenggat review {$reviewDueDate}.<br />\n<br />\nMohon sampaikan dalam email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST.)'),
	('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nPanduan Review untuk jurnal ini disertakan di bawah, dan naskah dilampirkan bersama email ini. Review dan rekomendasi Anda, mohon dapat diemailkan ke kami pada {$reviewDueDate}.<br />\n<br />\nMohon sampaikan di email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya.  Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_SUBSEQUENT.)'),
	('REVIEW_REQUEST_ONECLICK', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer  untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),
	('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda.<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),
	('REVIEW_REQUEST_REMIND_AUTO', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut.\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dikirim otomatis saat tenggat konfirmasi terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer dinonaktifkan. Scheduled tasks must be enabled and configured (see the site configuration file).'),
	('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. \n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dikirim otomatis saat tenggat konfirmasi reviewer terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas Terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website).'),
	('REVIEW_REQUEST_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
	('REVISED_VERSION_NOTIFY', 'id_ID', 'Versi Revisi telah Diunggah', '{$editorialContactName}:<br />\n<br />\nVersi revisi dari &quot;{$submissionTitle}&quot; telah diunggah oleh penulis {$authorName}.<br />\n<br />\nURL naskah: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirim secara otomatis ke editor yang ditugaskan saat penulis mengunggah naskah versi revisi.'),
	('SUBMISSION_ACK', 'id_ID', 'Ucapan Terimakasih atas Penyerahan Naskah', '{$authorName}:<br />\n<br />\nTerimakasih telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. Dengan sistem manajemenn jurnal online yang kami gunakan, Anda dapat memantau kemajuan proses editorial naskah Anda melalui:<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$authorUsername}<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}', 'Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini memberikan informasi mengenai pemantauan kemajuan proses editorial dan mengucapkan terimakasih atas naskah yang dikirimkan.'),
	('SUBMISSION_ACK_NOT_USER', 'id_ID', 'Pemberitahuan Penyerahan Naskah', 'Hello,<br />\n<br />\n{$submitterName} telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. <br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}', 'Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini memberikan informasi mengenai pemantauan kemajuan proses editorial dan mengucapkan terimakasih atas naskah yang dikirimkan.'),
	('SUBMISSION_UNSUITABLE', 'id_ID', 'Naskah Tidak Sesuai', '{$authorName}:<br />\n<br />\nReview awal dari &quot;{$submissionTitle}&quot; menunjukkan bahwa naskah ini tidak sesuai dengan lingkup dan fokus dari {$contextName}. Kami merekomendasikan Anda untuk mempelajari deskripsi jurnal ini di menu Tentang Jurnal, beserta isi terbitan, untuk mengetahui lebih jauh karya yang kami terbitkan. Anda juga dapat mempertimbangkan untuk mengirimkan naskah ini ke jurnal lain yang lebih sesuai.<br />\n<br />\n{$editorialContactSignature}', NULL),
	('SUBSCRIPTION_AFTER_EXPIRY', 'id_ID', 'Langganan Berakhir', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
	('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'id_ID', 'Langganan Berakhir - Pengingat Terakhir', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\nIni adalah pengingat terakhir yang diemailkan kepada Anda.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
	('SUBSCRIPTION_BEFORE_EXPIRY', 'id_ID', 'Pemberitahuan Tanggal Berakhir Langganan', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda hampir berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk terus memperoleh akses ke jurnal ini, silakan kunjungi website jurnal dan perbaharui langganan Anda. Anda dapat login menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya hampir berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
	('SUBSCRIPTION_NOTIFY', 'id_ID', 'Pemberitahuan Langganan', '{$subscriberName}:<br />\n<br />\nAnda sekarang telah terdaftar sebagai pelanggan di sistem manajemen jurnal online kami, {$contextName}, dengan jenis langganan:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nUntuk mengakses konten yang hanya tersedia bagi pelanggan, silakan login ke sistem dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nSetelah login, Anda dapat mengubah detail profil Anda dan sandi Anda kapanpun Anda kehendaki.<br />\n<br />\nJika Anda memiliki langganan institusi, pengguna di institusi Anda tidak perlu login karena semua akses secara otomatis diotentikasi oleh sistem.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu pembaca terdaftar bahwa Manajer telah membuat akses langganan untuk mereka.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
	('SUBSCRIPTION_PURCHASE_INDL', 'id_ID', 'Pembelian Langganan: Individu', 'Sebuah langganan individu telah dibeli online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),
	('SUBSCRIPTION_PURCHASE_INSTL', 'id_ID', 'Pembelian Langganan: Institusi', 'Sebuah langganan institusi telah dibeli online untuk {$contextName} dengan rincian berikut. Untuk mengaktifkan langganan ini, silakan gunakan URL Langganan dan jadikan status langganan ke \'Aktif\'.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),
	('SUBSCRIPTION_RENEW_INDL', 'id_ID', 'Pembaharuan Langganan: Individu', 'Sebuah langganan individu telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),
	('SUBSCRIPTION_RENEW_INSTL', 'id_ID', 'Pembaharuan Langganan: Institusi', 'Sebuah langganan institusi telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),
	('USER_REGISTER', 'id_ID', 'Registrasi Jurnal', '{$userFullName}<br />\n<br />\nAnda sekarang telah terdaftar sebagai pengguna di {$contextName}.  Kami sertakan nama pengguna dan sandi Anda di email ini, keduanya diperlukan untuk semua kegiatan melalui website jurnal ini. Anda dapat keluar dari daftar pengguna jurnal kapan saja dengan menghubungi kami.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),
	('USER_VALIDATE', 'id_ID', 'Validasi Akun Anda', '{$userFullName}<br />\n<br />\nAnda telah membuat akun di {$contextName}.  Sebelum dapat menggunakannya, Anda perlu melakukan validasi akun email. Untuk melakukannya, klik tautan berikut ini:<br />\n<br />\n{$activateUrl}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirim ke pengguna baru agar melakukan validasi email yang mereka gunakan untuk registrasi.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;


-- Dumping structure for table ojs.event_log
CREATE TABLE IF NOT EXISTS `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.event_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;


-- Dumping structure for table ojs.event_log_settings
CREATE TABLE IF NOT EXISTS `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.event_log_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.filters
CREATE TABLE IF NOT EXISTS `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.filters: ~52 rows (approximately)
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT IGNORE INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
	(1, 1, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
	(2, 2, 0, 'MODS 3.4', 'lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter', 0, 0, 0),
	(3, 3, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
	(4, 4, 0, 'Inject metadata into a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
	(5, 5, 0, 'Extract metadata from a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
	(6, 6, 0, 'Inject metadata into a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
	(7, 10, 0, 'NLM 3.0 XML Citation Output', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 0, 0, 0),
	(8, 11, 0, 'NLM Journal Publishing V3.0 ref-list', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 0, 0),
	(9, 12, 0, 'NLM Journal Publishing V2.3 ref-list', 'lib.pkp.classes.filter.GenericSequencerFilter', 0, 0, 0),
	(10, 11, 0, 'NLM 2.3: NLM 3.0', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 9, 1),
	(11, 13, 0, 'NLM 2.3: NLM 3.0 to 2.3', 'lib.pkp.classes.xslt.XSLTransformationFilter', 0, 9, 2),
	(12, 8, 0, 'CrossRef', 'lib.pkp.plugins.citationLookup.crossref.filter.CrossrefNlm30CitationSchemaFilter', 1, 0, 0),
	(13, 8, 0, 'ISBNdb', 'lib.pkp.classes.filter.GenericSequencerFilter', 1, 0, 0),
	(14, 15, 0, 'ISBNdb (from NLM)', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbNlm30CitationSchemaIsbnFilter', 0, 13, 1),
	(15, 16, 0, 'ISBNdb', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbIsbnNlm30CitationSchemaFilter', 0, 13, 2),
	(16, 8, 0, 'PubMed', 'lib.pkp.plugins.citationLookup.pubmed.filter.PubmedNlm30CitationSchemaFilter', 1, 0, 0),
	(17, 8, 0, 'WorldCat', 'lib.pkp.plugins.citationLookup.worldcat.filter.WorldcatNlm30CitationSchemaFilter', 1, 0, 0),
	(18, 7, 0, 'FreeCite', 'lib.pkp.plugins.citationParser.freecite.filter.FreeciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
	(19, 7, 0, 'ParaCite', 'lib.pkp.plugins.citationParser.paracite.filter.ParaciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
	(20, 7, 0, 'ParsCit', 'lib.pkp.plugins.citationParser.parscit.filter.ParscitRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
	(21, 7, 0, 'RegEx', 'lib.pkp.plugins.citationParser.regex.filter.RegexRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
	(22, 17, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
	(23, 18, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
	(24, 19, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
	(25, 20, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
	(26, 21, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
	(27, 22, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
	(28, 23, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
	(29, 24, 0, 'mEDRA XML issue export', 'plugins.importexport.medra.filter.IssueMedraXmlFilter', 0, 0, 0),
	(30, 25, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.ArticleMedraXmlFilter', 0, 0, 0),
	(31, 26, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.GalleyMedraXmlFilter', 0, 0, 0),
	(32, 27, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
	(33, 28, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
	(34, 29, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
	(35, 30, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
	(36, 31, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
	(37, 32, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
	(38, 33, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
	(39, 34, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
	(40, 38, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
	(41, 39, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArtworkFileFilter', 0, 0, 0),
	(42, 40, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter', 0, 0, 0),
	(43, 35, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
	(44, 36, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.ArtworkFileNativeXmlFilter', 0, 0, 0),
	(45, 37, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter', 0, 0, 0),
	(46, 41, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
	(47, 42, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0),
	(48, 43, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
	(49, 44, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
	(50, 45, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
	(51, 46, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
	(52, 47, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;


-- Dumping structure for table ojs.filter_groups
CREATE TABLE IF NOT EXISTS `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.filter_groups: ~47 rows (approximately)
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT IGNORE INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
	(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
	(2, 'mods34=>mods34-xml', 'plugins.metadata.mods34.mods34XmlOutput.displayName', 'plugins.metadata.mods34.mods34XmlOutput.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(*)', 'xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),
	(3, 'article=>mods34', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),
	(4, 'mods34=>article', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)', 'class::classes.article.Article'),
	(5, 'citation=>nlm30', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'class::lib.pkp.classes.citation.Citation', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
	(6, 'nlm30=>citation', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'class::lib.pkp.classes.citation.Citation'),
	(7, 'plaintext=>nlm30-element-citation', 'plugins.metadata.nlm30.citationParsers.displayName', 'plugins.metadata.nlm30.citationParsers.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
	(8, 'nlm30-element-citation=>nlm30-element-citation', 'plugins.metadata.nlm30.citationLookup.displayName', 'plugins.metadata.nlm30.citationLookup.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
	(9, 'nlm30-element-citation=>plaintext', 'plugins.metadata.nlm30.citationOutput.displayName', 'plugins.metadata.nlm30.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
	(10, 'nlm30-element-citation=>nlm30-xml', 'plugins.metadata.nlm30Xml.citationOutput.displayName', 'plugins.metadata.nlm30Xml.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'xml::*'),
	(11, 'submission=>nlm30-article-xml', 'plugins.metadata.nlm30.nlm30XmlOutput.displayName', 'plugins.metadata.nlm30.nlm30XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
	(12, 'submission=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm23XmlOutput.displayName', 'plugins.metadata.nlm30.nlm23XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
	(13, 'nlm30-article-xml=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.displayName', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.description', 'xml::*', 'xml::*'),
	(14, 'submission=>reference-list', 'plugins.metadata.nlm30.refList.displayName', 'plugins.metadata.nlm30.refList.description', 'class::lib.pkp.classes.submission.Submission', 'class::lib.pkp.classes.citation.PlainTextReferencesList'),
	(15, 'nlm30-element-citation=>isbn', 'plugins.citationLookup.isbndbExtraction.displayName', 'plugins.citationLookup.isbndbExtraction.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
	(16, 'isbn=>nlm30-element-citation', 'plugins.citationLookup.isbndbLookup.displayName', 'plugins.citationLookup.isbndbLookup.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
	(17, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
	(18, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.article.Article[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
	(19, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
	(20, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.Article', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
	(21, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
	(22, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
	(23, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article', 'primitive::string'),
	(24, 'issue=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.issue.Issue[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
	(25, 'article=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.Article[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
	(26, 'galley=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.ArticleGalley[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
	(27, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(28, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Article[]'),
	(29, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(30, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
	(31, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(32, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
	(33, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(34, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
	(35, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(36, 'SubmissionArtworkFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionArtworkFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(37, 'SupplementaryFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SupplementaryFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(38, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
	(39, 'native-xml=>SubmissionArtworkFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionArtworkFile'),
	(40, 'native-xml=>SupplementaryFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SupplementaryFile'),
	(41, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
	(42, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]'),
	(43, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.article.Article[]', 'xml::dtd'),
	(44, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
	(45, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
	(46, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
	(47, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;


-- Dumping structure for table ojs.filter_settings
CREATE TABLE IF NOT EXISTS `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.filter_settings: ~17 rows (approximately)
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
INSERT IGNORE INTO `filter_settings` (`filter_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(8, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
	(8, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
	(9, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
	(10, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
	(10, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
	(11, '', 'xsl', 'lib/pkp/plugins/metadata/nlm30/filter/nlm30-to-23-ref-list.xsl', 'string'),
	(11, '', 'xslType', '2', 'int'),
	(12, '', 'phpVersionMin', '5.0.0', 'string'),
	(13, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
	(14, '', 'phpVersionMin', '5.0.0', 'string'),
	(15, '', 'phpVersionMin', '5.0.0', 'string'),
	(16, '', 'phpVersionMin', '5.0.0', 'string'),
	(17, '', 'phpVersionMin', '5.0.0', 'string'),
	(18, '', 'phpVersionMin', '5.0.0', 'string'),
	(19, '', 'phpVersionMin', '5.0.0', 'string'),
	(20, '', 'phpVersionMin', '5.0.0', 'string'),
	(21, '', 'phpVersionMin', '5.0.0', 'string');
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `sortable` tinyint(4) NOT NULL DEFAULT '1',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.genres: ~12 rows (approximately)
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT IGNORE INTO `genres` (`genre_id`, `context_id`, `seq`, `sortable`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
	(97, 9, 0, 0, 1, 1, 0, 0, 'SUBMISSION'),
	(98, 9, 1, 0, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
	(99, 9, 2, 0, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
	(100, 9, 3, 0, 1, 3, 0, 1, 'RESEARCHRESULTS'),
	(101, 9, 4, 0, 1, 3, 0, 1, 'TRANSCRIPTS'),
	(102, 9, 5, 0, 1, 3, 0, 1, 'DATAANALYSIS'),
	(103, 9, 6, 0, 1, 3, 0, 1, 'DATASET'),
	(104, 9, 7, 0, 1, 3, 0, 1, 'SOURCETEXTS'),
	(105, 9, 8, 0, 1, 1, 1, 1, 'MULTIMEDIA'),
	(106, 9, 9, 0, 1, 2, 1, 0, 'IMAGE'),
	(107, 9, 10, 0, 1, 1, 1, 0, 'STYLE'),
	(108, 9, 11, 1, 1, 3, 0, 1, 'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;


-- Dumping structure for table ojs.genre_settings
CREATE TABLE IF NOT EXISTS `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.genre_settings: ~12 rows (approximately)
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT IGNORE INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(97, 'id_ID', 'name', 'File Utama Naskah', 'string'),
	(98, 'id_ID', 'name', 'Instrumen Penelitian', 'string'),
	(99, 'id_ID', 'name', 'Bahan Penelitian', 'string'),
	(100, 'id_ID', 'name', 'Hasil Penelitian', 'string'),
	(101, 'id_ID', 'name', 'Transkrip', 'string'),
	(102, 'id_ID', 'name', 'Analisis Data', 'string'),
	(103, 'id_ID', 'name', 'Data Set', 'string'),
	(104, 'id_ID', 'name', 'Teks Sumber', 'string'),
	(105, 'id_ID', 'name', '##default.genres.multimedia##', 'string'),
	(106, 'id_ID', 'name', '##default.genres.image##', 'string'),
	(107, 'id_ID', 'name', '##default.genres.styleSheet##', 'string'),
	(108, 'id_ID', 'name', '##default.genres.other##', 'string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.institutional_subscriptions
CREATE TABLE IF NOT EXISTS `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.institutional_subscriptions: ~0 rows (approximately)
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;


-- Dumping structure for table ojs.institutional_subscription_ip
CREATE TABLE IF NOT EXISTS `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.institutional_subscription_ip: ~0 rows (approximately)
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;


-- Dumping structure for table ojs.issues
CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.issues: ~0 rows (approximately)
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;


-- Dumping structure for table ojs.issue_files
CREATE TABLE IF NOT EXISTS `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.issue_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;


-- Dumping structure for table ojs.issue_galleys
CREATE TABLE IF NOT EXISTS `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.issue_galleys: ~0 rows (approximately)
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;


-- Dumping structure for table ojs.issue_galley_settings
CREATE TABLE IF NOT EXISTS `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.issue_galley_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.issue_settings
CREATE TABLE IF NOT EXISTS `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.issue_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.item_views
CREATE TABLE IF NOT EXISTS `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.item_views: ~0 rows (approximately)
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;


-- Dumping structure for table ojs.journals
CREATE TABLE IF NOT EXISTS `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.journals: ~1 rows (approximately)
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT IGNORE INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
	(9, 'test', 1, 'id_ID', 1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;


-- Dumping structure for table ojs.journal_settings
CREATE TABLE IF NOT EXISTS `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.journal_settings: ~38 rows (approximately)
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT IGNORE INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(9, '', 'defaultReviewMode', '2', 'int'),
	(9, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href="{$contextUrl}">{$contextName}</a>', 'string'),
	(9, '', 'itemsPerPage', '25', 'int'),
	(9, '', 'keywordsEnabledSubmission', '1', 'bool'),
	(9, '', 'keywordsEnabledWorkflow', '1', 'bool'),
	(9, '', 'membershipFee', '0', 'int'),
	(9, '', 'numPageLinks', '10', 'int'),
	(9, '', 'numWeeksPerReview', '4', 'int'),
	(9, '', 'publicationFee', '0', 'int'),
	(9, '', 'purchaseArticleFee', '0', 'int'),
	(9, '', 'rtAbstract', '1', 'bool'),
	(9, '', 'rtAddComment', '1', 'bool'),
	(9, '', 'rtCaptureCite', '1', 'bool'),
	(9, '', 'rtDefineTerms', '1', 'bool'),
	(9, '', 'rtEmailAuthor', '1', 'bool'),
	(9, '', 'rtEmailOthers', '1', 'bool'),
	(9, '', 'rtPrinterFriendly', '1', 'bool'),
	(9, '', 'rtSupplementaryFiles', '1', 'bool'),
	(9, '', 'rtViewMetadata', '1', 'bool'),
	(9, '', 'supportedFormLocales', 'a:1:{i:0;s:5:"id_ID";}', 'object'),
	(9, '', 'supportedLocales', 'a:1:{i:0;s:5:"id_ID";}', 'object'),
	(9, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:"id_ID";}', 'object'),
	(9, '', 'themePluginPath', 'default', 'string'),
	(9, 'id_ID', 'authorInformation', 'Tertarik menerbitkan jurnal? Kami merekomendasikan Anda mereview halaman <a href="http://localhost/stkipsuar/jurnal/index.php/test/about">Tentang Kami </a>untuk kebijakan bagian jurnal serta <a href="http://localhost/stkipsuar/jurnal/index.php/test/about/submissions#authorGuidelines">Petunjuk Penulis </a>. Penulis perlu <a href="http://localhost/stkipsuar/jurnal/index.php/test/user/register">Mendaftar </a>dengan jurnal sebelum menyerahkan atau jika sudah terdaftar <a href="http://localhost/stkipsuar/jurnal/index.php/index/login">login</a>dan mulai proses lima langkah.', 'string'),
	(9, 'id_ID', 'authorSelfArchivePolicy', 'Jurnal ini memberi izin dan mendorong penulis untuk memposting item yang diserahkan ke jurnal di website personal atau repositori institusional sebelum dan sesudah penerbitan, sementara itu menyediakan detail bibliografi yang akan memberikan kredit, jika bisa diterapkan, penerbitannya di jurnal ini.', 'string'),
	(9, 'id_ID', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://clockss.org/">More...</a>', 'string'),
	(9, 'id_ID', 'copyeditInstructions', 'Tahap Copyediting dimaksudkan untuk meningkatkan aliran, kejelasan, tata bahasa, kata-kata, dan pemformatan artikel. Tahap ini mewakili kesempatan terakhir untuk penulis untu membuat perubahan substansial apapun pada teks karena tahap selanjutnya terlarang untuk koreksi format dan kesalahan penulisan.\n\nFile untuk dicopyedit berupa file Word atau .rtf sehingga dapat diedit dengan mudah.  Petunjuk yang ditampilkan berikut menggambarkan dua pendekatan dalam melakukan copyediting.  Pendekatan pertama, berdasarkan fitur Track Changes di Microsoft Word yang membutuhkan copy editor, editor dan penulis memiliki program ini. Pendekatan kedua, tidak tergantung piranti lunak tertentu, dipinjam dengan seijin dari Harvard Educational Review. Editor Jurnal dapat memodifikasi petunjuk berikut ini dalam rangka meningkatkan proses editorial di jurnal ini.\n\n\n<h4>Sistem Copyedit</h4>\n\n<strong>1. Track Changes dari Microsoft Office Word</strong>\n\nDi bawah menu Review di Microsoft Office Word, fitur Track Changes memungkinkan copy editor untuk membuat sisipan (teks diberi warna) dan penghapusan (teks diberi coretan dengan warna atau di margin dan ditandai dengan kata dihapus). Copy editor dapat meninggalkan pertanyaan pada penulis (Pertanyaan ke Penulis) dan pada editor (Pertanyaan ke Editor) dengan menyisipkan pertanyaan-pertanyaan di dalam tanda kurung persegi (tanda [...]). Versi yang sudah dicopyedit kemudian diunggah, dan editor diberitahu. Editor kemudian mereview teks dan memberitahu penulis.\n\nEditor dan penulis cukup membiarkan perubahan yang dibuat copy editor jika telah puas dengan perubahan tersebut. Jika perlu perubahan lebih lanjut, editor dan penulis dapat melakukan perubahan dengan penyisipan dan penghapusan dalam naskah yang telah dicopyedit tersebut. Penulis dan editor harus menjawab setiap pertanyaan dari copy editor dengan mengetikkan responnya di dalam tanda kurung persegi tersebut.\n\nSetelah naskah direview oleh editor dan penulis, copy editor akan melakukan pengecekan terakhir untuk tahap layout dan galley.\n\n\n<strong>2. Harvard Educational Review</strong>\n\n<strong>Instruksi untuk Membuat Revisi Elektronik dalam Naskah</strong>\n\nMohon ikuti protokol berikut dalam membuat revisi elekronik untuk naskah Anda:\n\n<strong>Merespon perubahan yang disarankan.</strong>\n&nbsp; Untuk masing-masing perubahan yang Anda setujui, ubah teks yang ditebalkan ke huruf biasa.\n&nbsp; Untuk masing-masing perubahan yang Anda tidak setuju, masukkan kembali teks asli dan <strong>tebalkan</strong>.\n\n<strong>Menambah dan menghapus.</strong>\n&nbsp; Tandai tambahan dengan <strong>menebalkan</strong>teks baru.\n&nbsp; Gantikan bagian yang dihapus dengan: <strong>[teks dihapus]</strong>.\n&nbsp; Jika Anda menghapus satu kalimat atau lebih, mohon berikan catatan, contoh <strong>[dua kalimat dihapus]</strong>.\n\n<strong>Merespon Pertanyaan untuk Penulis (QA/Queries to the Author).</strong>\n&nbsp; Jaga semua QA tetap utuh dan tercetak tebal.  Jangan dihapus.\n&nbsp; Untuk menjawab QA, tambahkan komentar setelah pertanyaan tersebut. Komentar harus dibatasi dengan menggunakan:\n<strong>[Komentar:]</strong>\n&nbsp; contoh: <strong>[Komentar: memperdalam pembahasan metodologi seperti yang Anda sarankan]</strong>.\n\n<strong>Membuat Komentar.</strong>\n&nbsp; Gunakan komentar untuk menjelaskan perubahan susunan atau revisi besar\n&nbsp; contoh: <strong>[Komentar: Memindahkan paragraf di atas dari hal. 5 ke hal. 7].</strong>\n&nbsp; Catatan: Saat merujuk suatu nomor halaman, gunakan nomor halaman dari print out naskah yang telah dikirimkan ke Anda. Hal ini penting karena nomor halaman bisa berubah saat dokumen direvisi secara elektronik.\n\n<h4>Ilustrasi Revisi Elektronik </h4>\n\n<ol>\n<li><strong>Copyedit Awal.</strong>  Copy editor jurnal akan mengedit teks untuk meningkatkan alur, kejelasan, tata bahasa, diksi dan format, juga termasuk pertanyaan penulis jika perlu. Saat Copyedit Awal selesai, copy editor akan mengunggah dokumen yang sudah direvisi melalui website jurnal dan memberitahu penulis bahwa ada naskah yang telah diedit dan perlu direview kembali oleh penulis.</li>\n<li><strong>Copyedit Penulis.</strong>  Sebelum mengubah drastis struktur dan susunan naskah yang sudah diedit, penulis harus bekerjasama dengan editor yang menangani naskah. Penulis harus menerima atau menolak perubahan apapun yang dibuat selama Copyediting Awal, dan merespon semua Pertanyaan ke Penulis (QA). Saat selesai melakukan revisi, penulis harus mengganti nama file dari NamaPenulisQA.doc menjadi NamaPenulisQAR.doc (contoh: dari LeeQA.doc ke LeeQAR.doc) dan mengunggah dokumen yang telah direvisi melalui website jurnal.</li>\n<li><strong>Copyedit Akhir.</strong>  Copy editor jurnal akan memverifikasi perubahan yang dibuat oleh penulis dan menggabungkan respon pada Pertanyaan ke Penulis untuk membuat naskah final. Saat selesai, copy editor akan mengunggah naskah final melalui website jurnal dan memberitahu editor layout untuk melanjutkan ke finalisasi format.</li>\n</ol>', 'string'),
	(9, 'id_ID', 'description', '<p>test</p>', 'string'),
	(9, 'id_ID', 'librarianInformation', 'Kami mendorong pustakawan riset untuk mendaftar jurnal diantara pemegang jurnal eletronik perpustakaan. Begitu juga, ini mungkin berharga bahwa sistem penerbitan sumber terbuka jurnal cocok untuk perpustakaan untuk menjadi tuan rumah untuk anggota fakultas untuk menggunakan jurnal saat mereka terlibat dalam proses editing. (Lihat <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).', 'string'),
	(9, 'id_ID', 'lockssLicense', 'OJS sistem LOCKSS berfungsi sebagai sistem pengarsipan terdistribusi antar-perpustakaan yang menggunakan sistem ini dengan tujuan membuat arsip permanen (untuk preservasi dan restorasi). <a href="http://www.lockss.org/">Lanjut...</a>', 'string'),
	(9, 'id_ID', 'metaCitations', '1', 'string'),
	(9, 'id_ID', 'name', 'test', 'string'),
	(9, 'id_ID', 'openAccessPolicy', 'Jurnal ini menyediakan akses terbuka yang pada prinsipnya membuat riset tersedia secara gratis untuk publik dan akan mensupport pertukaran pengetahuan global terbesar.', 'string'),
	(9, 'id_ID', 'privacyStatement', 'Nama dan alamat email yang dimasukkan di website ini hanya akan digunakan untuk tujuan yang sudah disebutkan, tidak akan disalahgunakan untuk tujuan lain atau untuk disebarluaskan ke pihak lain.', 'string'),
	(9, 'id_ID', 'proofInstructions', '<p>Tahap proofreading dimaksudkan untuk menemukan kesalahan di format, tata bahasa, dan ejaan galley. Perubahan substansi tidak bisa dibuat di tahap ini, kecuali didiskusikan dengan Editor Bagian. Di Layout, klik di VIEW PROOF untuk melihat HTML, PDF, dan format file lain yang tersedia dalam menerbitkan naskah ini.</p>\n	<h4>Untuk kesalahan tata bahasa dan ejaan</h4>\n\n	<p>Salin kata atau frase yang menjadi masalah dan letakkan mereka di kotak Koreksi Proofreading dengan instruksi "UBAH_KE" untuk editor seperti contoh berikut ini:</p>\n\n	<pre>1. UBAH...\n	di tulis lengkap\n	KE...\n	ditulis lengkap</pre>\n	<br />\n	<pre>2. UBAH...\n	Malinowsky \n	KE....\n	Malinowski</pre>\n	<br />\n\n	<h4>Untuk kesalahan format </h4>\n	\n	<p>Jelaskan letak kesalahan dalam kotak Koreksi Proofreading setelah mengetik judul "FORMAT" seperti contoh berikut ini:</p>\n	<br />\n	<pre>3. FORMAT\n	Nomor dalam Tabel 3 tidak sejajar di kolom ketiga.</pre>\n	<br />\n	<pre>4. FORMAT\n	Paragraf yang dimulai dengan "Topik terakhir ini..." tidak menjorok.</pre>', 'string'),
	(9, 'id_ID', 'readerInformation', 'Kami mendorong pembaca untuk mendaftarkan diri di layanan notifikasi penerbitan untuk jurnal ini. Gunakan tautan <a href="http://localhost/stkipsuar/jurnal/index.php/test/user/register">Daftar</a>di bagian atas beranda jurnal. Dengan mendaftar, pembaca akan memperoleh email berisi Daftar Isi tiap ada terbitan jurnal baru. Daftar ini juga membuat jurnal dapat mengetahui tingkat dukungan atau jumlah pembaca. Lihat jurnal <a href="http://localhost/stkipsuar/jurnal/index.php/test/about/submissions#privacyStatement">Pernyataan Privasi</a>, yang meyakinkan pembaca bahwa nama dan alamat email yang didaftarkan tidak akan digunakan untuk tujuan lain.', 'string'),
	(9, 'id_ID', 'refLinkInstructions', '<h4>Menambah Tautan Referensi ke Proses Layout </h4>\n	<p>Saat mengubah naskah menjadi HTML atau PDF, pastikan semua hyperlink dalam naskah aktif.</p>\n	<h4>A. Jika Penulis Memberikan Tautan bersama dengan Referensi</h4>\n	<ol>\n	<li>Saat naskah masih dalam format pengolah kata (contoh: MS Office Word), tambahkan frase LIHAT ITEM di tiap akhir referensi yang mempunyai URL.</li>\n	<li>Ubah frase ke hyperlink dengan meng-highlightnya dan menggunakan alat Insert Hyperlink di Word, masukkan URL yang dipersiapkan di #2.</li>\n	</ol>\n	<h4>B. Memberi Pembaca Akses untuk Mencari Referensi dengan Google Scholar</h4>\n	<ol>\n	<li>Saat naskah masih dalam format pengolah kata (contoh: MS Office Word), salin judul referensi di Daftar Pustaka (jika judulnya tampak terlalu umum, contoh: "Damai"-salin nama penulis dan judul).</li>\n	<li>Tempel judul referensi antara %22, tambahkan tanda "+" di antara kata-kata: http://scholar.google.com/scholar?q=%22TULIS+JUDUL+DI+SINI%22&hl=en&lr=&btnG=Search.</li>\n\n	<li>Tambahkan frase GS SEARCH di tiap akhir referensi di daftar pustaka naskah.</li>\n	<li>Ubah frase itu ke hyperlink dengan meng-highlightnya dan menggunakan alat Insert Hyperlink di Word, masukkan URL yang dipersiapkan di #2.</li>\n	</ol>\n	<h4>C. Memberi Pembaca Akses untuk Mencari Referensi dengan DOI</h4>\n	<ol>\n	<li>Saat naskah masih dalam format pengolah kata (contoh: MS Office Word), salin sejumlah referensi ke dalam CrossRef Text Query http://www.crossref.org/freeTextQuery/.</li>\n	<li>Tempel tiap DOI yang dihasilkan di URL berikut ini (di antara = and &): http://www.cmaj.ca/cgi/external_ref?access_num=TULIS_DOI_DISINI&link_type=DOI.</li>\n	<li>Tambahkan frase CrossRef di akhir tiap sitasi di daftar pustaka naskah.</li>\n	<li>Ubah frase menjadi hyperlink dengan memilih frase dan menggunakan alat Insert Hyperlink di Word, masukkan URL yang telah dipersiapkan di #2.</li>\n	</ol>', 'string'),
	(9, 'id_ID', 'submissionChecklist', 'a:5:{i:0;a:2:{s:7:"content";s:166:"Naskah belum pernah diterbitkan sebelumnya, dan tidak sedang dalam pertimbangan untuk diterbitkan di jurnal lain (atau sudah dijelaskan dalam Komentar kepada Editor).";s:5:"order";s:1:"1";}i:1;a:2:{s:7:"content";s:70:"File naskah dalam format dokumen OpenOffice, Microsoft Word, atau RTF.";s:5:"order";s:1:"2";}i:2;a:2:{s:7:"content";s:61:"Referensi yang dapat diakses online telah dituliskan URL-nya.";s:5:"order";s:1:"3";}i:3;a:2:{s:7:"content";s:257:"Naskah diketik dengan teks 1 spasi; font 12; menggunakan huruf miring, bukan huruf bergaris bawah (kecuali alamat URL); dan semua ilustrasi, gambar, dan tabel diletakkan dalam teks pada tempat yang diharapkan, bukan dikelompokkan tersendiri di akhir naskah.";s:5:"order";s:1:"4";}i:4;a:2:{s:7:"content";s:93:"Pengetikan naskah dan sitasi mengikuti gaya selingkung yang disyaratkan dalam Panduan Penulis";s:5:"order";s:1:"5";}}', 'object');
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.library_files
CREATE TABLE IF NOT EXISTS `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.library_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;


-- Dumping structure for table ojs.library_file_settings
CREATE TABLE IF NOT EXISTS `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.library_file_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.metadata_descriptions
CREATE TABLE IF NOT EXISTS `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.metadata_descriptions: ~0 rows (approximately)
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;


-- Dumping structure for table ojs.metadata_description_settings
CREATE TABLE IF NOT EXISTS `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.metadata_description_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.metrics
CREATE TABLE IF NOT EXISTS `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.metrics: ~0 rows (approximately)
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;


-- Dumping structure for table ojs.navigation_menus
CREATE TABLE IF NOT EXISTS `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.navigation_menus: ~3 rows (approximately)
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT IGNORE INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
	(1, 0, 'user', 'User'),
	(16, 9, 'user', 'User'),
	(17, 9, 'primary', 'Primary');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;


-- Dumping structure for table ojs.navigation_menu_items
CREATE TABLE IF NOT EXISTS `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.navigation_menu_items: ~22 rows (approximately)
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT IGNORE INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `url`, `path`, `type`) VALUES
	(1, 0, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
	(2, 0, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
	(3, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
	(4, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
	(5, 0, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
	(6, 0, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
	(7, 0, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
	(90, 9, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
	(91, 9, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
	(92, 9, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
	(93, 9, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
	(94, 9, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
	(95, 9, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
	(96, 9, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
	(97, 9, NULL, NULL, 'NMI_TYPE_CURRENT'),
	(98, 9, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
	(99, 9, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
	(100, 9, NULL, NULL, 'NMI_TYPE_ABOUT'),
	(101, 9, NULL, NULL, 'NMI_TYPE_ABOUT'),
	(102, 9, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
	(103, 9, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
	(104, 9, NULL, NULL, 'NMI_TYPE_CONTACT');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;


-- Dumping structure for table ojs.navigation_menu_item_assignments
CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.navigation_menu_item_assignments: ~22 rows (approximately)
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT IGNORE INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
	(1, 1, 1, 0, 0),
	(2, 1, 2, 0, 1),
	(3, 1, 3, 0, 2),
	(4, 1, 4, 3, 0),
	(5, 1, 5, 3, 1),
	(6, 1, 6, 3, 2),
	(7, 1, 7, 3, 3),
	(86, 16, 90, 0, 0),
	(87, 16, 91, 0, 1),
	(88, 16, 92, 0, 2),
	(89, 16, 93, 92, 0),
	(90, 16, 94, 92, 1),
	(91, 16, 95, 92, 2),
	(92, 16, 96, 92, 3),
	(93, 17, 97, 0, 0),
	(94, 17, 98, 0, 1),
	(95, 17, 99, 0, 2),
	(96, 17, 100, 0, 3),
	(97, 17, 101, 100, 0),
	(98, 17, 102, 100, 1),
	(99, 17, 103, 100, 2),
	(100, 17, 104, 100, 3);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;


-- Dumping structure for table ojs.navigation_menu_item_assignment_settings
CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.navigation_menu_item_assignment_settings: ~22 rows (approximately)
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
INSERT IGNORE INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(1, 'id_ID', 'title', 'navigation.register', 'string'),
	(2, 'id_ID', 'title', 'navigation.login', 'string'),
	(3, 'id_ID', 'title', '{$loggedInUsername}', 'string'),
	(4, 'id_ID', 'title', 'navigation.dashboard', 'string'),
	(5, 'id_ID', 'title', 'common.viewProfile', 'string'),
	(6, 'id_ID', 'title', 'navigation.admin', 'string'),
	(7, 'id_ID', 'title', 'Log Out', 'string'),
	(86, 'id_ID', 'title', 'Daftar', 'string'),
	(87, 'id_ID', 'title', 'Login', 'string'),
	(88, 'id_ID', 'title', '{$loggedInUsername}', 'string'),
	(89, 'id_ID', 'title', 'Dashboard', 'string'),
	(90, 'id_ID', 'title', 'Lihat Profil', 'string'),
	(91, 'id_ID', 'title', 'Administrasi', 'string'),
	(92, 'id_ID', 'title', 'Log Out', 'string'),
	(93, 'id_ID', 'title', 'Terkini', 'string'),
	(94, 'id_ID', 'title', 'navigation.archives', 'string'),
	(95, 'id_ID', 'title', 'Pengumuman', 'string'),
	(96, 'id_ID', 'title', 'Tentang Kami', 'string'),
	(97, 'id_ID', 'title', 'Tentang Jurnal Ini', 'string'),
	(98, 'id_ID', 'title', 'navigation.submissions', 'string'),
	(99, 'id_ID', 'title', 'Dewan Editor', 'string'),
	(100, 'id_ID', 'title', 'Kontak', 'string');
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.navigation_menu_item_settings
CREATE TABLE IF NOT EXISTS `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.navigation_menu_item_settings: ~44 rows (approximately)
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT IGNORE INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
	(1, 'id_ID', 'title', 'navigation.register', 'string'),
	(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
	(2, 'id_ID', 'title', 'navigation.login', 'string'),
	(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
	(3, 'id_ID', 'title', '{$loggedInUsername}', 'string'),
	(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
	(4, 'id_ID', 'title', 'navigation.dashboard', 'string'),
	(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
	(5, 'id_ID', 'title', 'common.viewProfile', 'string'),
	(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
	(6, 'id_ID', 'title', 'navigation.admin', 'string'),
	(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
	(7, 'id_ID', 'title', 'Log Out', 'string'),
	(90, '', 'titleLocaleKey', 'navigation.register', 'string'),
	(90, 'id_ID', 'title', 'Daftar', 'string'),
	(91, '', 'titleLocaleKey', 'navigation.login', 'string'),
	(91, 'id_ID', 'title', 'Login', 'string'),
	(92, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
	(92, 'id_ID', 'title', '{$loggedInUsername}', 'string'),
	(93, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
	(93, 'id_ID', 'title', 'Dashboard', 'string'),
	(94, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
	(94, 'id_ID', 'title', 'Lihat Profil', 'string'),
	(95, '', 'titleLocaleKey', 'navigation.admin', 'string'),
	(95, 'id_ID', 'title', 'Administrasi', 'string'),
	(96, '', 'titleLocaleKey', 'user.logOut', 'string'),
	(96, 'id_ID', 'title', 'Log Out', 'string'),
	(97, '', 'titleLocaleKey', 'navigation.current', 'string'),
	(97, 'id_ID', 'title', 'Terkini', 'string'),
	(98, '', 'titleLocaleKey', 'navigation.archives', 'string'),
	(98, 'id_ID', 'title', 'navigation.archives', 'string'),
	(99, '', 'titleLocaleKey', 'manager.announcements', 'string'),
	(99, 'id_ID', 'title', 'Pengumuman', 'string'),
	(100, '', 'titleLocaleKey', 'navigation.about', 'string'),
	(100, 'id_ID', 'title', 'Tentang Kami', 'string'),
	(101, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
	(101, 'id_ID', 'title', 'Tentang Jurnal Ini', 'string'),
	(102, '', 'titleLocaleKey', 'navigation.submissions', 'string'),
	(102, 'id_ID', 'title', 'navigation.submissions', 'string'),
	(103, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
	(103, 'id_ID', 'title', 'Dewan Editor', 'string'),
	(104, '', 'titleLocaleKey', 'about.contact', 'string'),
	(104, 'id_ID', 'title', 'Kontak', 'string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.notes: ~0 rows (approximately)
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;


-- Dumping structure for table ojs.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.notifications: ~4 rows (approximately)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT IGNORE INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
	(11, 6, 0, 2, 16777244, '2017-11-25 12:04:38', NULL, 256, 6),
	(13, 7, 0, 2, 16777244, '2017-11-25 12:05:51', NULL, 256, 7),
	(16, 8, 0, 2, 16777244, '2017-11-25 12:08:41', NULL, 256, 8),
	(18, 9, 0, 2, 16777244, '2017-11-25 12:28:27', NULL, 256, 9);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;


-- Dumping structure for table ojs.notification_mail_list
CREATE TABLE IF NOT EXISTS `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.notification_mail_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;


-- Dumping structure for table ojs.notification_settings
CREATE TABLE IF NOT EXISTS `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.notification_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.notification_subscription_settings
CREATE TABLE IF NOT EXISTS `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.notification_subscription_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.oai_resumption_tokens
CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.oai_resumption_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;


-- Dumping structure for table ojs.plugin_settings
CREATE TABLE IF NOT EXISTS `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.plugin_settings: ~41 rows (approximately)
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT IGNORE INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
	('acronplugin', 0, 'crontab', 'a:6:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:2;a:3:{s:9:"className";s:48:"plugins.importexport.datacite.DataciteInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:3;a:3:{s:9:"className";s:40:"plugins.importexport.doaj.DOAJInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:4;a:3:{s:9:"className";s:42:"plugins.importexport.medra.MedraInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:5;a:3:{s:9:"className";s:35:"lib.pkp.classes.task.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}}', 'object'),
	('acronplugin', 0, 'enabled', '1', 'bool'),
	('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
	('defaultthemeplugin', 9, 'enabled', '1', 'bool'),
	('developedbyblockplugin', 0, 'context', '1', 'int'),
	('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
	('developedbyblockplugin', 0, 'seq', '0', 'int'),
	('developedbyblockplugin', 9, 'context', '1', 'int'),
	('developedbyblockplugin', 9, 'enabled', '0', 'bool'),
	('developedbyblockplugin', 9, 'seq', '0', 'int'),
	('dublincoremetaplugin', 9, 'enabled', '1', 'bool'),
	('googlescholarplugin', 9, 'enabled', '1', 'bool'),
	('htmlarticlegalleyplugin', 9, 'enabled', '1', 'bool'),
	('informationblockplugin', 9, 'context', '1', 'int'),
	('informationblockplugin', 9, 'enabled', '1', 'bool'),
	('informationblockplugin', 9, 'seq', '7', 'int'),
	('languagetoggleblockplugin', 0, 'context', '1', 'int'),
	('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
	('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
	('languagetoggleblockplugin', 9, 'context', '1', 'int'),
	('languagetoggleblockplugin', 9, 'enabled', '1', 'bool'),
	('languagetoggleblockplugin', 9, 'seq', '4', 'int'),
	('lensgalleyplugin', 9, 'enabled', '1', 'bool'),
	('pdfjsviewerplugin', 9, 'enabled', '1', 'bool'),
	('resolverplugin', 9, 'enabled', '1', 'bool'),
	('subscriptionblockplugin', 9, 'context', '1', 'int'),
	('subscriptionblockplugin', 9, 'enabled', '1', 'bool'),
	('subscriptionblockplugin', 9, 'seq', '2', 'int'),
	('tinymceplugin', 0, 'enabled', '1', 'bool'),
	('tinymceplugin', 9, 'enabled', '1', 'bool'),
	('usageeventplugin', 0, 'enabled', '1', 'bool'),
	('usageeventplugin', 0, 'uniqueSiteId', '', 'string'),
	('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/', 'string'),
	('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
	('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
	('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
	('usagestatsplugin', 0, 'enabled', '1', 'bool'),
	('usagestatsplugin', 0, 'optionalColumns', 'a:2:{i:0;s:4:"city";i:1;s:6:"region";}', 'object'),
	('webfeedplugin', 9, 'displayItems', '1', 'bool'),
	('webfeedplugin', 9, 'displayPage', 'homepage', 'string'),
	('webfeedplugin', 9, 'enabled', '1', 'bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.published_submissions
CREATE TABLE IF NOT EXISTS `published_submissions` (
  `published_submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `access_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`published_submission_id`),
  UNIQUE KEY `published_submissions_submission_id` (`submission_id`),
  KEY `published_submissions_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.published_submissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `published_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `published_submissions` ENABLE KEYS */;


-- Dumping structure for table ojs.queries
CREATE TABLE IF NOT EXISTS `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.queries: ~0 rows (approximately)
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;


-- Dumping structure for table ojs.query_participants
CREATE TABLE IF NOT EXISTS `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.query_participants: ~0 rows (approximately)
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;


-- Dumping structure for table ojs.queued_payments
CREATE TABLE IF NOT EXISTS `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.queued_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;


-- Dumping structure for table ojs.review_assignments
CREATE TABLE IF NOT EXISTS `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_assignments: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;


-- Dumping structure for table ojs.review_files
CREATE TABLE IF NOT EXISTS `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;


-- Dumping structure for table ojs.review_forms
CREATE TABLE IF NOT EXISTS `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_forms: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;


-- Dumping structure for table ojs.review_form_elements
CREATE TABLE IF NOT EXISTS `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_form_elements: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;


-- Dumping structure for table ojs.review_form_element_settings
CREATE TABLE IF NOT EXISTS `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_form_element_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.review_form_responses
CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_form_responses: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;


-- Dumping structure for table ojs.review_form_settings
CREATE TABLE IF NOT EXISTS `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_form_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.review_rounds
CREATE TABLE IF NOT EXISTS `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_rounds: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;


-- Dumping structure for table ojs.review_round_files
CREATE TABLE IF NOT EXISTS `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.review_round_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;


-- Dumping structure for table ojs.rt_contexts
CREATE TABLE IF NOT EXISTS `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.rt_contexts: ~0 rows (approximately)
/*!40000 ALTER TABLE `rt_contexts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_contexts` ENABLE KEYS */;


-- Dumping structure for table ojs.rt_searches
CREATE TABLE IF NOT EXISTS `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.rt_searches: ~0 rows (approximately)
/*!40000 ALTER TABLE `rt_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_searches` ENABLE KEYS */;


-- Dumping structure for table ojs.rt_versions
CREATE TABLE IF NOT EXISTS `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(14) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.rt_versions: ~0 rows (approximately)
/*!40000 ALTER TABLE `rt_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_versions` ENABLE KEYS */;


-- Dumping structure for table ojs.scheduled_tasks
CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.scheduled_tasks: ~6 rows (approximately)
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT IGNORE INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
	('lib.pkp.classes.task.ReviewReminder', '2017-12-04 14:14:49'),
	('plugins.generic.usageStats.UsageStatsLoader', '2017-12-04 14:14:48'),
	('plugins.importexport.crossref.CrossrefInfoSender', '2017-12-04 14:14:48'),
	('plugins.importexport.datacite.DataciteInfoSender', '2017-12-04 14:14:49'),
	('plugins.importexport.doaj.DOAJInfoSender', '2017-12-04 14:14:49'),
	('plugins.importexport.medra.MedraInfoSender', '2017-12-04 14:14:49');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;


-- Dumping structure for table ojs.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.sections: ~1 rows (approximately)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT IGNORE INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `abstract_word_count`) VALUES
	(9, 9, 0, 0, 0, 1, 1, 0, 0, 0, 0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;


-- Dumping structure for table ojs.section_editors
CREATE TABLE IF NOT EXISTS `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.section_editors: ~0 rows (approximately)
/*!40000 ALTER TABLE `section_editors` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_editors` ENABLE KEYS */;


-- Dumping structure for table ojs.section_settings
CREATE TABLE IF NOT EXISTS `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.section_settings: ~3 rows (approximately)
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT IGNORE INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(9, 'id_ID', 'abbrev', 'ART', 'string'),
	(9, 'id_ID', 'policy', '', 'string'),
	(9, 'id_ID', 'title', 'Artikel', 'string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.sessions: ~5 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT IGNORE INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
	('0q6t3sivud0bamug6oohbfoqk2', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1511545924, 1511546140, 1, 'csrf|a:2:{s:9:"timestamp";i:1511546140;s:5:"token";s:32:"00d27292b76184162062fe813159ce82";}userId|s:1:"1";username|s:5:"admin";', 'localhost'),
	('4f04s2d2umhaggo6e6sqkrk595', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1511544683, 1511545185, 1, 'csrf|a:2:{s:9:"timestamp";i:1511545185;s:5:"token";s:32:"525d06c4b82c977fc4bc004eaa7f6d6c";}username|s:5:"admin";userId|s:1:"1";', 'localhost'),
	('n3bgbgqf2du3l2cjbktg1irlt1', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1511605453, 1512393292, 1, 'csrf|a:2:{s:9:"timestamp";i:1512393291;s:5:"token";s:32:"4174a2bac9d088bbe03c88fad989f5de";}userId|s:1:"1";username|s:5:"admin";', 'localhost'),
	('r6o45cmcectr6g4is1cp3acb15', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1511545216, 1511605350, 1, 'csrf|a:2:{s:9:"timestamp";i:1511605349;s:5:"token";s:32:"39bb2d9737c5349ce9d0a5ce17d66d5a";}username|s:5:"admin";userId|s:1:"1";', 'localhost'),
	('ur1324sohc91d43jnbjd4kqea0', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', 1511544587, 1511544657, 1, 'csrf|a:2:{s:9:"timestamp";i:1511544657;s:5:"token";s:32:"f72761aed36477438c8d1f00b929c2d1";}userId|s:1:"1";username|s:5:"admin";', 'localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Dumping structure for table ojs.site
CREATE TABLE IF NOT EXISTS `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.site: ~1 rows (approximately)
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT IGNORE INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
	(0, 'id_ID', 6, 'id_ID', 'id_ID', NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;


-- Dumping structure for table ojs.site_settings
CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.site_settings: ~6 rows (approximately)
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT IGNORE INTO `site_settings` (`setting_name`, `locale`, `setting_value`, `setting_type`) VALUES
	('contactEmail', 'en_US', 'mudanakomang@hotmail.com', 'string'),
	('contactName', 'en_US', 'Open Journal Systems', 'string'),
	('showDescription', '', '1', 'bool'),
	('showThumbnail', '', '1', 'bool'),
	('showTitle', '', '1', 'bool'),
	('themePluginPath', '', 'default', 'string');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.stage_assignments
CREATE TABLE IF NOT EXISTS `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.stage_assignments: ~0 rows (approximately)
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;


-- Dumping structure for table ojs.static_pages
CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.static_pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;


-- Dumping structure for table ojs.static_page_settings
CREATE TABLE IF NOT EXISTS `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.static_page_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.submissions
CREATE TABLE IF NOT EXISTS `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `pages` varchar(255) DEFAULT NULL,
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_artwork_files
CREATE TABLE IF NOT EXISTS `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_artwork_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_artwork_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_artwork_files` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_comments
CREATE TABLE IF NOT EXISTS `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_files
CREATE TABLE IF NOT EXISTS `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_file_settings
CREATE TABLE IF NOT EXISTS `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_file_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_galleys
CREATE TABLE IF NOT EXISTS `submission_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `submission_galleys_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_galleys: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_galleys` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_galley_settings
CREATE TABLE IF NOT EXISTS `submission_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `submission_galley_settings_galley_id` (`galley_id`),
  KEY `submission_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_galley_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_galley_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_search_keyword_list
CREATE TABLE IF NOT EXISTS `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_search_keyword_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_search_objects
CREATE TABLE IF NOT EXISTS `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_search_objects: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_search_object_keywords
CREATE TABLE IF NOT EXISTS `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_search_object_keywords: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_settings
CREATE TABLE IF NOT EXISTS `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  KEY `submission_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_supplementary_files
CREATE TABLE IF NOT EXISTS `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_supplementary_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_supplementary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;


-- Dumping structure for table ojs.submission_tombstones
CREATE TABLE IF NOT EXISTS `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.submission_tombstones: ~0 rows (approximately)
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;


-- Dumping structure for table ojs.subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.subscriptions: ~0 rows (approximately)
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;


-- Dumping structure for table ojs.subscription_types
CREATE TABLE IF NOT EXISTS `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.subscription_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;


-- Dumping structure for table ojs.subscription_type_settings
CREATE TABLE IF NOT EXISTS `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.subscription_type_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.temporary_files
CREATE TABLE IF NOT EXISTS `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.temporary_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;


-- Dumping structure for table ojs.usage_stats_temporary_records
CREATE TABLE IF NOT EXISTS `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.usage_stats_temporary_records: ~0 rows (approximately)
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;


-- Dumping structure for table ojs.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`user_id`, `username`, `password`, `salutation`, `first_name`, `middle_name`, `last_name`, `suffix`, `gender`, `initials`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
	(1, 'admin', '$2y$10$rKmDUgRuQtcrrT3EytysuerMGrjOHVaqZPoqzGLVHbxI3J1NVL9zO', NULL, 'admin', NULL, '', NULL, NULL, 'a', 'mudanakomang@hotmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, '2017-11-24 18:29:29', NULL, '2017-11-25 11:24:24', 0, NULL, NULL, 0, NULL, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table ojs.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_groups: ~18 rows (approximately)
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT IGNORE INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`) VALUES
	(1, 0, 1, 1, 0, 0),
	(138, 9, 16, 1, 0, 0),
	(139, 9, 16, 1, 0, 0),
	(140, 9, 16, 1, 0, 0),
	(141, 9, 17, 1, 0, 0),
	(142, 9, 17, 1, 0, 0),
	(143, 9, 4097, 1, 0, 0),
	(144, 9, 4097, 1, 0, 0),
	(145, 9, 4097, 1, 0, 0),
	(146, 9, 4097, 1, 0, 0),
	(147, 9, 4097, 1, 0, 0),
	(148, 9, 4097, 1, 0, 0),
	(149, 9, 4097, 1, 0, 0),
	(150, 9, 65536, 1, 0, 1),
	(151, 9, 65536, 1, 0, 0),
	(152, 9, 4096, 1, 0, 1),
	(153, 9, 1048576, 1, 0, 1),
	(154, 9, 2097152, 1, 0, 0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;


-- Dumping structure for table ojs.user_group_settings
CREATE TABLE IF NOT EXISTS `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_group_settings: ~69 rows (approximately)
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT IGNORE INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
	(1, 'id_ID', 'name', '##default.groups.name.siteAdmin##', 'string'),
	(138, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
	(138, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
	(138, 'id_ID', 'abbrev', 'JM', 'string'),
	(138, 'id_ID', 'name', 'Manajer Jurnal', 'string'),
	(139, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
	(139, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
	(139, 'id_ID', 'abbrev', 'JE', 'string'),
	(139, 'id_ID', 'name', 'Editor Jurnal', 'string'),
	(140, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
	(140, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
	(140, 'id_ID', 'abbrev', '##default.groups.abbrev.productionEditor##', 'string'),
	(140, 'id_ID', 'name', '##default.groups.name.productionEditor##', 'string'),
	(141, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
	(141, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
	(141, 'id_ID', 'abbrev', 'SecE', 'string'),
	(141, 'id_ID', 'name', 'Editor Bagian', 'string'),
	(142, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
	(142, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
	(142, 'id_ID', 'abbrev', 'GE', 'string'),
	(142, 'id_ID', 'name', 'Editor Tamu', 'string'),
	(143, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
	(143, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
	(143, 'id_ID', 'abbrev', '##default.groups.abbrev.copyeditor##', 'string'),
	(143, 'id_ID', 'name', '##default.groups.name.copyeditor##', 'string'),
	(144, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
	(144, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
	(144, 'id_ID', 'abbrev', '##default.groups.abbrev.designer##', 'string'),
	(144, 'id_ID', 'name', '##default.groups.name.designer##', 'string'),
	(145, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
	(145, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
	(145, 'id_ID', 'abbrev', '##default.groups.abbrev.funding##', 'string'),
	(145, 'id_ID', 'name', '##default.groups.name.funding##', 'string'),
	(146, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
	(146, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
	(146, 'id_ID', 'abbrev', '##default.groups.abbrev.indexer##', 'string'),
	(146, 'id_ID', 'name', '##default.groups.name.indexer##', 'string'),
	(147, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
	(147, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
	(147, 'id_ID', 'abbrev', '##default.groups.abbrev.layoutEditor##', 'string'),
	(147, 'id_ID', 'name', '##default.groups.name.layoutEditor##', 'string'),
	(148, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
	(148, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
	(148, 'id_ID', 'abbrev', '##default.groups.abbrev.marketing##', 'string'),
	(148, 'id_ID', 'name', '##default.groups.name.marketing##', 'string'),
	(149, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
	(149, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
	(149, 'id_ID', 'abbrev', '##default.groups.abbrev.proofreader##', 'string'),
	(149, 'id_ID', 'name', '##default.groups.name.proofreader##', 'string'),
	(150, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
	(150, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
	(150, 'id_ID', 'abbrev', '##default.groups.abbrev.author##', 'string'),
	(150, 'id_ID', 'name', '##default.groups.name.author##', 'string'),
	(151, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
	(151, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
	(151, 'id_ID', 'abbrev', '##default.groups.abbrev.translator##', 'string'),
	(151, 'id_ID', 'name', '##default.groups.name.translator##', 'string'),
	(152, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
	(152, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
	(152, 'id_ID', 'abbrev', 'R', 'string'),
	(152, 'id_ID', 'name', 'Reviewer', 'string'),
	(153, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
	(153, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
	(153, 'id_ID', 'abbrev', '##default.groups.abbrev.reader##', 'string'),
	(153, 'id_ID', 'name', '##default.groups.name.reader##', 'string'),
	(154, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
	(154, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
	(154, 'id_ID', 'abbrev', 'SubM', 'string'),
	(154, 'id_ID', 'name', 'Manajer Langganan', 'string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.user_group_stage
CREATE TABLE IF NOT EXISTS `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_group_stage: ~31 rows (approximately)
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT IGNORE INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
	(9, 139, 1),
	(9, 139, 3),
	(9, 139, 4),
	(9, 139, 5),
	(9, 140, 4),
	(9, 140, 5),
	(9, 141, 1),
	(9, 141, 3),
	(9, 141, 4),
	(9, 141, 5),
	(9, 142, 1),
	(9, 142, 3),
	(9, 142, 4),
	(9, 142, 5),
	(9, 143, 4),
	(9, 144, 5),
	(9, 145, 1),
	(9, 145, 3),
	(9, 146, 5),
	(9, 147, 5),
	(9, 148, 4),
	(9, 149, 5),
	(9, 150, 1),
	(9, 150, 3),
	(9, 150, 4),
	(9, 150, 5),
	(9, 151, 1),
	(9, 151, 3),
	(9, 151, 4),
	(9, 151, 5),
	(9, 152, 3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;


-- Dumping structure for table ojs.user_interests
CREATE TABLE IF NOT EXISTS `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_interests: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;


-- Dumping structure for table ojs.user_settings
CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;


-- Dumping structure for table ojs.user_user_groups
CREATE TABLE IF NOT EXISTS `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.user_user_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT IGNORE INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
	(1, 1),
	(138, 1);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;


-- Dumping structure for table ojs.versions
CREATE TABLE IF NOT EXISTS `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ojs.versions: ~57 rows (approximately)
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT IGNORE INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.metadata', 'dc11', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.metadata', 'mods34', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.metadata', 'nlm30', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.metadata', 'openurl10', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
	(1, 1, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:33', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationLookup', 'crossref', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationLookup', 'isbndb', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationLookup', 'pubmed', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationLookup', 'worldcat', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationParser', 'freecite', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationParser', 'paracite', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationParser', 'parscit', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.citationParser', 'regex', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.gateways', 'resolver', '', 0, 0),
	(1, 2, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
	(0, 1, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
	(1, 2, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
	(1, 2, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'openAIRE', 'OpenAIREPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:34', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
	(1, 2, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.generic', 'usageStats', '', 0, 1),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
	(2, 1, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'crossref', '', 0, 0),
	(2, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'datacite', '', 0, 0),
	(1, 1, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'doaj', '', 0, 0),
	(2, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'medra', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'native', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.importexport', 'users', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.paymethod', 'manual', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.reports', 'articles', '', 0, 0),
	(1, 1, 0, 0, '2017-11-24 18:29:35', 1, 'plugins.reports', 'counterReport', '', 0, 0),
	(2, 0, 0, 0, '2017-11-24 18:29:36', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:36', 1, 'plugins.reports', 'views', '', 0, 0),
	(1, 0, 0, 0, '2017-11-24 18:29:36', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
	(3, 1, 0, 0, '2017-11-24 18:28:46', 1, 'core', 'ojs2', '', 0, 1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
