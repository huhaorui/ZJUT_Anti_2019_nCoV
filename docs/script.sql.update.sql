create table admin
(
    id       varchar(16) not null,
    level    int         not null,
    target   varchar(16) not null,
    password varchar(32) not null,
    email    varchar(64) not null,
    constraint admin_id_uindex
        unique (id)
);

alter table admin
    add primary key (id);

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
    collage varchar(16) not null,
    id      varchar(16) not null,
    name    varchar(32) not null,
    primary key (collage, id),
    constraint major_id_collage_uindex
        unique (id, collage),
    constraint major_collage_fk
        foreign key (collage) references collage (id)
            on update cascade on delete cascade
);

create table class
(
    collage varchar(16) not null,
    major   varchar(16) not null,
    id      varchar(16) not null,
    name    varchar(32) not null,
    primary key (collage, id, major),
    constraint class_id_uindex
        unique (id, major, collage),
    constraint class_major_fk
        foreign key (major, collage) references major (id, collage)
            on update cascade on delete cascade
);

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
    collage   varchar(16) not null,
    major     varchar(16) not null,
    class     varchar(16) not null,
    id        varchar(32) not null,
    name      varchar(64) not null,
    person_id varchar(32) not null,
    constraint student_id_uindex
        unique (id),
    constraint student_class_fk
        foreign key (class, major, collage) references class (id, major, collage)
            on update cascade on delete cascade
);

alter table student
    add primary key (id);

create table teacher
(
    collage   varchar(16) not null,
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


