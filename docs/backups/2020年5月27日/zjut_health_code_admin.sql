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

INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('00000', 9, '0', 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('00001', 9, '0', '3faad66e117dcb06b206afb4e6b2a178', 'i@huhaorui.com');