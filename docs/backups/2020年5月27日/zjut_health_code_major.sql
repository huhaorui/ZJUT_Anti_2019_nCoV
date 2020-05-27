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

INSERT INTO zjut_health_code.major (id, collage, name) VALUES (2, 1, '物联网');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (3, 1, '数字媒体技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (4, 1, '软件工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (5, 2, '通信工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (6, 2, '自动化');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (7, 2, '电子科学与技术');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (8, 1, '网络工程');
INSERT INTO zjut_health_code.major (id, collage, name) VALUES (9, 1, '实验班');