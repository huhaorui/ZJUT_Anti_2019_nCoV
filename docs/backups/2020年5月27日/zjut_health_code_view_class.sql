create definer = zjut_health_code@`%` view view_class as
select `zjut_health_code`.`class`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`,
       `zjut_health_code`.`class`.`name`   AS `class`
from `zjut_health_code`.`class`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where ((`zjut_health_code`.`major`.`collage`, `zjut_health_code`.`class`.`major`) =
       (`zjut_health_code`.`collage`.`id`, `zjut_health_code`.`major`.`id`));

INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (1, '计算机科学与技术学院、软件学院', '物联网', '物联网1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (2, '计算机科学与技术学院、软件学院', '物联网', '物联网1802');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (3, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (4, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (5, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1804');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (6, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1803');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (10, '计算机科学与技术学院、软件学院', '实验班', '实验班1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (11, '信息工程学院', '通信工程', '通信工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (7, '信息工程学院', '自动化', '自动化1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (8, '信息工程学院', '自动化', '自动化1802');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (9, '信息工程学院', '电子科学与技术', '电子科学与技术1801');