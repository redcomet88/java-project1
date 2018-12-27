DROP TABLE tb_award;
CREATE TABLE tb_award (index int NOT NULL AUTO_INCREMENT, award_name varchar(80), stock int, image varchar(255), column1 int, column2 varchar(255), PRIMARY KEY (index)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (1, ''30元话费'', 100, null, 0, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (2, ''iphoneX'', 2, null, 0, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (3, ''未中奖'', 9999, null, 0, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (4, ''MackBook Pro'', 1, null, 0, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (5, ''超强游戏主机'', 10, ''https://img12.360buyimg.com/n7/jfs/t4807/209/1436278963/496606/8e486549/58f0884eNcec87657.jpg'', 1, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (6, ''海南3日游'', 5, null, 0, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (7, ''魔声耳机'', 55, ''https://img11.360buyimg.com/n7/jfs/t3187/325/423764794/213696/f4eb1dbd/57b68142Nbe104228.jpg'', 1, null);
INSERT INTO tb_award (index, award_name, stock, image, column1, column2) VALUES (8, ''火星一日游'', 12, null, 0, null);
DROP TABLE tb_award_record;
CREATE TABLE tb_award_record (id int NOT NULL AUTO_INCREMENT, award_index int, userid varchar(255), finished varchar(2), column1 int, column2 varchar(255), PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tb_award_record (id, award_index, userid, finished, column1, column2) VALUES (1, 6, ''4'', ''0'', 0, '''');
INSERT INTO tb_award_record (id, award_index, userid, finished, column1, column2) VALUES (2, 6, ''4'', ''0'', 0, '''');
DROP TABLE tb_criticism;
CREATE TABLE tb_criticism (criticismId int NOT NULL AUTO_INCREMENT, criticismContent text, employeeId int, criticismTime datetime, messageId int, PRIMARY KEY (criticismId), INDEX fk_criticism_message (messageId), INDEX fk_criticism_employee (employeeId)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE tb_employee;
CREATE TABLE tb_employee (employeeId int NOT NULL AUTO_INCREMENT, employeeName varchar(255), employeeSex varchar(255), employeeBirth date, employeePhone varchar(255), employeePlace varchar(255), joinTime date, employeePassword varchar(255), isLead bit, PRIMARY KEY (employeeId), INDEX employeeId (employeeId)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tb_employee (employeeId, employeeName, employeeSex, employeeBirth, employeePhone, employeePlace, joinTime, employeePassword, isLead) VALUES (1, ''万涛'', ''male'', ''1997-12-31'', ''18221390332'', ''上海浦东新区'', ''2017-12-31'', ''123'', false);
INSERT INTO tb_employee (employeeId, employeeName, employeeSex, employeeBirth, employeePhone, employeePlace, joinTime, employeePassword, isLead) VALUES (2, ''admin'', ''female'', ''1993-12-31'', ''15773272278'', ''湖南常德'', ''2017-12-31'', ''123'', false);
INSERT INTO tb_employee (employeeId, employeeName, employeeSex, employeeBirth, employeePhone, employeePlace, joinTime, employeePassword, isLead) VALUES (3, ''jack'', ''male'', ''2017-12-31'', ''18899882212'', ''南京草场门'', ''2017-12-31'', ''123'', false);
INSERT INTO tb_employee (employeeId, employeeName, employeeSex, employeeBirth, employeePhone, employeePlace, joinTime, employeePassword, isLead) VALUES (4, ''123'', ''男'', ''2017-12-31'', ''8908080'', ''9808089'', ''2017-12-31'', ''11'', false);
DROP TABLE tb_message;
CREATE TABLE tb_message (messageId int NOT NULL AUTO_INCREMENT, messageTitle varchar(255), messageContent text, employeeId int, publishTime datetime, PRIMARY KEY (messageId), INDEX fk_message_employee (employeeId)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tb_message (messageId, messageTitle, messageContent, employeeId, publishTime) VALUES (1, ''致橡树'', ''我如果爱你——
绝不像攀援的凌霄花，
借你的高枝炫耀自己；
我如果爱你——
绝不学痴情的鸟儿，
为绿荫重复单调的歌曲；
也不止像泉源，
常年送来清凉的慰藉；
也不止像险峰，
增加你的高度，衬托你的威仪。'', 1, ''2018-05-09 00:00:00'');
DROP TABLE tb_reply;
CREATE TABLE tb_reply (replyId int NOT NULL AUTO_INCREMENT, replyContent text, employeeId int, replyTime datetime, messageId int, PRIMARY KEY (replyId), INDEX fk_reply_employee (employeeId), INDEX fk_reply_message (messageId)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tb_reply (replyId, replyContent, employeeId, replyTime, messageId) VALUES (1, ''这首诗写的太好了'', 1, ''2018-05-12 00:00:00'', 1);
ALTER TABLE tb_criticism ADD CONSTRAINT fk_criticism_employee FOREIGN KEY (employeeId) REFERENCES tb_employee (employeeId) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE tb_criticism ADD CONSTRAINT fk_criticism_message FOREIGN KEY (messageId) REFERENCES tb_message (messageId) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE tb_message ADD CONSTRAINT fk_message_employee FOREIGN KEY (employeeId) REFERENCES tb_employee (employeeId) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE tb_reply ADD CONSTRAINT fk_reply_employee FOREIGN KEY (employeeId) REFERENCES tb_employee (employeeId) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE tb_reply ADD CONSTRAINT fk_reply_message FOREIGN KEY (messageId) REFERENCES tb_message (messageId) ON DELETE CASCADE ON UPDATE CASCADE;
