

-- Adding some values to the table
insert into people (last_name, first_name, adress, city)
values 	
	("Hernandez", "Laura", "Calle 21 ", "Monterrey"),
    ("Lopez", "Juan", "Calle 23", "Monterrey"),
    ("Berrueta", "Ismale", "Calle 2", "CDMX"),
    ("Perez", "Jose", "Calle 2", "Guadalajara"),
	("Gonzalez", "Fernando", "Calle 12", "Guadalajara"); 
    

-- Update some values
update people 
set last_name = "Cortes", city = "Merida"
where person_id = 1;
update people 
set first_name = "Elena"
where city = "Merida";


-- seleccionar
SELECT * FROM students;

-- insertar
insert into students (nombre, apellido, edad, correo_electronico, telefono)
values
  ("Alexis", "Araujo", 33, "alexis@gmail.com", "777-1234");

-- borrar 
delete from students
where id=1;

-- actualizar 
update students 
set edad = 55
where id=2;

-- creacion de tablas 
CREATE TABLE `blog_1`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_cateogoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `blog_1`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `blog_1`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
CREATE TABLE `blog_1`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(145) NOT NULL,
  `date` TIMESTAMP NULL,
  `content` TEXT NOT NULL,
  `status` CHAR(8) NULL DEFAULT '\"activo\"',
  `user_id` INT NOT NULL,
  `category` INT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `blog_1`.`posts` 
ADD INDEX `post_usuarios_idx` (`user_id` ASC) VISIBLE;
;
ALTER TABLE `blog_1`.`posts` 
ADD CONSTRAINT `post_usuarios`
  FOREIGN KEY (`user_id`)
  REFERENCES `blog_1`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `blog_1`.`posts` 
ADD INDEX `post_categories_idx` (`category` ASC) VISIBLE;
;
ALTER TABLE `blog_1`.`posts` 
ADD CONSTRAINT `post_categories`
  FOREIGN KEY (`category`)
  REFERENCES `blog_1`.`categorias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



CREATE TABLE `blog_1`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_body` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `blog_1`.`comments` 
ADD INDEX `user_comments_idx` (`user_id` ASC) VISIBLE;

;
ALTER TABLE `blog_1`.`comments` 
ADD CONSTRAINT `user_comments`
  FOREIGN KEY (`user_id`)
  REFERENCES `blog_1`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `blog_1`.`comments` 
ADD INDEX `post_comments_idx` (`post_id` ASC) VISIBLE;
;
ALTER TABLE `blog_1`.`comments` 
ADD CONSTRAINT `post_comments`
  FOREIGN KEY (`post_id`)
  REFERENCES `blog_1`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `blog_1`.`post_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  ALTER TABLE `blog_1`.`post_tag` 
ADD INDEX `post_tag_post_idx` (`post_id` ASC) VISIBLE;
;
ALTER TABLE `blog_1`.`post_tag` 
ADD CONSTRAINT `post_tag_post`
  FOREIGN KEY (`post_id`)
  REFERENCES `blog_1`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `blog_1`.`post_tag` 
ADD INDEX `post_tag_tag_idx` (`tag_id` ASC) VISIBLE;
;
ALTER TABLE `blog_1`.`post_tag` 
ADD CONSTRAINT `post_tag_tag`
  FOREIGN KEY (`tag_id`)
  REFERENCES `blog_1`.`etiquetas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  -- Adding users
    
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) 
VALUES 
	(2,'monica','(*&^LKJDHC_(*#YDLKJHODG','Moni','monica@platziblog.com'),
    (3,'laura','LKDJ)_*(-c.M:\"[pOwHDˆåßƒ∂','Lau','laura@platziblog.com'),
    (4,'edgar','LLiy)CX*Y:M<A<SC_(*N>O','Ed','edgar@platziblog.com'),
    (5,'perezoso','&N_*JS)_Y)*(&TGOKS','Oso Pérez','perezoso@platziblog.com');
SELECT * FROM usuarios

-- adding categories
INSERT INTO categorias (`id`,`nombre_cateogoria`) 
VALUES 
	(1,'Ciencia'),
    (2,'Tecnología'),
    (3,'Deportes'),
    (4,'Espectáculos'),
    (5,'Economía');
SELECT * FROM categorias;

-- Adding tags
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) 
VALUES 
	(1,'Robótica'),
    (2,'Computación'),
    (3,'Teléfonos Móviles'),
    (4,'Automovilismo'),
    (5,'Campeonatos'),
    (6,'Equipos'),
    (7,'Bolsa de valores'),
    (8,'Inversiones'),
    (9,'Brokers'),
    (10,'Celebridades'),
    (11,'Eventos'),
    (12,'Moda'),
    (13,'Avances'),
    (14,'Nobel'),
    (15,'Matemáticas'),
    (16,'Química'),
    (17,'Física'),
    (18,'Largo plazo'),
    (19,'Bienes Raíces'),
    (20,'Estilo');
SELECT * FROM etiquetas;

-- adding posts
insert into posts (`id`,`title`,`date`,`content`,`status`,`user_id`,`category`)
values 
(43,'Se presenta el nuevo teléfono móvil en evento','2030-04-05 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,2);
select * from posts;

-- adding post_tag
INSERT INTO post_tag (`id`,`post_id`,`tag_id`)
values
	(1,43,3),
    (2,43,11),
    (3,44,2),
    (4,44,4),
    (5,45,14),
    (6,45,13),
    (7,46,10);
select * from post_tag

-- left join
select * 
from usuarios
left join posts on usuarios.id = posts.user_id;

select * 
from usuarios
left join posts on usuarios.id = posts.user_id
where posts.user_id is null;

-- right join
select * 
from usuarios
right join posts on usuarios.id = posts.user_id;

-- inner join 
select * 
from usuarios
inner join posts on usuarios.id = posts.user_id;

-- where
select * 
from posts
where id<=50;

select * 
from posts
where status<>"activo";

select * 
from posts
where title like "%escandalo%";

select * 
from posts
where date between "2023-01-01" and "2025-02-02";

select * 
from posts
where year(date) between "2023" and "2024";

select * 
from posts
where user_id is not null
and status = "activo"
and id<50
and category = 2;

-- group by 
select status, count(*) as quantity
from posts
group by status;

select year(date) as publication_date,
count(*) as quantity 
from posts
group by publication_date;

select year(date) as publication_date,
count(*) as quantity 
from posts
where status = "inactivo"
group by publication_date;

select year(date) as publication_date,
count(*) as quantity 
from posts
where status = "activo"
group by publication_date;

select status, month(date) as month_date,
count(*) as quantity 
from posts
where status = "activo"
group by status, month_date;

-- queries
select u.nickname, count(*) cant_posts
from usuarios as u 
inner join posts as p on u.id = p.user_id
group by u.id 
order by cant_posts desc

select u.nickname, count(*) cant_posts, group_concat(nombre_cateogoria) as nombre_categoria
from usuarios as u 
inner join posts as p on u.id = p.user_id
inner join categorias as c on p.category = c.id
group by u.id 
order by cant_posts desc

select * from usuarios as u 
left join posts as p on u.id = p.user_id
where p.user_id is null















