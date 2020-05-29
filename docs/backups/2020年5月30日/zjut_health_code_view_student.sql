create definer = zjut_health_code@`%` view view_student as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`major`.`name`        AS `major`,
       `zjut_health_code`.`class`.`name`        AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from (((`zjut_health_code`.`collage` join `zjut_health_code`.`major`) join `zjut_health_code`.`class`)
         join `zjut_health_code`.`student`)
where ((`zjut_health_code`.`class`.`id` = `zjut_health_code`.`student`.`class`) and
       (`zjut_health_code`.`major`.`id` = `zjut_health_code`.`class`.`major`) and
       (`zjut_health_code`.`collage`.`id` = `zjut_health_code`.`major`.`collage`));

INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '网络工程', '网络工程1801', '201806060001', '学生划水01号', '330726200006272000');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('信息工程学院', '自动化', '自动化1801', '201806060002', '学生划水02号', '330726200006272001');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('信息工程学院', '电子科学与技术', '电子科学与技术1801', '201806060003', '学生划水03号', '330726200006272000');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('信息工程学院', '通信工程', '通信工程1801', '201806060004', '学生划水04号', '330726200006272001');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '网络工程', '网络工程1801', '201806060005', '学生划水05号', '330726200006272000');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '计算机科学与技术', '计算机科学与技术1801', '201806060006', '学生划水06号', '330726200006272001');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061108', '胡皓睿', '330726200009130000');
INSERT INTO zjut_health_code.view_student (collage, major, class, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061219', '王程飞', '330726200006272000');