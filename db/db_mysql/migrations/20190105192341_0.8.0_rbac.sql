
CREATE TABLE IF NOT EXISTS `roles` (
    `id`          INTEGER PRIMARY KEY AUTO_INCREMENT,
    `slug`        VARCHAR(255) NOT NULL UNIQUE,
    `name`        VARCHAR(255) NOT NULL UNIQUE,
    `description` VARCHAR(255)
);

ALTER TABLE `users` ADD COLUMN `role_id` INTEGER;

CREATE TABLE IF NOT EXISTS `permissions` (
    `id`          INTEGER PRIMARY KEY AUTO_INCREMENT,
    `slug`        VARCHAR(255) NOT NULL UNIQUE,
    `name`        VARCHAR(255) NOT NULL UNIQUE,
    `description` VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS `role_permissions` (
    `role_id`       INTEGER NOT NULL,
    `permission_id` INTEGER NOT NULL
);

INSERT INTO `roles` (`slug`, `name`, `description`)
VALUES
    ("admin", "Admin", "System administrator with full permissions"),
    ("user", "User", "User role with edit access to objects and campaigns");

INSERT INTO `permissions` (`slug`, `name`, `description`)
VALUES
    ("view_objects", "View Objects", "View objects in Gophish"),
    ("modify_objects", "Modify Objects", "Create and edit objects in Gophish"),
    ("modify_system", "Modify System", "Manage system-wide configuration");


UPDATE `users` SET `role_id`=(
    SELECT `id` FROM `roles` WHERE `slug`="admin")
WHERE `id`=(
    SELECT `id` FROM (
        SELECT * FROM `users`
    ) as u WHERE `username`="admin"
    OR `id`=(
        SELECT MIN(`id`) FROM (
            SELECT * FROM `users`
        ) as u
    ) LIMIT 1);

.
UPDATE `users` SET `role_id`=(
    SELECT `id` FROM `roles` AS role_id WHERE `slug`="user")
WHERE role_id IS NULL;



INSERT INTO `role_permissions` (`role_id`, `permission_id`)
SELECT r.id, p.id FROM roles AS r, `permissions` AS p
WHERE r.id IN (SELECT `id` FROM roles WHERE `slug`="admin" OR `slug`="user")
AND p.id=(SELECT `id` FROM `permissions` WHERE `slug`="view_objects");

-
INSERT INTO `role_permissions` (`role_id`, `permission_id`)
SELECT r.id, p.id FROM roles AS r, `permissions` AS p
WHERE r.id IN (SELECT `id` FROM roles WHERE `slug`="admin" OR `slug`="user")
AND p.id=(SELECT `id` FROM `permissions` WHERE `slug`="modify_objects");


INSERT INTO `role_permissions` (`role_id`, `permission_id`)
SELECT r.id, p.id FROM roles AS r, `permissions` AS p
WHERE r.id IN (SELECT `id` FROM roles WHERE `slug`="admin")
AND p.id=(SELECT `id` FROM `permissions` WHERE `slug`="modify_system");


DROP TABLE `roles`
DROP TABLE `user_roles`
DROP TABLE `permissions`
