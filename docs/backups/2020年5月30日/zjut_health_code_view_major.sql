create definer = zjut_health_code@`%` view view_major as
select `zjut_health_code`.`major`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`
from (`zjut_health_code`.`major`
         join `zjut_health_code`.`collage`)
where (`zjut_health_code`.`major`.`collage` = `zjut_health_code`.`collage`.`id`);

INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (478, '信息工程学院', '电子科学与技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (479, '信息工程学院', '通信工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (480, '信息工程学院', '电子信息工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (481, '信息工程学院', '电气工程及其自动化');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (482, '信息工程学院', '自动化');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (483, '计算机科学与技术学院、软件学院', '物联网工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (484, '计算机科学与技术学院、软件学院', '实验班');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (485, '计算机科学与技术学院、软件学院', '网络工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (486, '计算机科学与技术学院、软件学院', '软件工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (487, '计算机科学与技术学院、软件学院', '数字媒体技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (488, '计算机科学与技术学院、软件学院', '数据科学与大数据技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (489, '计算机科学与技术学院、软件学院', '计算机科学与技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (490, '建筑工程学院', '建筑学');