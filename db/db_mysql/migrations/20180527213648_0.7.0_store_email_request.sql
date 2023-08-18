

CREATE TABLE IF NOT EXISTS `email_requests` (
    `id` integer primary key auto_increment,
    `user_id` integer,
    `template_id` integer,
    `page_id` integer,
    `first_name` varchar(255),
    `last_name` varchar(255),
    `email` varchar(255),
    `position` varchar(255),
    `url` varchar(255),
    `r_id` varchar(255),
    `from_address` varchar(255)
);



DROP TABLE `email_requests`;
