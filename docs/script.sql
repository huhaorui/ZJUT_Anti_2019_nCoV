create table collage
(
    id   varchar(16) not null,
    name varchar(32) not null,
    constraint collage_id_uindex
        unique (id)
);

alter table collage
    add primary key (id);

create table health_info
(
    uid              varchar(12) not null,
    tel              varchar(16) not null,
    if_danger_14     int         not null,
    if_abroad_14     int         not null,
    if_touch_illness int         not null,
    if_ill           int         not null,
    status           int         not null,
    constraint health_info_uid_uindex
        unique (uid)
);

alter table health_info
    add primary key (uid);

create table major
(
    id      varchar(16) not null,
    name    varchar(32) not null,
    collage varchar(16) null,
    constraint major_id_uindex
        unique (id),
    constraint major_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

alter table major
    add primary key (id);

create table class
(
    id    varchar(16) not null,
    name  varchar(32) null,
    major varchar(16) null,
    constraint class_id_uindex
        unique (id),
    constraint class_major_fk
        foreign key (major) references major (id)
            on update cascade on delete cascade
);

alter table class
    add primary key (id);

create table punch_record
(
    uid    varchar(16) not null,
    date   date        not null,
    time   time        not null,
    status int         not null,
    primary key (uid, date)
);

create table student
(
    id        varchar(32) not null,
    name      varchar(64) null,
    person_id varchar(32) null,
    class     varchar(16) null,
    constraint student_id_uindex
        unique (id),
    constraint student_class_fk
        foreign key (class) references class (id)
            on update cascade on delete cascade
);

alter table student
    add primary key (id);

create table teacher
(
    id        varchar(16) not null,
    name      varchar(64) not null,
    person_id varchar(32) null,
    collage   varchar(16) null,
    constraint teacher_id_uindex
        unique (id),
    constraint teacher_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

alter table teacher
    add primary key (id);


