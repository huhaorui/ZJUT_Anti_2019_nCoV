create table class
(
    id    int auto_increment
        primary key,
    major int         not null,
    name  varchar(32) not null
);

create index class_major_fk
    on class (major);

INSERT INTO zjut_health_code.class (id, major, name) VALUES (835, 478, '电子科学与技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (836, 478, '电子科学与技术1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (837, 478, '电子科学与技术1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (838, 479, '通信工程1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (839, 479, '通信工程1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (840, 479, '通信工程1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (841, 480, '电子信息工程1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (842, 480, '电子信息工程1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (843, 480, '电子信息工程1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (844, 481, '电气工程及其自动化1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (845, 481, '电气工程及其自动化1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (846, 481, '电气工程及其自动化1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (847, 482, '自动化1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (848, 482, '自动化1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (849, 482, '自动化1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (850, 483, '物联网工程1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (851, 483, '物联网工程1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (852, 483, '物联网工程1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (853, 484, '实验班1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (854, 484, '实验班1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (855, 484, '实验班1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (856, 485, '网络工程1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (857, 485, '网络工程1802');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (858, 485, '网络工程1803');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (859, 485, '网络工程1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (860, 485, '网络工程1703');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (861, 485, '网络工程1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (862, 485, '网络工程1602');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (863, 486, '软件工程1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (864, 486, '软件工程1802');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (865, 486, '软件工程1803');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (866, 486, '软件工程1804');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (867, 486, '软件工程1805');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (868, 486, '软件工程1806');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (869, 486, '软件工程1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (870, 486, '软件工程1702');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (871, 486, '软件工程1703');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (872, 486, '软件工程1704');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (873, 486, '软件工程1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (874, 486, '软件工程1602');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (875, 486, '软件工程1603');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (876, 487, '数字媒体技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (877, 487, '数字媒体技术1802');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (878, 487, '数字媒体技术1803');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (879, 487, '数字媒体技术1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (880, 487, '数字媒体技术1703');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (881, 487, '数字媒体技术1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (882, 487, '数字媒体技术1602');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (883, 488, '数据科学与大数据技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (884, 488, '数据科学与大数据技术1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (885, 488, '数据科学与大数据技术1601');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (886, 489, '计算机科学与技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (887, 489, '计算机科学与技术1701');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (888, 489, '计算机科学与技术1601');