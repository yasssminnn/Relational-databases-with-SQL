CREATE TABLE arena (
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE,
SIZE int NOT NULL Default 100
) ;

CREATE TABLE team
(
ID int PRIMARY KEY ,
CITY varchar NOT NULL UNIQUE ,
NAME varchar NOT NULL,
COACH_NAME varchar NOT NULL UNIQUE ,
ARENA_ID integer NOT NULL , 
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

 CREATE TABLE player
(
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE, 
POSITION varchar NOT NULL, 
HEIGHT numeric NOT NULL CHECK (HEIGHT>0), 
WEIGHT numeric NOT NULL CHECK (WEIGHT>0), 
SALARY numeric NOT NULL CHECK (SALARY>0), 
TEAM_ID int NOT NULL , 
foreign key (TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

CREATE TABLE game 
(
ID int PRIMARY KEY, 
OWNER_TEAM_ID int NOT NULL UNIQUE, 
foreign key (OWNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
GUEST_TEAM_ID int NOT NULL UNIQUE, 
foreign key (GUEST_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
GAME_DATE date NOT NULL,  
WINNER_TEAM_ID int NOT NULL, 
foreign key (WINNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
OWNER_SCORE int NOT NULL default 0 CHECK (OWNER_SCORE>=0), 
GUEST_SCORE int NOT NULL default 0 CHECK (GUEST_SCORE>=0), 
ARENA_ID int NOT NULL,
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

CREATE TABLE game
(
ID int PRIMARY KEY, 
OWNER_TEAM_ID int NOT NULL UNIQUE, 
GUEST_TEAM_ID int NOT NULL UNIQUE,  
GAME_DATE date NOT NULL,  
WINNER_TEAM_ID int NOT NULL, 
OWNER_SCORE int NOT NULL default 0 CHECK (OWNER_SCORE>=0), 
GUEST_SCORE int NOT NULL default 0 CHECK (GUEST_SCORE>=0), 
ARENA_ID int NOT NULL,
foreign key (OWNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (GUEST_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (WINNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE 
) ;


CREATE TABLE arena (
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE,
SIZE int NOT NULL Default 100
) ;

CREATE TABLE team
(
ID int PRIMARY KEY ,
CITY varchar NOT NULL UNIQUE ,
NAME varchar NOT NULL,
COACH_NAME varchar NOT NULL UNIQUE ,
ARENA_ID integer NOT NULL , 
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;
i
 CREATE TABLE player
(
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE, 
POSITION varchar NOT NULL, 
HEIGHT numeric NOT NULL CHECK (HEIGHT>0), 
WEIGHT numeric NOT NULL CHECK (WEIGHT>0), 
SALARY numeric NOT NULL CHECK (SALARY>0), 
TEAM_ID int NOT NULL , 
foreign key (TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

CREATE TABLE game
(
ID int PRIMARY KEY, 
OWNER_TEAM_ID int NOT NULL, 
GUEST_TEAM_ID int NOT NULL,  
GAME_DATE date NOT NULL,  
WINNER_TEAM_ID int NOT NULL, 
OWNER_SCORE int NOT NULL default 0 CHECK (OWNER_SCORE>=0), 
GUEST_SCORE int NOT NULL default 0 CHECK (GUEST_SCORE>=0), 
ARENA_ID int NOT NULL,
foreign key (OWNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (GUEST_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (WINNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE 
) ;

INSERT INTO arena (ID, NAME, SIZE) VALUES
 ("10", "Палау Блауграна", "8250"),
 ("20", "Визинк-Центр - Паласио де Депортес", "15500"),
 ("30", "УСК ЦСКА им. А.Я. Гомельского", "5000"), 
 ("40", "Пис энд Френдшип Стадиум", "12000"), 
 ("50", "СИБУР Арена", "7140") ;

INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES
 ("10", "Барселона", "Барселона", "Шарунас Ясикявичюс", "10"), 
 ("20", "Мадрид", "Реал Мадрид", "Пабло Ласо", "20"), 
 ("30", "Москва", "ЦСКА", "Димитрис Итудис", "30"), 
 ("40", "Пирей", "Олимпиакос", "Георгиос Барцокас","40"), 
 ("50", "Санкт-Петербург", "Зенит", "Хавьер Паскуаль", "50") ;

INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID) VALUES
("10" , "Рафа Вильяр" , "защитник" , "188" , "85" , "100000" , "10" ) , 
("20" , "Кайл Курич" , "защитник" , "193" , "85" , "100000" , "10" ) , 
("30" , "Ибу Дьянко Баджи" , "центровой" , " 211" , "103 " , "200000" , "10" ) , 
("40" , "Ник Калатес" , "разыгрывающий" , "198" , "97" , "150000" , "10" ) , 
("50" , "Никола Миротич" , " форвард" , "208 " , "107" , " 175000" , "10" ) , 
("60" , "Джейси Кэрролл" , " защитник " , "188" , " 82" , "175000" , "20" ) , 
("70" , "Эли Джон Ндиайе" , "центровой" , "203" , "110" , "275000" , "20" ) , 
("80" , "Уолтер Тавареш" , " центровой " , "220" , " 120" , "273000" , "20" ) , 
("90" , "Томас Давид Эртель" , "разыгрывающий " , "189" , " 88" , " 173000 " , "20" ) , 
("100 " , "Гершон Ябуселе " , " форвард " , " 203 " , " 118 " , "99000 " , "20" ) , 
("110 " , "Габриэль Иффе Лундберг " , " защитник " , " 193 " , "96 " , "101000 " , " 30 " ) , 
("120 " , "Юрий Умрихин " , " защитник " , " 190 " , " 75 " , "251000" , " 30 " ) , 
("130 " , "Иван Анатольевич Ухов " , " разыгрывающий " , "193 " , "77 " , " 175000 " , " 30 " ) ,
("140 " , "Александр Хоменко" , " разыгрывающий " , " 192 " , "85 " , " 375000 " , " 30 " ) , 
("150 " , "Андрей Лопатин " , "лёгкий форвард " , " 208 " , "92 " , "205000 " , " 30 " ) , 
("160 " , "Тайлер Дорси " , "защитник " , " 193 " , " 83" , "205000" , " 40 " ) , 
("170 " , "Яннулис Ларенцакис " , "защитник " , " 196 " , " 87" , "75000 " , " 40 " ) , 
("180 " , "Хассан Мартин " , "центровой" , " 201 " , " 107 " , "375000" , " 40 " ) , 
("190 " , "Михалис Лунцис " , "разыгрывающий" , " 195 " , " 90" , " 475000 " , " 40 " ) , 
("200 " , "Георгиос Принтезис " , "форвард" , " 205 " , " 104 " , "105000 " , " 40 " ) , 
("210 " , "Билли Джеймс Бэрон " , " защитник " , " 188 " , " 88" , "75000 " , " 50 " ) , 
("220 " , "Артурас Гудайтис " , " центровой " , " 208 " , " 99" , " 165000 " , " 50 " ) , 
("230 " , "Денис Захаров " , " разыгрывающий " , " 192 " , "88 " , "163000 " , " 50 " ) , 
("240 " , " Миндаугас Кузминскас " , " лёгкий форвард " , " 204 " , " 93 " , " 295000 " , " 50 " ) , 
("250 " , " Алекс Пойтресс " , " форвард " , " 201 " , " 108 " , "247000 " , " 50 " ) ;

INSERT INTO game (ID, OWNER_TEAM_ID	, GUEST_TEAM_ID, GAME_DATE, WINNER_TEAM_ID, OWNER_SCORE, GUEST_SCORE	, ARENA_ID) VALUES
(" 10 " , " 10 " , " 50 " , " 2021-10-22 " , " 20 " , " 84 " , " 58 " , " 10 " ) , 
(" 20 " , " 10 " , " 30 " , " 2021-11-17 " , " 20 " , " 81 " , " 73 " , " 10 " ) , 
(" 30 " , " 10 " , " 20 " , " 2021-10-12 " , " 20 " , " 93 " , " 80 " , " 10 " ) , 
(" 40 " , " 10 " , " 40 " , " 2021-10-15 " , " 20 " , " 83 " , " 68 " , " 10 " ) , 
(" 50 " , " 50 " , " 20 " , " 2022-12-15 " , " 20 " , " 68 " , " 75 " , " 50 " ) , 
(" 60 " , " 50 " , " 30 " , " 2022-01-15 " , " 30 " , " 67 " , " 77 " , " 50 " ) , 
(" 70 " , " 50 " , " 40 " , " 2022-10-20 " , " 50 " , " 84 " , " 78 " , " 50 " ) , 
(" 80 " , " 20 " , " 30 " , " 2021-10-28 " , " 20 " , " 71 " , " 65 " , " 20 " ) , 
(" 90 " , " 20 " , " 40 " , " 2022-02-01 " , " 20 " , " 75 " , " 67 " , " 20 " ) , 
(" 100 " , " 30 " , " 40 " , " 2022-02-02 " , " 30 " , " 79 " , " 78 " , " 30 " ) ; 



CREATE TABLE team_new AS SELECT team.id, team.city, team.name, team.coach_name, arena.name AS ARENA FROM team JOIN arena ON team.arena_id = arena.id;

CREATE TABLE player_new AS SELECT player.id, player.name, player.position, player.height, player.weight, player.salary, team.name AS TEAM FROM player JOIN team ON player.team_id = team.id;

CREATE TABLE team_1 AS SELECT ID, NAME FROM TEAM;
CREATE TABLE team_2 AS SELECT ID, NAME FROM TEAM;


CREATE TABLE game_new AS SELECT game.id, team.name AS OWNER_TEAM, team_1.name AS GUEST_TEAM, game.game_date, team_2.name as WINNER_TEAM, game.OWNER_SCORE, game.GUEST_SCORE, arena.name AS ARENA
FROM game 
JOIN team ON game.OWNER_TEAM_ID = team.id
JOIN team_1 ON game.GUEST_TEAM_ID = team_1.id
JOIN team_2 ON game.WINNER_TEAM_ID = team_2.id 
JOIN arena ON game.ARENA_ID = arena.id;
 
SELECT NAME FROM arena WHERE SIZE>9000
ORDER BY SIZE; 

SELECT NAME FROM player WHERE POSITION IN ( "форвард", "защитник", " форвард", " защитник", "форвард ", "защитник ", " форвард ", " защитник " )
ORDER BY NAME DESC;

SELECT NAME FROM player WHERE HEIGHT>215 OR WEIGHT>120
ORDER BY NAME;


CREATE TABLE arena (
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE,
SIZE int NOT NULL Default 100
) ;

CREATE TABLE team
(
ID int PRIMARY KEY ,
CITY varchar NOT NULL UNIQUE ,
NAME varchar NOT NULL,
COACH_NAME varchar NOT NULL UNIQUE ,
ARENA_ID integer NOT NULL , 
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

 CREATE TABLE player
(
ID int PRIMARY KEY ,
NAME varchar NOT NULL UNIQUE, 
POSITION varchar NOT NULL, 
HEIGHT numeric NOT NULL CHECK (HEIGHT>0), 
WEIGHT numeric NOT NULL CHECK (WEIGHT>0), 
SALARY numeric NOT NULL CHECK (SALARY>0), 
TEAM_ID int NOT NULL , 
foreign key (TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE
) ;

CREATE TABLE game
(
ID int PRIMARY KEY, 
OWNER_TEAM_ID int NOT NULL, 
GUEST_TEAM_ID int NOT NULL,  
GAME_DATE date NOT NULL,  
WINNER_TEAM_ID int NOT NULL, 
OWNER_SCORE int NOT NULL default 0 CHECK (OWNER_SCORE>=0), 
GUEST_SCORE int NOT NULL default 0 CHECK (GUEST_SCORE>=0), 
ARENA_ID int NOT NULL,
foreign key (OWNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (GUEST_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE, 
foreign key (WINNER_TEAM_ID) references team (ID) ON DELETE RESTRICT ON UPDATE CASCADE,  
foreign key (ARENA_ID) references arena (ID) ON DELETE RESTRICT ON UPDATE CASCADE 
) ;

INSERT INTO arena (ID, NAME, SIZE) VALUES
 ('10', 'Палау Блауграна', '8250'),
 ('20', 'Визинк-Центр - Паласио де Депортес', '15500'),
 ('30', 'УСК ЦСКА им. А.Я. Гомельского', '5000'), 
 ('40', 'Пис энд Френдшип Стадиум', '12000'), 
 ('50', 'СИБУР Арена', '7140') ;

INSERT INTO team (ID, CITY, NAME, COACH_NAME, ARENA_ID) VALUES
 ('10', 'Барселона', 'Барселона', 'Шарунас Ясикявичюс', '10'), 
 ('20', 'Мадрид', 'Реал Мадрид', 'Пабло Ласо', '20'), 
 ('30', 'Москва', 'ЦСКА', 'Димитрис Итудис', '30'), 
 ('40', 'Пирей', 'Олимпиакос', 'Георгиос Барцокас','40'), 
 ('50', 'Санкт-Петербург', 'Зенит', 'Хавьер Паскуаль', '50') ;

INSERT INTO player (ID, NAME, POSITION, HEIGHT, WEIGHT, SALARY, TEAM_ID) VALUES 
('10','РафаВильяр','защитник','188','85','100000','10'),
('20','КайлКурич','защитник','193','85','100000','10'),
('30','ИбуДьянкоБаджи','центровой','211','103','200000','10'),
('40','НикКалатес','разыгрывающий','198','97','150000','10'),
('50','НиколаМиротич','форвард','208','107','175000','10'),
('60','ДжейсиКэрролл','защитник','188','82','175000','20'),
('70','ЭлиДжонНдиайе','центровой','203','110','275000','20'),
('80','УолтерТавареш','центровой','220','120','273000','20'),
('90','ТомасДавидЭртель','разыгрывающий','189','88','173000','20'),
('100','ГершонЯбуселе','форвард','203','118','99000','20'),
('110','ГабриэльИффеЛундберг','защитник','193','96','101000','30'),
('120','ЮрийУмрихин','защитник','190','75','251000','30'),
('130','ИванАнатольевичУхов','разыгрывающий','193','77','175000','30'),
('140','АлександрХоменко','разыгрывающий','192','85','375000','30'),
('150','АндрейЛопатин','лёгкийфорвард','208','92','205000','30'),
('160','ТайлерДорси','защитник','193','83','205000','40'),
('170','ЯннулисЛаренцакис','защитник','196','87','75000','40'),
('180','ХассанМартин','центровой','201','107','375000','40'),
('190','МихалисЛунцис','разыгрывающий','195','90','475000','40'),
('200','ГеоргиосПринтезис','форвард','205','104','105000','40'),
('210','БиллиДжеймсБэрон','защитник','188','88','75000','50'),
('220','АртурасГудайтис','центровой','208','99','165000','50'),
('230','ДенисЗахаров','разыгрывающий','192','88','163000','50'),
('240','МиндаугасКузминскас','лёгкийфорвард','204','93','295000','50'),
('250','АлексПойтресс','форвард','201','108','247000','50');

INSERT INTO game (ID, OWNER_TEAM_ID	, GUEST_TEAM_ID, GAME_DATE, WINNER_TEAM_ID, OWNER_SCORE, GUEST_SCORE	, ARENA_ID) VALUES
(' 10 ' , ' 10 ' , ' 50 ' , ' 2021-10-22 ' , ' 20 ' , ' 84 ' , ' 58 ' , ' 10 ' ) , 
(' 20 ' , ' 10 ' , ' 30 ' , ' 2021-11-17 ' , ' 20 ' , ' 81 ' , ' 73 ' , ' 10 ' ) , 
(' 30 ' , ' 10 ' , ' 20 ' , ' 2021-10-12 ' , ' 20 ' , ' 93 ' , ' 80 ' , ' 10 ' ) , 
(' 40 ' , ' 10 ' , ' 40 ' , ' 2021-10-15 ' , ' 20 ' , ' 83 ' , ' 68 ' , ' 10 ' ) , 
(' 50 ' , ' 50 ' , ' 20 ' , ' 2022-12-15 ' , ' 20 ' , ' 68 ' , ' 75 ' , ' 50 ' ) , 
(' 60 ' , ' 50 ' , ' 30 ' , ' 2022-01-15 ' , ' 30 ' , ' 67 ' , ' 77 ' , ' 50 ' ) , 
(' 70 ' , ' 50 ' , ' 40 ' , ' 2022-10-20 ' , ' 50 ' , ' 84 ' , ' 78 ' , ' 50 ' ) , 
(' 80 ' , ' 20 ' , ' 30 ' , ' 2021-10-28 ' , ' 20 ' , ' 71 ' , ' 65 ' , ' 20 ' ) , 
(' 90 ' , ' 20 ' , ' 40 ' , ' 2022-02-01 ' , ' 20 ' , ' 75 ' , ' 67 ' , ' 20 ' ) , 
(' 100 ' , ' 30 ' , ' 40 ' , ' 2022-02-02 ' , ' 30 ' , ' 79 ' , ' 78 ' , ' 30 ' ) ; 



CREATE TABLE team_new AS SELECT team.id, team.city, team.name, team.coach_name, arena.name AS ARENA FROM team JOIN arena ON team.arena_id = arena.id;

CREATE TABLE player_new AS SELECT player.id, player.name, player.position, player.height, player.weight, player.salary, team.name AS TEAM FROM player JOIN team ON player.team_id = team.id;


CREATE TABLE team_1 AS SELECT ID, NAME FROM TEAM;
CREATE TABLE team_2 AS SELECT ID, NAME FROM TEAM;


CREATE TABLE game_new AS SELECT game.id, team.name AS OWNER_TEAM, team_1.name AS GUEST_TEAM, game.game_date, team_2.name as WINNER_TEAM, game.OWNER_SCORE, game.GUEST_SCORE, arena.name AS ARENA
FROM game 
JOIN team ON game.OWNER_TEAM_ID = team.id
JOIN team_1 ON game.GUEST_TEAM_ID = team_1.id
JOIN team_2 ON game.WINNER_TEAM_ID = team_2.id 
JOIN arena ON game.ARENA_ID = arena.id;

/*Упражнение 1 */
SELECT NAME, POSITION FROM player WHERE HEIGHT BETWEEN 188 AND 200 AND SALARY BETWEEN 100000 AND 150000
ORDER BY NAME COLLATE "C" DESC;

/*Упражнение 2*/
SELECT CONCAT ( 'город: ', CITY, '; ', 'команда: ',  NAME, '; ','тренер: ', coach_name) 
AS "полная информация"
FROM team;

/*Упражнение 3*/
SELECT NAME, SIZE 
FROM ARENA
WHERE ID IN (10, 30, 50)
ORDER BY SIZE, NAME COLLATE "C";

/*Упражнение 4*/
SELECT NAME, SIZE 
FROM ARENA
WHERE ID NOT IN (10, 30, 50)
ORDER BY SIZE, NAME COLLATE "C";

/*Упражнение 5*/
SELECT NAME AS "имя игрока", POSITION AS "позиция на площадке"
FROM player 
WHERE HEIGHT BETWEEN 188 AND 220 
AND POSITION IN ('центровой', 'защитник')
ORDER BY POSITION COLLATE "C" DESC, NAME COLLATE "C" DESC ;


/*Упражнение 1 */

(SELECT (NAME COLLATE "C") AS "name" FROM TEAM) 
UNION 
(SELECT (NAME COLLATE "C") AS "name" FROM ARENA)
ORDER BY name DESC;

/*Упражнение 2 */
SELECT * FROM (SELECT arena.name, 'стадион' as object_type from arena
UNION
SELECT TEAM.name, 'команда' as object_type from TEAM)
ASD
ORDER BY object_type collate "C" DESC, NAME COLLATE "C";


/*Упражнение 3*/
SELECT NAME, SALARY FROM player
ORDER BY
(CASE 
WHEN SALARY = 475000 THEN 1
ELSE SALARY 
END) LIMIT 5;

/*Упражнение 4 */
SELECT ID FROM PLAYER EXCEPT SELECT ID FROM TEAM 
ORDER BY ID LIMIT 10

/*Упражнение 5 */
(SELECT ID FROM ARENA EXCEPT SELECT ID FROM GAME) 
UNION 
(SELECT ID FROM GAME EXCEPT SELECT ID FROM ARENA)
ORDER BY ID;









