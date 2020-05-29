create definer = zjut_health_code@`%` view view_class as
select `zjut_health_code`.`class`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`,
       `zjut_health_code`.`class`.`name`   AS `class`
from ((`zjut_health_code`.`class` join `zjut_health_code`.`major`)
         join `zjut_health_code`.`collage`)
where ((`zjut_health_code`.`major`.`collage` = `zjut_health_code`.`collage`.`id`) and
       (`zjut_health_code`.`class`.`major` = `zjut_health_code`.`major`.`id`));

INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (835, '信息工程学院', '电子科学与技术', '电子科学与技术1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (836, '信息工程学院', '电子科学与技术', '电子科学与技术1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (837, '信息工程学院', '电子科学与技术', '电子科学与技术1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (838, '信息工程学院', '通信工程', '通信工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (839, '信息工程学院', '通信工程', '通信工程1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (840, '信息工程学院', '通信工程', '通信工程1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (841, '信息工程学院', '电子信息工程', '电子信息工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (842, '信息工程学院', '电子信息工程', '电子信息工程1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (843, '信息工程学院', '电子信息工程', '电子信息工程1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (844, '信息工程学院', '电气工程及其自动化', '电气工程及其自动化1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (845, '信息工程学院', '电气工程及其自动化', '电气工程及其自动化1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (846, '信息工程学院', '电气工程及其自动化', '电气工程及其自动化1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (847, '信息工程学院', '自动化', '自动化1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (848, '信息工程学院', '自动化', '自动化1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (849, '信息工程学院', '自动化', '自动化1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (850, '计算机科学与技术学院、软件学院', '物联网工程', '物联网工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (851, '计算机科学与技术学院、软件学院', '物联网工程', '物联网工程1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (852, '计算机科学与技术学院、软件学院', '物联网工程', '物联网工程1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (853, '计算机科学与技术学院、软件学院', '实验班', '实验班1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (854, '计算机科学与技术学院、软件学院', '实验班', '实验班1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (855, '计算机科学与技术学院、软件学院', '实验班', '实验班1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (856, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (857, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1802');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (858, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1803');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (859, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (860, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1703');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (861, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (862, '计算机科学与技术学院、软件学院', '网络工程', '网络工程1602');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (863, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (864, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1802');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (865, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1803');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (866, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1804');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (867, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1805');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (868, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1806');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (869, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (870, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1702');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (871, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1703');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (872, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1704');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (873, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (874, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1602');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (875, '计算机科学与技术学院、软件学院', '软件工程', '软件工程1603');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (876, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (877, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1802');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (878, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1803');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (879, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (880, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1703');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (881, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (882, '计算机科学与技术学院、软件学院', '数字媒体技术', '数字媒体技术1602');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (883, '计算机科学与技术学院、软件学院', '数据科学与大数据技术', '数据科学与大数据技术1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (884, '计算机科学与技术学院、软件学院', '数据科学与大数据技术', '数据科学与大数据技术1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (885, '计算机科学与技术学院、软件学院', '数据科学与大数据技术', '数据科学与大数据技术1601');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (886, '计算机科学与技术学院、软件学院', '计算机科学与技术', '计算机科学与技术1801');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (887, '计算机科学与技术学院、软件学院', '计算机科学与技术', '计算机科学与技术1701');
INSERT INTO zjut_health_code.view_class (id, collage, major, class) VALUES (888, '计算机科学与技术学院、软件学院', '计算机科学与技术', '计算机科学与技术1601');