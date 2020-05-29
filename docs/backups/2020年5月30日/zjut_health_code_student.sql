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

INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060001', 856, '学生划水01号', '330726200006272000');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060002', 847, '学生划水02号', '330726200006272001');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060003', 835, '学生划水03号', '330726200006272000');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060004', 838, '学生划水04号', '330726200006272001');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060005', 856, '学生划水05号', '330726200006272000');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806060006', 886, '学生划水06号', '330726200006272001');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806061108', 867, '胡皓睿', '330726200009130000');
INSERT INTO zjut_health_code.student (id, class, name, person_id) VALUES ('201806061219', 867, '王程飞', '330726200006272000');