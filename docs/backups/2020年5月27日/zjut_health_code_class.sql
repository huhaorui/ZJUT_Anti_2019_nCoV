create table class
(
    id    int auto_increment
        primary key,
    major int         not null,
    name  varchar(32) not null,
    constraint class_major_fk
        foreign key (major) references major (id)
            on update cascade on delete cascade
);

INSERT INTO zjut_health_code.class (id, major, name) VALUES (1, 2, '物联网1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (2, 2, '物联网1802');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (3, 3, '数字媒体技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (4, 4, '软件工程1805');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (5, 4, '软件工程1804');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (6, 4, '软件工程1803');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (7, 6, '自动化1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (8, 6, '自动化1802');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (9, 7, '电子科学与技术1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (10, 9, '实验班1801');
INSERT INTO zjut_health_code.class (id, major, name) VALUES (11, 5, '通信工程1801');