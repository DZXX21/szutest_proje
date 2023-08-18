

CREATE TABLE IF NOT EXISTS "mail_logs" (
    "id" integer primary key autoincrement,
    "campaign_id" integer,
    "user_id" integer,
    "send_date" datetime,
    "send_attempt" integer,
    "r_id" varchar(255),
    "processing" boolean);


DROP TABLE "mail_logs"
