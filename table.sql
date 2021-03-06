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

-- Dumping structure for table stkipsuar.beritas
CREATE TABLE IF NOT EXISTS `beritas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isi` text COLLATE utf8_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tglterbit` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.beritas: ~0 rows (approximately)
/*!40000 ALTER TABLE `beritas` DISABLE KEYS */;
/*!40000 ALTER TABLE `beritas` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.fasilitas
CREATE TABLE IF NOT EXISTS `fasilitas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `publishdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.fasilitas: ~7 rows (approximately)
/*!40000 ALTER TABLE `fasilitas` DISABLE KEYS */;
INSERT IGNORE INTO `fasilitas` (`id`, `attribute`, `gambar`, `value`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, 'Ruang Kuliah', '20171202100644.jpg', '<p>that field is present. Per the docs, &quot;The field under validation must have a matching field of&nbsp;foo_confirmation. For example, if the field under validation is password, a matching&nbsp;password_confirmation&nbsp;field must be present in the input.&quot; So, that field is present in the form and the input, and the confirmed rule checks that field while it is validating the&nbsp;password&nbsp;field, so you don&#39;t need to validate that one as well. Still, I tried removing the confirmed rule and still got the same exception.&nbsp;&ndash;</p>', '2017-12-02 00:00:00', NULL, '2017-12-02 14:10:06'),
	(2, 'Ruang Administratsi', NULL, NULL, '2017-12-02 21:03:18', NULL, NULL),
	(3, 'Ruang Laboratorium', NULL, NULL, '2017-12-02 21:03:32', NULL, NULL),
	(4, 'Ruang Perpustakaan', NULL, NULL, '2017-12-02 21:03:46', NULL, NULL),
	(5, 'Kartu Mahasiswa', NULL, NULL, '2017-12-02 21:03:58', NULL, NULL),
	(6, 'Free Wifi', NULL, NULL, '2017-12-02 21:04:03', NULL, NULL),
	(7, 'Beasiswa', '20171202094720.jpg', NULL, '2017-12-02 00:00:00', NULL, '2017-12-02 13:47:51');
/*!40000 ALTER TABLE `fasilitas` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.general_settings
CREATE TABLE IF NOT EXISTS `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ta_start` date NOT NULL,
  `ta_end` date NOT NULL,
  `telp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maps` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.general_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT IGNORE INTO `general_settings` (`id`, `nama`, `alamat1`, `alamat2`, `alamat3`, `ta_start`, `ta_end`, `telp`, `email`, `fb`, `twitter`, `gplus`, `maps`, `youtube`, `created_at`, `updated_at`) VALUES
	(1, 'STKIP SUAR BANGLI', 'Bangli', 'Jl.', NULL, '2017-06-01', '2018-07-01', '081238749696', 'mudanakomang@hotmail.com', 'https://www.facebook.com/profile.php?id=100009558257340', NULL, NULL, '-8.462516, 115.350010', NULL, NULL, '2017-12-16 13:31:59');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.kalenders
CREATE TABLE IF NOT EXISTS `kalenders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allday` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.kalenders: ~0 rows (approximately)
/*!40000 ALTER TABLE `kalenders` DISABLE KEYS */;
/*!40000 ALTER TABLE `kalenders` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.migrations: ~14 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(10, '2014_10_12_000000_create_users_table', 1),
	(11, '2014_10_12_100000_create_password_resets_table', 1),
	(12, '2017_10_30_134749_entrust_setup_tables', 1),
	(13, '2017_11_12_113637_create_general_settings_table', 2),
	(14, '2017_11_16_122202_create_sliders_table', 3),
	(15, '2017_11_26_144042_create_profils_table', 4),
	(16, '2017_12_01_133447_create_program_studis_table', 5),
	(17, '2017_12_02_125012_create_fasilitas_table', 6),
	(19, '2017_12_04_141010_create_kalenders_table', 7),
	(20, '2017_12_14_052805_create_pedoman_akademiks_table', 8),
	(21, '2017_12_19_170240_create_penelitians_table', 9),
	(22, '2017_12_22_141718_create_pelatihan_bits_table', 10),
	(23, '2017_12_22_141751_create_prodi_bits_table', 10),
	(24, '2018_01_05_150410_create_beritas_table', 11);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.pedoman_akademiks
CREATE TABLE IF NOT EXISTS `pedoman_akademiks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.pedoman_akademiks: ~1 rows (approximately)
/*!40000 ALTER TABLE `pedoman_akademiks` DISABLE KEYS */;
INSERT IGNORE INTO `pedoman_akademiks` (`id`, `cover`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, 'cover.JPG', '2017-12-14', NULL, '2017-12-17 11:42:59');
/*!40000 ALTER TABLE `pedoman_akademiks` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.pelatihan_bits
CREATE TABLE IF NOT EXISTS `pelatihan_bits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isi` text COLLATE utf8_unicode_ci,
  `publishdate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.pelatihan_bits: ~1 rows (approximately)
/*!40000 ALTER TABLE `pelatihan_bits` DISABLE KEYS */;
INSERT IGNORE INTO `pelatihan_bits` (`id`, `isi`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, '<p>Visi Misi</p>', '2017-12-22 00:00:00', NULL, '2017-12-22 14:29:12');
/*!40000 ALTER TABLE `pelatihan_bits` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.penelitians
CREATE TABLE IF NOT EXISTS `penelitians` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isi` text COLLATE utf8_unicode_ci,
  `publishdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.penelitians: ~1 rows (approximately)
/*!40000 ALTER TABLE `penelitians` DISABLE KEYS */;
INSERT IGNORE INTO `penelitians` (`id`, `isi`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, '<p>Visi</p>', '2017-12-22', NULL, '2017-12-22 14:24:31');
/*!40000 ALTER TABLE `penelitians` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.permission_role: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.prodi_bits
CREATE TABLE IF NOT EXISTS `prodi_bits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prodi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.prodi_bits: ~0 rows (approximately)
/*!40000 ALTER TABLE `prodi_bits` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodi_bits` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.profils
CREATE TABLE IF NOT EXISTS `profils` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `publishdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.profils: ~6 rows (approximately)
/*!40000 ALTER TABLE `profils` DISABLE KEYS */;
INSERT IGNORE INTO `profils` (`id`, `attribute`, `value`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, 'Sambutan Ketua Yayasan', '<p>Om Swastiastu,</p>\r\n\r\n<p>Puji dan syukur kami panjatkan kehadapan Ida Sang Hyang Widhi Waca/Tuhan Yang Maha Esa berkat rahmat dan perkenankanNya, maka Website Undiknas &ndash; Denpasar dapat di luncurkan untuk kepentingan kalangan Civitas Akademika Undiknas dan masyarakat pada umumnya.</p>\r\n\r\n<p>Teknologi Informasi merupakan suatu kebutuhan bagi kita semua, baik masyarakat umum terlebih masyarakat ilmiah. Dengan Teknologi Informasi seolah-olah tidak ada batasnya suatu wilayah, tempat demikan juga waktu. Melalui Website Undiknas diharapkan mampu memberikan informasi tetang keberadaan Undiknas kepada masyarakat yang membutuhkan, demikian juga bagi kami. Bagi kami, informasi tentang keberadaan Undiknas ini diharapkan mendapat umpan balik berupa kritik dan saran yang konstruktif yang kami perlukan guna perbaikan dalam pelaksanaan Tri Dharma Perguruan Tinggi menjadi lebih baik dari sebelumnya.</p>\r\n\r\n<p>Komitmen kami adalah memberikan yang terbaik untuk masyarakat yang bergabung dengan Undiknas &ndash; Denpasar.</p>\r\n\r\n<p>Om Canti, Canti, Canti, Om</p>\r\n\r\n<p><br />\r\nRektor Undiknas &ndash; Denpasar,</p>\r\n\r\n<p>&nbsp;</p>', '2017-11-27 13:33:00', NULL, '2017-12-16 13:33:00'),
	(2, 'Sambutan Ketua STKIP Suar Bangli ', '<p>Om Swastiastu,</p>\r\n\r\n<p>Puji dan syukur kami panjatkan kehadapan Ida Sang Hyang Widhi Waca/Tuhan Yang Maha Esa berkat rahmat dan perkenankanNya, maka Website Undiknas &ndash; Denpasar dapat di luncurkan untuk kepentingan kalangan Civitas Akademika Undiknas dan masyarakat pada umumnya.</p>\r\n\r\n<p>Teknologi Informasi merupakan suatu kebutuhan bagi kita semua, baik masyarakat umum terlebih masyarakat ilmiah. Dengan Teknologi Informasi seolah-olah tidak ada batasnya suatu wilayah, tempat demikan juga waktu. Melalui Website Undiknas diharapkan mampu memberikan informasi tetang keberadaan Undiknas kepada masyarakat yang membutuhkan, demikian juga bagi kami. Bagi kami, informasi tentang keberadaan Undiknas ini diharapkan mendapat umpan balik berupa kritik dan saran yang konstruktif yang kami perlukan guna perbaikan dalam pelaksanaan Tri Dharma Perguruan Tinggi menjadi lebih baik dari sebelumnya.</p>\r\n\r\n<p>Komitmen kami adalah memberikan yang terbaik untuk masyarakat yang bergabung dengan Undiknas &ndash; Denpasar.</p>\r\n\r\n<p>Om Canti, Canti, Canti, Om</p>\r\n\r\n<p><br />\r\nRektor Undiknas &ndash; Denpasar,</p>\r\n\r\n<p>Prof. Gede Sri Darma, D.B.A.&nbsp;</p>', '2017-11-28 18:39:00', NULL, '2017-11-28 18:39:00'),
	(3, 'Sejarah STKIP Suar Bangli', '<p>Profil STKIP Suar Bangli</p>\r\n\r\n<p>1. Sambutan Ketua YAyasan Kresna Andhi MAndiri</p>\r\n\r\n<p>2. SAmbutan Ketua STKIP Suar Bangli</p>\r\n\r\n<p>3. Sejarah STKIP Suar Bangli</p>\r\n\r\n<p>4. VIsi dan Misi</p>\r\n\r\n<p>5. Logo STKIP Suar Bangli</p>\r\n\r\n<p>6. Struktur Organisasi</p>\r\n\r\n<p>Program Studi</p>\r\n\r\n<p>1. Pendidikan Bahasa dan Sastra Indonesia</p>\r\n\r\n<p>2. Pendidikan Bahasa Inggris</p>\r\n\r\n<p>3. Pendidikan Guru Sekolah DAsar (PGSD)</p>', '2017-12-02 13:54:08', NULL, '2017-12-01 13:54:08'),
	(4, 'Visi Misi', NULL, '2017-12-01 06:14:42', NULL, NULL),
	(5, 'Logo', NULL, '2017-12-01 06:14:51', NULL, NULL),
	(6, 'Struktur Organisasi', NULL, '2017-12-01 06:15:04', NULL, NULL);
/*!40000 ALTER TABLE `profils` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.program_studis
CREATE TABLE IF NOT EXISTS `program_studis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `publishdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.program_studis: ~3 rows (approximately)
/*!40000 ALTER TABLE `program_studis` DISABLE KEYS */;
INSERT IGNORE INTO `program_studis` (`id`, `attribute`, `value`, `publishdate`, `created_at`, `updated_at`) VALUES
	(1, 'Pendidikan Bahasa Dan Sastra Indonesia', '<p>Profil STKIP Suar Bangli</p>\r\n\r\n<p>1. Sambutan Ketua YAyasan Kresna Andhi MAndiri</p>\r\n\r\n<p>2. SAmbutan Ketua STKIP Suar Bangli</p>\r\n\r\n<p>3. Sejarah STKIP Suar Bangli</p>\r\n\r\n<p>4. VIsi dan Misi</p>\r\n\r\n<p>5. Logo STKIP Suar Bangli</p>\r\n\r\n<p>6. Struktur Organisasi</p>\r\n\r\n<p>Program Studi</p>\r\n\r\n<p>1. Pendidikan Bahasa dan Sastra Indonesia</p>\r\n\r\n<p>2. Pendidikan Bahasa Inggris</p>\r\n\r\n<p>3. Pendidikan Guru Sekolah DAsar (PGSD)</p>', '2017-12-01 13:57:14', NULL, '2017-12-01 13:57:14'),
	(2, 'Pendidikan Bahasa Inggris', '<p>Profil STKIP Suar Bangli</p>\r\n\r\n<p>1. Sambutan Ketua YAyasan Kresna Andhi MAndiri</p>\r\n\r\n<p>2. SAmbutan Ketua STKIP Suar Bangli</p>\r\n\r\n<p>3. Sejarah STKIP Suar Bangli</p>\r\n\r\n<p>4. VIsi dan Misi</p>\r\n\r\n<p>5. Logo STKIP Suar Bangli</p>\r\n\r\n<p>6. Struktur Organisasi</p>\r\n\r\n<p>Program Studi</p>\r\n\r\n<p>1. Pendidikan Bahasa dan Sastra Indonesia</p>\r\n\r\n<p>2. Pendidikan Bahasa Inggris</p>\r\n\r\n<p>3. Pendidikan Guru Sekolah DAsar (PGSD)</p>', '2017-12-01 13:57:20', NULL, '2017-12-01 13:57:20'),
	(3, 'Pendidikan Guru Sekolah Dasar', '<p>Profil STKIP Suar Bangli</p>\r\n\r\n<p>1. Sambutan Ketua YAyasan Kresna Andhi MAndiri</p>\r\n\r\n<p>2. SAmbutan Ketua STKIP Suar Bangli</p>\r\n\r\n<p>3. Sejarah STKIP Suar Bangli</p>\r\n\r\n<p>4. VIsi dan Misi</p>\r\n\r\n<p>5. Logo STKIP Suar Bangli</p>\r\n\r\n<p>6. Struktur Organisasi</p>\r\n\r\n<p>Program Studi</p>\r\n\r\n<p>1. Pendidikan Bahasa dan Sastra Indonesia</p>\r\n\r\n<p>2. Pendidikan Bahasa Inggris</p>\r\n\r\n<p>3. Pendidikan Guru Sekolah DAsar (PGSD)</p>', '2017-12-01 13:57:25', NULL, '2017-12-01 13:57:25');
/*!40000 ALTER TABLE `program_studis` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT IGNORE INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Web Admin', '', '2017-10-30 22:34:10', '2017-10-30 22:34:10'),
	(2, 'dosen', 'Dosen STKIP Suar Bangli', '', '2017-10-30 22:34:11', '2017-10-30 22:34:11');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.role_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT IGNORE INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 1),
	(7, 2);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.sliders: ~5 rows (approximately)
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT IGNORE INTO `sliders` (`id`, `judul`, `deskripsi`, `gambar`, `status`, `created_at`, `updated_at`) VALUES
	(4, 'Testing', '<p>Tally ERP 9 Crack Release 6.3.1 License Key Full Version Zip Download Tally ERP 9 Crack is the complete business management software. It enables you to manage all the aspects of your business assets.</p>', '20171122063838.jpg', '1', '2017-11-21 14:11:36', '2017-12-29 12:41:14'),
	(5, 'Testing', '<p>Tally ERP 9 Crack Release 6.3.1 License Key Full Version Zip Download Tally ERP 9 Crack is the complete business management software. It enables you to manage all the aspects of your business assets.</p>', '20171229083521.jpg', '1', '2017-11-21 14:12:01', '2017-12-29 12:35:21'),
	(6, 'Test', '<p>Tally ERP 9 Crack Release 6.3.1 License Key Full Version Zip Download Tally ERP 9 Crack is the complete business management software. It enables you to manage all the aspects of your business assets.</p>', '20171121065034.jpg', '1', '2017-11-21 18:50:34', '2017-12-29 12:38:29'),
	(7, 'Testing', '<p>dfgadfgadsf</p>', '20171121065117.jpg', '1', '2017-11-21 18:51:17', '2017-12-29 12:38:33'),
	(8, 'Testing  12', '<p>Tally ERP 9 Crack Release 6.3.1 License Key Full Version Zip Download Tally ERP 9 Crack is the complete business management software. It enables you to manage all the aspects of your business assets.</p>', '20171229084320.JPG', '1', '2017-12-29 12:43:20', '2017-12-29 12:43:20');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;


-- Dumping structure for table stkipsuar.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmpt_lahir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl_lahir` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `nik` (`nik`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table stkipsuar.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `nik`, `name`, `alamat`, `tmpt_lahir`, `tgl_lahir`, `email`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, '0', 'Admin STKIP Suar Bangli', NULL, NULL, NULL, 'admin@balicabby.com', 'admin', '$2y$10$NmBZ6sR8VMzMW.FjrMwflejX.cWWSOzdOTWYNz.L8sdZYuIklgt/W', '9M2iaOnxfTCZjtlPiZkJAiEZ8t0r9tumTSjaKuYK8EkSuavXNMVq6Khgh46u', '2017-10-30 22:34:11', '2017-12-27 15:43:20'),
	(7, '12345678', 'I Komang Mudana', 'Waringin', 'I Komang Mudana', '2017-12-27 00:00:00', 'mudanakomang@hotmail.com', '12345678', '$2y$10$oyOVHSjkYtXgiEPHN./Sg.UStE.ahzNwvNLQ4H96p3gGTw7zfWHNS', 'HC313qnD66K5g9JlbzVIfrpoUniaHpjtnTu0vCw80aWZZ0p8TzEQIXMsU7nX', '2017-12-24 13:15:27', '2017-12-27 15:54:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
