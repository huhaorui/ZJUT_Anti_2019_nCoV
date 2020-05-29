create definer = zjut_health_code@`%` view view_teacher as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`
from (`zjut_health_code`.`collage`
         join `zjut_health_code`.`teacher`)
where (`zjut_health_code`.`teacher`.`collage` = `zjut_health_code`.`collage`.`id`);

INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00000', '教师00000号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00001', '教师00001号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00002', '教师00002号', '136722817772016454');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00003', '教师00003号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00004', '教师00004号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00005', '教师00005号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00006', '教师00006号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00007', '教师00007号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00008', '教师00008号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00009', '教师00009号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00010', '教师00010号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00011', '教师00011号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00012', '教师00012号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00013', '教师00013号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00014', '教师00014号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00015', '教师00015号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00016', '教师00016号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00017', '教师00017号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00018', '教师00018号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00019', '教师00019号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00020', '教师00020号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00021', '教师00021号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00022', '教师00022号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('信息工程学院', '00023', '教师00023号', '136722817772016453');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('计算机科学与技术学院、软件学院', '00024', '教师00024号', '136722817772016452');
INSERT INTO zjut_health_code.view_teacher (collage, id, name, person_id) VALUES ('建筑工程学院', '00025', '教师00025号', '136722817772016452');