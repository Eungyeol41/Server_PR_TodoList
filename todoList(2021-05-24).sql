-- todoList 접속
SHOW DATABASES;
USE todoList;

CREATE TABLE tbl_todoList(
	td_seq		BIGINT		PRIMARY KEY 	AUTO_INCREMENT,
	td_date		VARCHAR(10)	NOT NULL,
	td_time		VARCHAR(10)	NOT NULL,	
	td_todo		VARCHAR(50)	NOT NULL,	
	td_place	VARCHAR(125)		
);

INSERT INTO tbl_todoList(td_date, td_time, td_todo, td_place)
VALUES('2021-05-24', '09:13:57', '깃허브에 새 rp 만들어서 올리기', '한국경영원 인재개발원');