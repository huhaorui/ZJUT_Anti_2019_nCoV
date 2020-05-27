create table punch_record
(
    uid    varchar(16) not null,
    date   date        not null,
    time   time        not null,
    status int         not null,
    primary key (uid, date)
);

INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061108', '2020-05-21', '05:00:00', 127);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061108', '2020-05-22', '05:00:00', 127);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-21', '05:00:00', 68);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-22', '05:00:00', 68);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-23', '05:00:00', 68);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-24', '05:00:00', 68);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-25', '05:00:00', 68);
INSERT INTO zjut_health_code.punch_record (uid, date, time, status) VALUES ('201806061219', '2020-05-26', '05:00:00', 68);