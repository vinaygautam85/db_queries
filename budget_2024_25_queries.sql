create database budget_data_2023_24;
create database budget_data_2024_25;

use budget_data_2023_24;
use budget_data_2024_25;

alter table ulb_data.salary_budget_2023_24 rename budget_data_2024_25.salary_budget_2024_25;

show tables;
show databases;

create table salary_budget_2024_25 (
ulb_name varchar(100) primary key,
ulb_hrms_code varchar(10),
emp_id bigint,
pension_type varchar(5),
pran bigint,
emp_name varchar(100),
gender varchar(2),
designation varchar(50),
payscale_min int,
payscale_max int,
basic_pay int,
basic_pay_for_year int,
increment_month date,
increment_rate int,
increment_for_year int,
basic_incrnt_total int,
da_for_year int,
hra_for_year int,
ma_for_year int,
ua_pk_spcl_for_year int,
cca_for_year int,
other_allowance_type varchar(5),
oa_amount_for_year int,
surrender_leave_encash int,
nps_contr_for_year int,
total int
);

select * from salary_budget_2024_25;