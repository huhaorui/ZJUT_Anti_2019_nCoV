create definer = zjut_health_code@`%` view Teacher_Student as
select `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`,
       `zjut_health_code`.`student`.`name`      AS `name`
from `zjut_health_code`.`student`
union
select `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`
from `zjut_health_code`.`teacher`;

INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201800000121', '12345678', '神秘人');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060000', '330000000010000003', 'STU0000');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060001', '330000000010000004', 'STU0001');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806061108', '330721200009133110', '胡皓睿');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806061219', '33072620006272715', '王程飞');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201906061418', '333333333333312345678', '小可爱');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000001', '330000000000000000', 'TEA00001');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000002', '330000000020000002', 'TEA00002');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000003', '330000000020000003
', 'TEA00003');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000004', '330000000020000004
', 'TEA00004');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000005', '330000000020000005
', 'TEA00005');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('000006', '330000000020000006
', 'TEA00006');