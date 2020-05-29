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

INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '网络工程', '网络工程1801', '201806060001', '学生划水01号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '信息工程学院', '自动化', '自动化1801', '201806060002', '学生划水02号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '信息工程学院', '电子科学与技术', '电子科学与技术1801', '201806060003', '学生划水03号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '信息工程学院', '通信工程', '通信工程1801', '201806060004', '学生划水04号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '网络工程', '网络工程1801', '201806060005', '学生划水05号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '计算机科学与技术', '计算机科学与技术1801', '201806060006', '学生划水06号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061108', '胡皓睿', '330726200009130000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('学生', '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805', '201806061219', '王程飞', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00000', '教师00000号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00001', '教师00001号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00002', '教师00002号', '136722817772016454');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00003', '教师00003号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00004', '教师00004号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00005', '教师00005号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00006', '教师00006号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00007', '教师00007号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00008', '教师00008号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00009', '教师00009号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00010', '教师00010号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00011', '教师00011号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00012', '教师00012号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00013', '教师00013号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00014', '教师00014号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00015', '教师00015号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00016', '教师00016号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00017', '教师00017号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00018', '教师00018号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00019', '教师00019号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00020', '教师00020号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00021', '教师00021号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00022', '教师00022号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '信息工程学院', '', '', '00023', '教师00023号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '计算机科学与技术学院、软件学院', '', '', '00024', '教师00024号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student_full (type, collage, major, class, id, name, person_id) VALUES ('教师', '建筑工程学院', '', '', '00025', '教师00025号', '136722817772016452');