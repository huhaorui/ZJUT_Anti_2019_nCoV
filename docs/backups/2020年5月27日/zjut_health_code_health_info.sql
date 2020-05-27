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

INSERT INTO zjut_health_code.health_info (uid, tel, if_danger_14, if_abroad_14, if_touch_illness, if_ill, status, color) VALUES ('201806061108', '18257062065', 0, 0, 0, 0, 0, 'green');
INSERT INTO zjut_health_code.health_info (uid, tel, if_danger_14, if_abroad_14, if_touch_illness, if_ill, status, color) VALUES ('201906061418', '17857004680', 0, 0, 0, 0, 0, 'green');