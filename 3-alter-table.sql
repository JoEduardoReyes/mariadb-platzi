USE metro_cdmx;
ALTER TABLE `stations`
MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (`id`);
-- ADD CONSTRAINT `trains_line_id_foreign`
-- FOREIGN KEY (`id`) REFERENCES `lines`(`id`)