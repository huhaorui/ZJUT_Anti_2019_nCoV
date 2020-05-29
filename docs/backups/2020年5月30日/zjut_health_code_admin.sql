create table admin
(
    id       varchar(16) not null,
    level    int         not null,
    target   int         null,
    password varchar(32) not null,
    email    varchar(64) not null,
    constraint admin_id_uindex
        unique (id),
    constraint admin_collage_fk
        foreign key (target) references collage (id)
            on update cascade on delete cascade
);

alter table admin
    add primary key (id);

INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000000', 9, null, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000001', 9, null, 'a4b2496f50accbf0128aa8ea4f110fbf', 'i@huhaorui.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000002', 5, null, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000003', 1, null, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000004', 5, null, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000005', 2, 459, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000006', 2, 455, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000007', 2, 472, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');
INSERT INTO zjut_health_code.admin (id, level, target, password, email) VALUES ('000008', 2, 461, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');