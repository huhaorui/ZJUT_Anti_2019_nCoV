create table teacher
(
    collage   int         not null,
    id        varchar(16) not null,
    person_id varchar(32) not null,
    name      varchar(64) not null,
    constraint teacher_id_uindex
        unique (id),
    constraint teacher_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

alter table teacher
    add primary key (id);

INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (1, '000001', '330000000000000000', 'TEA00001');
INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (1, '000002', '330000000020000002', 'TEA00002');
INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (1, '000003', '330000000020000003
', 'TEA00003');
INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (2, '000004', '330000000020000004
', 'TEA00004');
INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (2, '000005', '330000000020000005
', 'TEA00005');
INSERT INTO zjut_health_code.teacher (collage, id, person_id, name) VALUES (2, '000006', '330000000020000006
', 'TEA00006');