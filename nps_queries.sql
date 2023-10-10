create database nps_data;

use nps_data;
show tables;

alter table ulb_data.nps_reg_data rename nps_data.nps_reg_data;

create table upload_data (
TRANSACTION_ID bigint not null,
DDO_REG_NO text(10) not null,
PRAN double not null,
SUBS_NAME text(100) not null,
GOVT_CONTR int,
SELF_CONTR int,
CONTR_MONTH int,
CONTR_YEAR double,
CONTR_TYPE text(10),
REMARKS text(100)
);

drop table upload_data;

select * from upload_data;

truncate upload_data;

select sum(GOVT_CONTR), sum(SELF_CONTR) from upload_data;