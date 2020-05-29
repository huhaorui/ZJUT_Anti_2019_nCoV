create table teacher
(
    id        varchar(16) not null,
    name      varchar(64) not null,
    person_id varchar(32) not null,
    collage   int         not null,
    constraint teacher_id_uindex
        unique (id),
    constraint teacher_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

alter table teacher
    add primary key (id);

INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00000', '教师00000号', '136722817772016452', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00001', '教师00001号', '136722817772016453', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00002', '教师00002号', '136722817772016454', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00003', '教师00003号', '136722817772016453', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00004', '教师00004号', '136722817772016452', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00005', '教师00005号', '136722817772016453', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00006', '教师00006号', '136722817772016452', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00007', '教师00007号', '136722817772016453', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00008', '教师00008号', '136722817772016452', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00009', '教师00009号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00010', '教师00010号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00011', '教师00011号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00012', '教师00012号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00013', '教师00013号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00014', '教师00014号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00015', '教师00015号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00016', '教师00016号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00017', '教师00017号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00018', '教师00018号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00019', '教师00019号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00020', '教师00020号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00021', '教师00021号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00022', '教师00022号', '136722817772016452', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00023', '教师00023号', '136722817772016453', 455);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00024', '教师00024号', '136722817772016452', 459);
INSERT INTO zjut_health_code.teacher (id, name, person_id, collage) VALUES ('00025', '教师00025号', '136722817772016452', 472);