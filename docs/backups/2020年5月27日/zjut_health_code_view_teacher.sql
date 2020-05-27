create definer = zjut_health_code@`%` view view_teacher as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`collage`
         join `zjut_health_code`.`teacher`
where (`zjut_health_code`.`teacher`.`collage` = `zjut_health_code`.`collage`.`id`);

INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '000001', 'TEA00001', '330000000000000000');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '000002', 'TEA00002', '330000000020000002');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '000003', 'TEA00003', '330000000020000003
');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '000004', 'TEA00004', '330000000020000004
');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '000005', 'TEA00005', '330000000020000005
');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '000006', 'TEA00006', '330000000020000006
');