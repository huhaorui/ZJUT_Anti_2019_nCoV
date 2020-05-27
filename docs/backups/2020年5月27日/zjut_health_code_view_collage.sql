create definer = zjut_health_code@`%` view view_collage as
select `zjut_health_code`.`collage`.`id` AS `id`, `zjut_health_code`.`collage`.`name` AS `collage`
from `zjut_health_code`.`collage`;

INSERT INTO zjut_health_code.view_collage (id, collage) VALUES (1, '计算机科学与技术学院、软件学院');
INSERT INTO zjut_health_code.view_collage (id, collage) VALUES (2, '信息工程学院');