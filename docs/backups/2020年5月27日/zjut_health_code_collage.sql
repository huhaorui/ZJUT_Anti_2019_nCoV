create table collage
(
    id   int auto_increment
        primary key,
    name varchar(32) not null
);

INSERT INTO zjut_health_code.collage (id, name) VALUES (1, '计算机科学与技术学院、软件学院');
INSERT INTO zjut_health_code.collage (id, name) VALUES (2, '信息工程学院');