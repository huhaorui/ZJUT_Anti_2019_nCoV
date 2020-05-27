create table password_reset
(
    id    varchar(16) not null,
    token char(64)    not null
);

INSERT INTO zjut_health_code.password_reset (id, token) VALUES ('1', '2');