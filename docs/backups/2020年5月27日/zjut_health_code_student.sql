create table student
(
    id        varchar(32) not null,
    class     int         not null,
    name      varchar(64) not null,
    person_id varchar(32) not null,
    constraint student_id_uindex
        unique (id),
    constraint student_class_fk
        foreign key (class) references class (id)
            on update cascade on delete cascade
);

alter table student
    add primary key (id);

INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201800000121', 6, '神秘人', '12345678');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060000', 4, 'STU0000', '330000000010000003');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060001', 4, 'STU0001', '330000000010000004');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806061108', 4, '胡皓睿', '330721200009133110');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806061219', 4, '王程飞', '33072620006272715');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201906061418', 1, '小可爱', '333333333333312345678');