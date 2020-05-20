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
    id   int auto_increment
        primary key,
    name varchar(32) not null
);

create table health_code_token
(
    uid   varchar(16) not null,
    token varchar(64) null,
    constraint uid
        unique (uid)
);

alter table health_code_token
    add primary key (uid);

create table health_info
(
    uid              varchar(12) not null,
    tel              varchar(16) not null,
    if_danger_14     int         not null,
    if_abroad_14     int         not null,
    if_touch_illness int         not null,
    if_ill           int         not null,
    status           int         not null,
    color            varchar(8)  not null,
    constraint health_info_uid_uindex
        unique (uid)
);

alter table health_info
    add primary key (uid);

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

create table class
(
    id    int auto_increment
        primary key,
    major int         not null,
    name  varchar(32) not null,
    constraint class_major_fk
        foreign key (major) references major (id)
            on update cascade on delete cascade
);

create table password_reset
(
    id    varchar(16) not null,
    token char(64)    not null
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

create definer = zjut_health_code@`%` view Teacher_Student as
select `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`,
       `zjut_health_code`.`student`.`name`      AS `name`
from `zjut_health_code`.`student`
union
select `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`
from `zjut_health_code`.`teacher`;

create definer = zjut_health_code@`%` view view_class as
select `zjut_health_code`.`class`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`,
       `zjut_health_code`.`class`.`name`   AS `class`
from `zjut_health_code`.`class`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where ((`zjut_health_code`.`major`.`collage`, `zjut_health_code`.`class`.`major`) =
       (`zjut_health_code`.`collage`.`id`, `zjut_health_code`.`major`.`id`));

create definer = zjut_health_code@`%` view view_collage as
select `zjut_health_code`.`collage`.`id` AS `id`, `zjut_health_code`.`collage`.`name` AS `collage`
from `zjut_health_code`.`collage`;

create definer = zjut_health_code@`%` view view_major as
select `zjut_health_code`.`major`.`id`     AS `id`,
       `zjut_health_code`.`collage`.`name` AS `collage`,
       `zjut_health_code`.`major`.`name`   AS `major`
from `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where (`zjut_health_code`.`major`.`collage` = `zjut_health_code`.`collage`.`id`);

create definer = zjut_health_code@`%` view view_student as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`major`.`name`        AS `major`,
       `zjut_health_code`.`class`.`name`        AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`collage`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`class`
         join `zjut_health_code`.`student`
where ((`zjut_health_code`.`class`.`id`, `zjut_health_code`.`major`.`id`, `zjut_health_code`.`collage`.`id`) =
       (`zjut_health_code`.`student`.`class`, `zjut_health_code`.`class`.`major`,
        `zjut_health_code`.`major`.`collage`));

create definer = zjut_health_code@`%` view view_student_full as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`major`.`name`        AS `major`,
       `zjut_health_code`.`class`.`name`        AS `class`,
       `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`student`
         join `zjut_health_code`.`class`
         join `zjut_health_code`.`major`
         join `zjut_health_code`.`collage`
where ((`zjut_health_code`.`student`.`class`, `zjut_health_code`.`class`.`major`,
        `zjut_health_code`.`major`.`collage`) =
       (`zjut_health_code`.`class`.`id`, `zjut_health_code`.`major`.`id`, `zjut_health_code`.`collage`.`id`));

create definer = zjut_health_code@`%` view view_teacher as
select `zjut_health_code`.`collage`.`name`      AS `collage`,
       `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`collage`
         join `zjut_health_code`.`teacher`
where (`zjut_health_code`.`teacher`.`collage` = `zjut_health_code`.`collage`.`id`);

create definer = zjut_health_code@`%` view view_teacher_student as
select `zjut_health_code`.`student`.`id`        AS `id`,
       `zjut_health_code`.`student`.`name`      AS `name`,
       `zjut_health_code`.`student`.`person_id` AS `person_id`
from `zjut_health_code`.`student`
union
select `zjut_health_code`.`teacher`.`id`        AS `id`,
       `zjut_health_code`.`teacher`.`name`      AS `name`,
       `zjut_health_code`.`teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`teacher`;

create definer = zjut_health_code@`%` view view_teacher_student_full as
select '学生'                       AS `type`,
       `view_student`.`collage`   AS `collage`,
       `view_student`.`major`     AS `major`,
       `view_student`.`class`     AS `class`,
       `view_student`.`id`        AS `id`,
       `view_student`.`name`      AS `name`,
       `view_student`.`person_id` AS `person_id`
from `zjut_health_code`.`view_student`
union
select '教师'                       AS `type`,
       `view_teacher`.`collage`   AS `collage`,
       ''                         AS `major`,
       ''                         AS `class`,
       `view_teacher`.`id`        AS `id`,
       `view_teacher`.`name`      AS `name`,
       `view_teacher`.`person_id` AS `person_id`
from `zjut_health_code`.`view_teacher`;


