-- crear las tablas
USE metro_cdmx;
-- creacion de la tablas para las lineas
CREATE TABLE IF NOT EXISTS `lines` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `color` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- creacion de la tabla para las estaciones
CREATE TABLE IF NOT EXISTS `stations` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- Creacion de la tabla para los trenes
CREATE TABLE IF NOT EXISTS `trains` (
  `serial_number` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `line_id` BIGINT(20) UNSIGNED NOT NULL,
  `type` TINYINT(4) NOT NULL,
  `year` INT(4) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (serial_number),
  CONSTRAINT `fk_line` FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- creacion de la tabla para las ubicaciones
CREATE TABLE IF NOT EXISTS `locations` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `station_id` BIGINT(20) UNSIGNED NOT NULL,
  `location` POINT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT `fk_station` FOREIGN KEY (`station_id`) REFERENCES `stations`(`id`)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- Tabla de uso mas a futuro
CREATE TABLE `stations_delete` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;