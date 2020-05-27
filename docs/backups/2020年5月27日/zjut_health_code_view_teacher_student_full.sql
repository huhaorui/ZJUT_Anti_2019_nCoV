create definer = zjut_health_code@`%` view view_teacher_student_full as
select '学生'                       AS `type`,
       `view_student`.`collage`   AS `collage`,
       `view_student`.`major`     AS `major`,
       `view_student`.`class`     AS `class`,
       `view_student`.`id`        AS `id`,
       `view_student`.`name`      AS `name`,
       `view_student`.`person_id` AS `person_id`
from `zjut_health_code`.`view_student`
union
select '教师'                       AS `type`,
       `view_teacher`.`collage`   AS `collage`,
       ''                         AS `major`,
       ''                         AS `class`,
       `view_teacher`.`id`        AS `id`,
       `view_teacher`.`name`      AS `name`,
       `view_teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`view_teacher`;

INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1803', '201800000121', '神秘人', '12345678');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806060000', 'STU0000', '330000000010000003');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806060001', 'STU0001', '330000000010000004');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061108', '胡皓睿', '330721200009133110');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061219', '王程飞', '33072620006272715');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '物联网', '物联网1801', '201906061418', '小可爱', '333333333333312345678');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '000001', 'TEA00001', '330000000000000000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '000002', 'TEA00002', '330000000020000002');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '000003', 'TEA00003', '330000000020000003
');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '000004', 'TEA00004', '330000000020000004
');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '000005', 'TEA00005', '330000000020000005
');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '000006', 'TEA00006', '330000000020000006
');