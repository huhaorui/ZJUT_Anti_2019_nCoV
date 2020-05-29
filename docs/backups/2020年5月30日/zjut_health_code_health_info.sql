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

