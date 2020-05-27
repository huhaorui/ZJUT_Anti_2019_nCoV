create definer = zjut_health_code@`%` view view_student as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`major`.`name`        AS `major`,
       `zjut_health_code`.`class`.`name`        AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`collage`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`class`
         join `zjut_health_code`.`student`
where ((`zjut_health_code`.`class`.`id`, `zjut_health_code`.`major`.`id`, `zjut_health_code`.`collage`.`id`) =
       (`zjut_health_code`.`student`.`class`, `zjut_health_code`.`class`.`major`,
        `zjut_health_code`.`major`.`collage`));

INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1803', '201800000121', '神秘人', '12345678');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806060000', 'STU0000', '330000000010000003');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806060001', 'STU0001', '330000000010000004');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061108', '胡皓睿', '330721200009133110');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061219', '王程飞', '33072620006272715');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '物联网', '物联网1801', '201906061418', '小可爱', '333333333333312345678');