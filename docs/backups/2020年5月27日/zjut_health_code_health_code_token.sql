create table health_code_token
(
    uid   varchar(16) not null,
    token varchar(64) null,
    used  varchar(8)  null,
    constraint uid
        unique (uid)
);

alter table health_code_token
    add primary key (uid);

INSERT INTO zjut_health_code.health_code_token (uid, token, used) VALUES ('201806061108', 'bf748529b14943afa4b5ba4f01d4f5f4', 'false');
INSERT INTO zjut_health_code.health_code_token (uid, token, used) VALUES ('201906061418', 'ccf1f80ed2064275b0153f52c414dbed', 'false');