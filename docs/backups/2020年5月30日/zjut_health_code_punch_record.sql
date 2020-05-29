create table punch_record
(
    uid    varchar(16) not null,
    date   date        not null,
    time   time        not null,
    status int         not null,
    primary key (uid, date)
);

