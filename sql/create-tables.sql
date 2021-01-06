CREATE TABLE `Application_Notes` (
    `id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `application_id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `date_recorded` DATETIME NOT NULL,
    `content` TEXT COLLATE UTF8_UNICODE_CI,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `application_id` (`application_id`),
    CONSTRAINT `Application_Notes_ibfk_1` FOREIGN KEY (`application_id`)
        REFERENCES `Applications` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

CREATE TABLE `Application_Appointments` (
    `id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `application_id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `time_start` DATETIME NOT NULL,
    `time_end` DATETIME DEFAULT NULL,
    `location_address_1` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_address_2` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_city` VARCHAR(50) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_state` CHAR(2) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_zip` VARCHAR(10) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `note` TEXT COLLATE UTF8_UNICODE_CI,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `application_id` (`application_id`),
    CONSTRAINT `Application_Appointments_ibfk_1` FOREIGN KEY (`application_id`)
        REFERENCES `Applications` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

CREATE TABLE `Application_Statuses` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(50) COLLATE UTF8_UNICODE_CI NOT NULL,
    `description` VARCHAR(200) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    UNIQUE KEY `status` (`status`)
)  ENGINE=INNODB AUTO_INCREMENT=28 DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

CREATE TABLE `Applications` (
    `id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `company_id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `job_title` VARCHAR(100) COLLATE UTF8_UNICODE_CI NOT NULL,
    `job_description` TEXT COLLATE UTF8_UNICODE_CI,
    `compensation_amount` DECIMAL(9 , 2 ) DEFAULT NULL,
    `compensation_interval` ENUM('year', 'hour', 'day', 'month', 'week', 'other') COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `date_applied` DATETIME NOT NULL,
    `data_recorded` DATETIME NOT NULL,
    `application_status_id` INT(10) UNSIGNED NOT NULL,
    `location_address_1` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_address_2` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_city` VARCHAR(50) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_state` CHAR(2) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_zip` VARCHAR(10) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `phone_number` CHAR(9) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `company_id` (`company_id`),
    KEY `application_status_id` (`application_status_id`),
    CONSTRAINT `Applications_ibfk_1` FOREIGN KEY (`company_id`)
        REFERENCES `Companies` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Applications_ibfk_2` FOREIGN KEY (`application_status_id`)
        REFERENCES `Application_Statuses` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

CREATE TABLE `Companies` (
    `id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `user_id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `company_name` VARCHAR(100) COLLATE UTF8_UNICODE_CI NOT NULL,
    `location_address_1` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_address_2` VARCHAR(100) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_city` VARCHAR(50) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_state` CHAR(2) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `location_zip` VARCHAR(10) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `phone_number` VARCHAR(9) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `website` VARCHAR(250) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `Companies_ibfk_1` FOREIGN KEY (`user_id`)
        REFERENCES `Users` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;

CREATE TABLE `Users` (
    `id` CHAR(36) COLLATE UTF8_UNICODE_CI NOT NULL,
    `name_first` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `name_last` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `email` VARCHAR(100) COLLATE UTF8_UNICODE_CI NOT NULL,
    `password` VARCHAR(250) COLLATE UTF8_UNICODE_CI NOT NULL,
    `date_created` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    UNIQUE KEY `email_UNIQUE` (`email`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;
