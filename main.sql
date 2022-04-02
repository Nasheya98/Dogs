.open dbdogs

-- the commented out .mode and .header below allow us to actually draw the table in SQLite replit. Try using them if you want. They need .width before select

.mode column
.header on


-- PRAGMA used to be needed to enforce foreign keys in replit
PRAGMA foreign_keys = true;

-- drop means delete a table

DROP TABLE IF EXISTS dogs;
DROP TABLE IF EXISTS breeds;

CREATE TABLE IF NOT EXISTS breeds (
  breedid INTEGER NOT NULL PRIMARY KEY,
  breedname VARCHAR(100) NOT NULL,
  descriptionbreed TEXT
);

CREATE TABLE IF NOT EXISTS dogs (
  dogid INTEGER NOT NULL PRIMARY KEY,
  dogname VARCHAR(100),
  is_healthy INTEGER(1) DEFAULT 1,
  health_issues TEXT DEFAULT null,
  number_vaccines INTEGER,
  color VARCHAR(100),
  breedid INTEGER,
  FOREIGN KEY (breedid) REFERENCES breeds(breedid) ON DELETE CASCADE
);

insert into breeds (breedname) values
("Ladrador"),
('Chihuahua'),
("Boxer"),
("Poodle"),
("Akita");

-- select * from breeds;

insert into dogs (dogname, breedid, color, number_vaccines) values
("Rover", 1, "white", 1),
("Sharik", 1, "brown", 2),
("Lena", 2, "brown", 1),
("Bobo", 2, "brown", 1),
("Bobo", 3, "brown", 1),
("Bailey", 3, "brown", 4);

update dogs
set health_issues="toothache"
where dogid>3;



update dogs
set is_healthy = 0
where dogid>3;
  
-- select * from dogs;

select count(*) as [Number of dogs], dogname
from dogs
group by dogname;

select count(d.dogid), b.breedname
from dogs as d
inner join breeds as b
on d.breedid = b.breedid
group by b.breedname;
  
-- select count(d.dogid), b.breedname 
-- from dogs as d
-- inner join breeds as b
-- on d.breedid = b.breedid
-- group by b.breedname;

  
-- Tasks:
insert into  dogs (dogname) values
('Pepper'),
('Lola'),
('Jiffy');
update dogs
set health_issues='ticks'
  where dogid<10 and dogid>7;

update dogs 
set is_healthy = 0
where dogid<10 and dogid>7;

select * from dogs;


SELECT SUM(number_vaccines) AS [Number of Vaccines]
FROM dogs;

SELECT COUNT(*), number_vaccines
FROM dogs
group by number_vaccines;




-- 1. Add more dogs
-- 2. Update some dogs to be ill
-- 3. Add another attribute to dogs
-- 4. Make a report that groups dogs by health
-- 5. Make a report to group by a new attribute
-- 6. Make a new table linked to dogs
