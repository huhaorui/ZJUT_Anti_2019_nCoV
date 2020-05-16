create table collage
(
    cid  varchar(16) not null
        constraint collage_pk
            primary key nonclustered,
    name varchar(32) not null
)
go

create unique index collage_cid_uindex
    on collage (cid)
go

create unique index collage_name_uindex
    on collage (name)
go

create table health_info
(
    uid                 varchar(16) not null
        constraint health_info_pk
            primary key nonclustered,
    tel                 varchar(16) not null,
    if_danger_14        int         not null,
    if_abroad_14        int         not null,
    if_touch_illness_14 int         not null,
    if_ill              int,
    health_status       int
)
go

create unique index health_info_uid_uindex
    on health_info (uid)
go

create table major
(
    mid  varchar(16) not null
        constraint major_pk
            primary key nonclustered
        constraint major_collage_fk
            references collage
            on update cascade on delete cascade,
    name varchar(32) not null,
    cid  varchar(16) not null
)
go

create table class
(
    class_id varchar(16) not null
        constraint class_pk
            primary key nonclustered
        constraint class_major_fk
            references major
            on update cascade on delete cascade,
    name     varchar(32) not null
)
go

create unique index class_class_id_uindex
    on class (class_id)
go

create unique index major_mid_uindex
    on major (mid)
go

create table punch_record
(
    uid         varchar(16) not null,
    date        date        not null,
    time        time        not null,
    health_info int         not null,
    constraint punch_record_pk
        primary key (uid, date)
)
go

exec sp_addextendedproperty 'MS_Description', '????', 'SCHEMA', 'dbo', 'TABLE', 'punch_record'
go

create table student
(
    sid       varchar(16) not null
        constraint student_pk
            primary key nonclustered
        constraint student_class_fk
            references class
            on update cascade on delete cascade,
    person_id varchar(32) not null,
    name      varchar(64) not null
)
go

create unique index student_sid_uindex
    on student (sid)
go

create table teacher
(
    tid       varchar(16) not null
        constraint teacher_pk
            primary key nonclustered
        constraint collage_teacher_fk
            references collage
            on update cascade on delete cascade,
    person_id varchar(32) not null,
    name      char(64)
)
go

create unique index teacher_tid_uindex
    on teacher (tid)
go


