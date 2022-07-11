
ALTER TABLE `mailscanner`.`maillog` CHANGE `subject` `subject` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL ;
ALTER TABLE `mailscanner`.`maillog` CHANGE `headers` `headers` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog_ids` ADD `uid` BIGINT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`uid`);
ALTER TABLE `mailscanner`.`mtalog` CHANGE `msg_id` `msg_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog` CHANGE `relay` `relay_to` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog` CHANGE `dsn` `dsn` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog` CHANGE `status` `status_text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog` CHANGE `type` `status_code` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mailscanner`.`mtalog` CHANGE `host` `host` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `mtalog` CHANGE `timestamp` `relay_time` TIME NULL DEFAULT NULL;
ALTER TABLE `mtalog` ADD `relay_date` DATE NOT NULL AFTER `mtalog_id`, ADD INDEX (`relay_date`);
ALTER TABLE `mtalog` ADD `to_address` VARCHAR(100) NOT NULL AFTER `msg_id`, ADD INDEX (`to_address`);
ALTER TABLE `mailscanner`.`mtalog` DROP INDEX `mtalog_uniq`, ADD UNIQUE `mtalog_uniq` (`relay_time`, `host`(10), `status_code`(10), `msg_id`, `to_address`(20), `relay_to`) USING BTREE;
