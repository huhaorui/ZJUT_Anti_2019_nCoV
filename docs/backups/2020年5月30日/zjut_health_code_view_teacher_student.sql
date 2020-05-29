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

INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060001', '学生划水01号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060002', '学生划水02号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060003', '学生划水03号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060004', '学生划水04号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060005', '学生划水05号', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806060006', '学生划水06号', '330726200006272001');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806061108', '胡皓睿', '330726200009130000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('201806061219', '王程飞', '330726200006272000');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00000', '教师00000号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00001', '教师00001号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00002', '教师00002号', '136722817772016454');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00003', '教师00003号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00004', '教师00004号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00005', '教师00005号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00006', '教师00006号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00007', '教师00007号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00008', '教师00008号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00009', '教师00009号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00010', '教师00010号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00011', '教师00011号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00012', '教师00012号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00013', '教师00013号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00014', '教师00014号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00015', '教师00015号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00016', '教师00016号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00017', '教师00017号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00018', '教师00018号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00019', '教师00019号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00020', '教师00020号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00021', '教师00021号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00022', '教师00022号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00023', '教师00023号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00024', '教师00024号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher_student (id, name, person_id) VALUES ('00025', '教师00025号', '136722817772016452');