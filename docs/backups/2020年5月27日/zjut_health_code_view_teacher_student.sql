create definer = zjut_health_code@`%` view view_teacher_student as
select `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`student`
union
select `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`teacher`;

INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201800000121', '神秘人', '12345678');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060000', 'STU0000', '330000000010000003');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060001', 'STU0001', '330000000010000004');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806061108', '胡皓睿', '330721200009133110');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806061219', '王程飞', '33072620006272715');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201906061418', '小可爱', '333333333333312345678');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000001', 'TEA00001', '330000000000000000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000002', 'TEA00002', '330000000020000002');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000003', 'TEA00003', '330000000020000003
');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000004', 'TEA00004', '330000000020000004
');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000005', 'TEA00005', '330000000020000005
');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('000006', 'TEA00006', '330000000020000006
');