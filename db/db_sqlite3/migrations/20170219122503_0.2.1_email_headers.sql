

CREATE TABLE IF NOT EXISTS headers(
	id integer primary key autoincrement,
	key varchar(255),
	value varchar(255),
	"smtp_id" bigint
);

DROP TABLE headers;
