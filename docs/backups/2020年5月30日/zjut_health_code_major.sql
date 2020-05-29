create table major
(
    id      int auto_increment
        primary key,
    collage int         not null,
    name    varchar(32) not null,
    constraint major_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

INSERT INTO zjut_health_code.major (id, collage, name) VALUES (478, 455, '电子科学与技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (479, 455, '通信工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (480, 455, '电子信息工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (481, 455, '电气工程及其自动化');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (482, 455, '自动化');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (483, 459, '物联网工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (484, 459, '实验班');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (485, 459, '网络工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (486, 459, '软件工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (487, 459, '数字媒体技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (488, 459, '数据科学与大数据技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (489, 459, '计算机科学与技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (490, 472, '建筑学');