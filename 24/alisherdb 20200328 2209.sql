--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 28.03.2020 22:09:54
-- Версия сервера: 5.5.5-10.3.13-MariaDB-log
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE alisherdb;

--
-- Удалить таблицу `berik_graduate_time`
--
DROP TABLE IF EXISTS berik_graduate_time;

--
-- Удалить таблицу `berikkaliyev_classroom`
--
DROP TABLE IF EXISTS berikkaliyev_classroom;

--
-- Удалить таблицу `berikkaliyev_day`
--
DROP TABLE IF EXISTS berikkaliyev_day;

--
-- Удалить таблицу `berik_lesson_num`
--
DROP TABLE IF EXISTS berik_lesson_num;

--
-- Удалить таблицу `berikkaliyev_graduate`
--
DROP TABLE IF EXISTS berikkaliyev_graduate;

--
-- Удалить таблицу `berikkaliyev_course`
--
DROP TABLE IF EXISTS berikkaliyev_course;

--
-- Удалить таблицу `berikkaliyev_student`
--
DROP TABLE IF EXISTS berikkaliyev_student;

--
-- Удалить таблицу `berikkaliyev_gruppa`
--
DROP TABLE IF EXISTS berikkaliyev_gruppa;

--
-- Удалить таблицу `berikkaliyev_special`
--
DROP TABLE IF EXISTS berikkaliyev_special;

--
-- Удалить таблицу `berikkaliyev_teacher`
--
DROP TABLE IF EXISTS berikkaliyev_teacher;

--
-- Удалить таблицу `berikkaliyev_otdel`
--
DROP TABLE IF EXISTS berikkaliyev_otdel;

--
-- Удалить таблицу `berikkaliyev_user`
--
DROP TABLE IF EXISTS berikkaliyev_user;

--
-- Удалить таблицу `berikkaliyev_gender`
--
DROP TABLE IF EXISTS berikkaliyev_gender;

--
-- Установка базы данных по умолчанию
--
USE alisherdb;

--
-- Создать таблицу `berikkaliyev_gender`
--
CREATE TABLE berikkaliyev_gender (
  gender_id tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (gender_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `berikkaliyev_user`
--
CREATE TABLE berikkaliyev_user (
  user_id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  lastname varchar(255) NOT NULL,
  firstname varchar(255) NOT NULL,
  patronomic varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  gender_id tinyint(4) UNSIGNED NOT NULL,
  birthday date NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_user
ADD CONSTRAINT FK_berikkaliyev_user_berikkaliyev_gender_gender_id FOREIGN KEY (gender_id)
REFERENCES berikkaliyev_gender (gender_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_otdel`
--
CREATE TABLE berikkaliyev_otdel (
  otdel_id smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (otdel_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `berikkaliyev_teacher`
--
CREATE TABLE berikkaliyev_teacher (
  user_id bigint(20) UNSIGNED NOT NULL,
  otdel_id smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_teacher
ADD CONSTRAINT FK_berikkaliyev_teacher_berikkaliyev_otdel_otdel_id FOREIGN KEY (otdel_id)
REFERENCES berikkaliyev_otdel (otdel_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_teacher
ADD CONSTRAINT FK_berikkaliyev_teacher_berikkaliyev_user_user_id FOREIGN KEY (user_id)
REFERENCES berikkaliyev_user (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_special`
--
CREATE TABLE berikkaliyev_special (
  special_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  otdel_id smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (special_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_special
ADD CONSTRAINT FK_berikkaliyev_special_berikkaliyev_otdel_otdel_id FOREIGN KEY (otdel_id)
REFERENCES berikkaliyev_otdel (otdel_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_gruppa`
--
CREATE TABLE berikkaliyev_gruppa (
  gruppa_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  special_id int(11) UNSIGNED NOT NULL,
  date_begin date NOT NULL,
  date_end date NOT NULL,
  PRIMARY KEY (gruppa_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_gruppa
ADD CONSTRAINT FK_berikkaliyev_gruppa_berikkaliyev_special_special_id FOREIGN KEY (special_id)
REFERENCES berikkaliyev_special (special_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_student`
--
CREATE TABLE berikkaliyev_student (
  user_id bigint(20) UNSIGNED NOT NULL,
  gruppa_id int(11) UNSIGNED NOT NULL,
  `num zach` varchar(255) NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_student
ADD CONSTRAINT FK_berikkaliyev_student_berikkaliyev_gruppa_gruppa_id FOREIGN KEY (gruppa_id)
REFERENCES berikkaliyev_gruppa (gruppa_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_student
ADD CONSTRAINT FK_berikkaliyev_student_berikkaliyev_user_user_id FOREIGN KEY (user_id)
REFERENCES berikkaliyev_user (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_course`
--
CREATE TABLE berikkaliyev_course (
  course_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  special_id int(11) UNSIGNED NOT NULL,
  hours smallint(6) NOT NULL,
  PRIMARY KEY (course_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_course
ADD CONSTRAINT FK_berikkaliyev_course_berikkaliyev_special_special_id FOREIGN KEY (special_id)
REFERENCES berikkaliyev_special (special_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berikkaliyev_graduate`
--
CREATE TABLE berikkaliyev_graduate (
  graduate_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  gruppa_id int(11) UNSIGNED NOT NULL,
  course_id int(11) UNSIGNED NOT NULL,
  user_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (graduate_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_graduate
ADD CONSTRAINT FK_berikkaliyev_graduate_berikkaliyev_course_course_id FOREIGN KEY (course_id)
REFERENCES berikkaliyev_course (course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_graduate
ADD CONSTRAINT FK_berikkaliyev_graduate_berikkaliyev_gruppa_gruppa_id FOREIGN KEY (gruppa_id)
REFERENCES berikkaliyev_gruppa (gruppa_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berikkaliyev_graduate
ADD CONSTRAINT FK_berikkaliyev_graduate_berikkaliyev_teacher_user_id FOREIGN KEY (user_id)
REFERENCES berikkaliyev_teacher (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `berik_lesson_num`
--
CREATE TABLE berik_lesson_num (
  lesson_num_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  time_lesson time NOT NULL,
  year_lesson year(4) NOT NULL,
  PRIMARY KEY (lesson_num_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `berikkaliyev_day`
--
CREATE TABLE berikkaliyev_day (
  day_id tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (day_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `berikkaliyev_classroom`
--
CREATE TABLE berikkaliyev_classroom (
  classroom_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (classroom_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `berik_graduate_time`
--
CREATE TABLE berik_graduate_time (
  graduate_time_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  graduate_id int(11) UNSIGNED NOT NULL,
  day_id tinyint(4) UNSIGNED NOT NULL,
  lesson_num_id int(11) UNSIGNED NOT NULL,
  classroom_id int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (graduate_time_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE berik_graduate_time
ADD CONSTRAINT FK_berik_graduate_time_berik_lesson_num_lesson_num_id FOREIGN KEY (lesson_num_id)
REFERENCES berik_lesson_num (lesson_num_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berik_graduate_time
ADD CONSTRAINT FK_berik_graduate_time_berikkaliyev_classroom_classroom_id FOREIGN KEY (classroom_id)
REFERENCES berikkaliyev_classroom (classroom_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berik_graduate_time
ADD CONSTRAINT FK_berikkaliyev_graduate_time_berikkaliyev_day_day_id FOREIGN KEY (day_id)
REFERENCES berikkaliyev_day (day_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE berik_graduate_time
ADD CONSTRAINT FK_berikkaliyev_graduate_time_berikkaliyev_graduate_graduate_id FOREIGN KEY (graduate_id)
REFERENCES berikkaliyev_graduate (graduate_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы berikkaliyev_gender
--
INSERT INTO berikkaliyev_gender VALUES
(1, 'Мужской'),
(2, 'Женский');

-- 
-- Вывод данных для таблицы berikkaliyev_user
--
INSERT INTO berikkaliyev_user VALUES
(1, 'Иванов', 'Иван', 'Иванович', '1337', 'локо', 1, '1975-05-02'),
(2, 'Петров', 'Петр', 'Петрович', 'икона', '78в8', 1, '1980-08-06'),
(3, 'Козлов', 'Иван', 'Афанасьевич', '78962', 'вв77', 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федоровна', 'а786', '222а2а2а', 2, '1990-00-20'),
(5, 'Васильев', 'Феофан', 'Александрович', '8521212', 'ввввв', 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', 'а45', 'вввв8вв8', 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', '85555', 'еара', 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', 'валла', 'далллл', 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', 'марко', 'ула', 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Радионовна', 'наров', 'ссссс', 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', 'ходор', 'авв5в55', 1, '2000-02-20'),
(12, 'Котова', 'Аурелия', 'Ароновна', 'зааад', 'вввссссссе', 2, '2002-12-19');

-- 
-- Вывод данных для таблицы berikkaliyev_otdel
--
INSERT INTO berikkaliyev_otdel VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- 
-- Вывод данных для таблицы berikkaliyev_special
--
INSERT INTO berikkaliyev_special VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'Программное обеспечение ВТ и ПО', 1),
(6, 'Строительство и эксплуатация зданий и сооружений', 2);

-- 
-- Вывод данных для таблицы berikkaliyev_teacher
--
INSERT INTO berikkaliyev_teacher VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 2),
(4, 3);

-- 
-- Вывод данных для таблицы berikkaliyev_gruppa
--
INSERT INTO berikkaliyev_gruppa VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2017-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 6, '2015-09-01', '2019-09-01'),
(6, '404 П', 5, '2014-09-01', '2017-07-01'),
(7, '303 ЭЛ', 4, '2014-09-01', '2018-07-01');

-- 
-- Вывод данных для таблицы berikkaliyev_course
--
INSERT INTO berikkaliyev_course VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедиа технологии', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника ', 4, 108),
(7, 'Автоматизированные информационные системы', 1, 86);

-- 
-- Вывод данных для таблицы berik_lesson_num
--
INSERT INTO berik_lesson_num VALUES
(1, 'Физика', '17:45:00', 2004),
(2, 'Химия', '12:50:00', 2019),
(3, 'Численные методы', '21:40:00', 2045),
(4, 'Музыка', '08:10:00', 1985),
(6, 'Веб-программирование', '16:25:00', 2006);

-- 
-- Вывод данных для таблицы berikkaliyev_graduate
--
INSERT INTO berikkaliyev_graduate VALUES
(1, 6, 4, 4),
(2, 3, 5, 1),
(3, 5, 3, 2),
(4, 6, 7, 4),
(5, 1, 4, 2),
(6, 6, 6, 5),
(7, 6, 1, 5);

-- 
-- Вывод данных для таблицы berikkaliyev_day
--
INSERT INTO berikkaliyev_day VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- 
-- Вывод данных для таблицы berikkaliyev_classroom
--
INSERT INTO berikkaliyev_classroom VALUES
(1, '9696'),
(2, '8411'),
(3, '9962'),
(4, '8552'),
(5, '2855'),
(6, '9697'),
(7, '2526'),
(8, '7115');

-- 
-- Вывод данных для таблицы berik_graduate_time
--
INSERT INTO berik_graduate_time VALUES
(1, 6, 4, 4, 4),
(2, 1, 3, 4, 6),
(3, 3, 7, 3, 7),
(4, 6, 5, 1, 8),
(5, 1, 1, 1, 1),
(6, 4, 6, 6, 3),
(7, 4, 4, 4, 4);

-- 
-- Вывод данных для таблицы berikkaliyev_student
--
INSERT INTO berikkaliyev_student VALUES
(6, 1, 'K1020'),
(7, 2, 'А5292'),
(8, 2, 'В8578'),
(9, 5, 'Р5285');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;