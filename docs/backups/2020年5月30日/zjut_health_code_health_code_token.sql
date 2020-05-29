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

