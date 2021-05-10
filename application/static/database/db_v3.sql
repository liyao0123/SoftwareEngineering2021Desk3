drop database  if exists faunaworld;

CREATE DATABASE faunaworld;

USE faunaworld;


drop table IF EXISTS fauna;

CREATE TABLE fauna(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(40) NOT NULL,
false_name varchar(40) default 'Tiger',
area VARCHAR(20) NOT NULL,
false_area VARCHAR(20) default 'Asia',
link VARCHAR(100) NOT NULL,
picture VARCHAR(50) DEFAULT '/images/Asian_elephant.jpg', 
game_id varchar(30) default '1-1',
hint VARCHAR(50) DEFAULT NULL
);

insert into fauna (id,name,area,false_area,link,picture,game_id,hint) values
(null,'Siberian tiger','Asia','Africa','https://en.wikipedia.org/wiki/Siberian_tiger','/images/Siberian_tiger.jpg','1-1','snow, north'),
(null,'Giant otter','America','Asia','https://en.wikipedia.org/wiki/Giant_otter','/images/Giant_otter.jpg','1-1','amazon rain forest'),
(null,'Dhole','Asia','America','https://en.wikipedia.org/wiki/Dhole','/images/Dhole.jpg','1-1','India'),
(null,'Mountain zebra','Africa','Asia','https://en.wikipedia.org/wiki/Mountain_zebra','/images/Mountain_zebra.jpg','1-1','dry, south'),
(null,'Manatee','America','Europe','https://en.wikipedia.org/wiki/Manatee','/images/Manatee.jpg','1-1','Mexico');

INSERT INTO fauna (id,name,area,false_area,link,picture,game_id,hint) VALUES
(NULL,'Maned sloth','America','Australia','https://en.wikipedia.org/wiki/Maned_sloth','/images/Maned_sloth.jpg','1-2','not what you remember'),
(NULL,'Dingo','Australia','Africa','https://en.wikipedia.org/wiki/Dingo','/images/Dingo.jpg','1-2','a country riding on the back of the sheep'),
(NULL,'Ethiopian wolf','Africa','Australia','https://en.wikipedia.org/wiki/Ethiopian_wolf','/images/Ethiopian_wolf.jpg','1-2','tropical, dry'),
(NULL,'Markhor','Asia','Europe','https://en.wikipedia.org/wiki/Markhor','/images/Markhor.jpg','1-2','eastern hemisphere');

INSERT INTO fauna (id,name,false_name,area,link,picture,game_id,hint)VALUES
(NULL,'Bonobo','Chimpanzee','Africa','https://en.wikipedia.org/wiki/Bonobo','/images/Bonobo.jpg','2-1','three letters ''o'''),
(NULL,'Bornean orangutan','Eastern lowland gorilla','Asia','https://en.wikipedia.org/wiki/Bornean_orangutan','/images/Bornean_orangutan.jpg','2-1','orange'),
(NULL,'Chimpanzee','Bornean orangutan','Africa','https://en.wikipedia.org/wiki/Chimpanzee','/images/Chimpanzee.jpg','2-1','you know it well'),
(NULL,'Eastern lowland gorilla','Bonobo','Africa','https://en.wikipedia.org/wiki/Eastern_lowland_gorilla','/images/Eastern_lowland_gorilla.jpg','2-1','direction');

INSERT INTO fauna (id,name,false_name,area,link,picture,game_id,hint)VALUES
(NULL,'Cheetah','Snow leopard','Africa','https://en.wikipedia.org/wiki/Cheetah','/images/Cheetah.jpg','2-2','distinct name here'),
(NULL,'Persian leopard','Clouded leopard','Europe','https://en.wikipedia.org/wiki/Panthera_pardus_tulliana','/images/Persian_leopard.jpg','2-2','a country'),
(NULL,'Snow leopard','Cheetah','Asia','https://en.wikipedia.org/wiki/Snow_leopard','/images/Snow_leopard.jpg','2-2','cold'),
(NULL,'Clouded leopard','Snow leopard','Asia','https://en.wikipedia.org/wiki/Clouded_leopard','/images/Clouded_leopard.jpg','2-2','sky, white');


