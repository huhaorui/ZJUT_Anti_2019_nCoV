create definer = zjut_health_code@`%` view view_major as
select `zjut_health_code`.`major`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`
from `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where (`zjut_health_code`.`major`.`collage` = `zjut_health_code`.`collage`.`id`);

INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (2, '计算机科学与技术学院、软件学院', '物联网');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (3, '计算机科学与技术学院、软件学院', '数字媒体技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (4, '计算机科学与技术学院、软件学院', '软件工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (5, '信息工程学院', '通信工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (6, '信息工程学院', '自动化');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (7, '信息工程学院', '电子科学与技术');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (8, '计算机科学与技术学院、软件学院', '网络工程');
INSERT INTO zjut_health_code.view_major (id, collage, major) VALUES (9, '计算机科学与技术学院、软件学院', '实验班');