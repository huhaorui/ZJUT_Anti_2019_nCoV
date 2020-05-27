create definer = zjut_health_code@`%` view view_student_raw as
select `zjut_health_code`.`collage`.`id`        AS `collage`,
       `zjut_health_code`.`major`.`id`          AS `major`,
       `zjut_health_code`.`class`.`id`          AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`student`
         join `zjut_health_code`.`class`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where ((`zjut_health_code`.`student`.`class`, `zjut_health_code`.`class`.`major`,
        `zjut_health_code`.`major`.`collage`) =
       (`zjut_health_code`.`class`.`id`, `zjut_health_code`.`major`.`id`, `zjut_health_code`.`collage`.`id`));

INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 2, 1, '201906061418', '小可爱', '333333333333312345678');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 4, 4, '201806060000', 'STU0000', '330000000010000003');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 4, 4, '201806060001', 'STU0001', '330000000010000004');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 4, 4, '201806061108', '胡皓睿', '330721200009133110');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 4, 4, '201806061219', '王程飞', '33072620006272715');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (1, 4, 6, '201800000121', '神秘人', '12345678');