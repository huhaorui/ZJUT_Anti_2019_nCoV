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

INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060001', '330726200006272000', '学生划水01号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060002', '330726200006272001', '学生划水02号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060003', '330726200006272000', '学生划水03号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060004', '330726200006272001', '学生划水04号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060005', '330726200006272000', '学生划水05号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806060006', '330726200006272001', '学生划水06号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806061108', '330726200009130000', '胡皓睿');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('201806061219', '330726200006272000', '王程飞');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00000', '136722817772016452', '教师00000号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00001', '136722817772016453', '教师00001号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00002', '136722817772016454', '教师00002号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00003', '136722817772016453', '教师00003号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00004', '136722817772016452', '教师00004号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00005', '136722817772016453', '教师00005号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00006', '136722817772016452', '教师00006号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00007', '136722817772016453', '教师00007号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00008', '136722817772016452', '教师00008号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00009', '136722817772016453', '教师00009号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00010', '136722817772016452', '教师00010号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00011', '136722817772016453', '教师00011号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00012', '136722817772016452', '教师00012号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00013', '136722817772016453', '教师00013号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00014', '136722817772016452', '教师00014号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00015', '136722817772016453', '教师00015号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00016', '136722817772016452', '教师00016号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00017', '136722817772016453', '教师00017号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00018', '136722817772016452', '教师00018号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00019', '136722817772016453', '教师00019号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00020', '136722817772016452', '教师00020号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00021', '136722817772016453', '教师00021号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00022', '136722817772016452', '教师00022号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00023', '136722817772016453', '教师00023号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00024', '136722817772016452', '教师00024号');
INSERT INTO zjut_health_code.Teacher_Student (id, person_id, name) VALUES ('00025', '136722817772016452', '教师00025号');