
CREATE TABLE IF NOT EXISTS "imap" ("user_id" bigint, "host" varchar(255), "port" integer, "username" varchar(255), "password" varchar(255), "modified_date" datetime default CURRENT_TIMESTAMP, "tls" BOOLEAN, "enabled" BOOLEAN, "folder" varchar(255), "restrict_domain" varchar(255), "delete_reported_campaign_email" BOOLEAN, "last_login" datetime, "imap_freq" integer);


DROP TABLE "imap";
