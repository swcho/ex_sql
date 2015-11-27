
create DATABASE if not exists tree_test;

use tree_test;

drop table if EXISTS category;

CREATE TABLE category(
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  parent INT DEFAULT NULL
);

INSERT INTO category VALUES(1,'ELECTRONICS',NULL),(2,'TELEVISIONS',1),(3,'TUBE',2),
  (4,'LCD',2),(5,'PLASMA',2),(6,'PORTABLE ELECTRONICS',1),(7,'MP3 PLAYERS',6),(8,'FLASH',7),
  (9,'CD PLAYERS',6),(10,'2 WAY RADIOS',6);

SELECT * FROM category ORDER BY category_id;

SELECT t1.category_id, t1.name AS lev1, t2.name as lev2
FROM category AS t1
  LEFT JOIN category AS t2 ON t2.parent = t1.category_id;

SELECT t1.name AS lev1, t2.name as lev2, t3.name as lev3, t4.name as lev4
FROM category AS t1
  LEFT JOIN category AS t2 ON t2.parent = t1.category_id
  LEFT JOIN category AS t3 ON t3.parent = t2.category_id
  LEFT JOIN category AS t4 ON t4.parent = t3.category_id
WHERE t1.name = 'ELECTRONICS';