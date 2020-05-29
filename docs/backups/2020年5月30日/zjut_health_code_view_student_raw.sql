create definer = zjut_health_code@`%` view view_student_raw as
select `zjut_health_code`.`collage`.`id`        AS `collage`,
       `zjut_health_code`.`major`.`id`          AS `major`,
       `zjut_health_code`.`class`.`id`          AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from (((`zjut_health_code`.`student` join `zjut_health_code`.`class`) join `zjut_health_code`.`major`)
         join `zjut_health_code`.`collage`)
where ((`zjut_health_code`.`student`.`class` = `zjut_health_code`.`class`.`id`) and
       (`zjut_health_code`.`class`.`major` = `zjut_health_code`.`major`.`id`) and
       (`zjut_health_code`.`major`.`collage` = `zjut_health_code`.`collage`.`id`));

INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (459, 485, 856, '201806060001', '学生划水01号', '330726200006272000');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (455, 482, 847, '201806060002', '学生划水02号', '330726200006272001');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (455, 478, 835, '201806060003', '学生划水03号', '330726200006272000');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (455, 479, 838, '201806060004', '学生划水04号', '330726200006272001');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (459, 485, 856, '201806060005', '学生划水05号', '330726200006272000');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (459, 489, 886, '201806060006', '学生划水06号', '330726200006272001');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (459, 486, 867, '201806061108', '胡皓睿', '330726200009130000');
INSERT INTO zjut_health_code.view_student_raw (collage, major, class, id, name, person_id) VALUES (459, 486, 867, '201806061219', '王程飞', '330726200006272000');