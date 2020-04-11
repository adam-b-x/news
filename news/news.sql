CREATE TABLE msgs(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT,
	category INTEGER,
	description TEXT,
	source TEXT,
	datetime INTEGER
)

CREATE TABLE category(
	id INTEGER,
	name TEXT
)

INSERT INTO category(id, name)
SELECT 1 as id, '��������' as name
UNION SELECT 2 as id, '��������' as name
UNION SELECT 3 as id, '�����' as name 