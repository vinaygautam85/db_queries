create database ulb_data;

use ulb_data;
show tables;

select table_name, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'ulbs';

/* ---------------------------------------------------- Table Division -------------------------------------------------- */

create table division (
div_id int(2) not null auto_increment,
div_name char(100) not null,

primary key (div_id)
);

truncate division;

drop table division;

show tables;

desc division;

insert into division values
(01,"Belagavi"),(02,"Bengaluru"),(03,"Kalaburagi"),(04,"Mysuru");

select * from division;

alter table division modify column div_id int(2);

/* ---------------------------------------------------- Table districts -------------------------------------------------- */

create table district (
dist_id int(3) not null auto_increment,
dist_name char(100) not null,
dist_div_id int(2) not null,

PRIMARY KEY (dist_id),
CONSTRAINT fk_div_dist FOREIGN KEY (dist_div_id) REFERENCES division(div_id)
);

select * from district;

desc district;

insert into district values
(2,"Bagalakote",1),
(11,"Ballari",3),
(1,"Belagavi",1),
(29,"Bengaluru Rural",2),
(18,"Bengaluru Urban",2),
(4,"Bidar",3),
(24,"Chamarajanagara",4),
(28,"Chikkaballapura",2),
(16,"Chikkamagaluru",4),
(12,"Chitradurga",2),
(21,"Dakshina Kannada",4),
(13,"Davanagere",2),
(8,"Dharwad",1),
(7,"Gadag",1),
(20,"Hassan",4),
(10,"Haveri",1),
(25,"Kalaburagi",3),
(22,"Kodagu",4),
(27,"Kolar",2),
(6,"Koppal",3),
(19,"Mandya",4),
(23,"Mysuru",4),
(5,"Raichur",3),
(30,"Ramanagara",2),
(14,"Shivamogga",2),
(17,"Tumakuru",2),
(15,"Udupi",4),
(9,"Uttara Kannada",1),
(3,"Vijayapura",1),
(26,"Yadagiri",3),
(31,"Vijayanagara",3)
;

select district.dist_id, district.dist_name, division.div_name
from district
inner join division
on district.dist_div_id = division.div_id
order by dist_id;

select divn.div_name, count(dis.dist_name) as num_of_districts
from district dis
inner join division divn
on dis.dist_div_id = divn.div_id
group by divn.div_name
order by num_of_districts desc;

show tables;

select * from division;

commit;

insert into division (div_name) values ("dharwad");

delete from division where div_name like "%dhar%";

desc district;

alter table division modify column div_id int(2) not null auto_increment;

alter table district drop foreign key dist_div_id;

truncate district;

drop table district;

/* ---------------------------------------------------- Table pension_type -------------------------------------------------- */

create table pension_type (
pension_id int not null primary key,
pension_type varchar(5) not null
);

insert into pension_type values
(1,'OPS'),
(2,'NPS')
;

select * from pension_type;

/* ---------------------------------------------------- Table ulb_type -------------------------------------------------- */

create table ulb_type (
type_id int primary key not null,
type_short varchar(5) not null,
type_full varchar(25) not null
);

desc ulb_type;

insert into ulb_type values
(1,'CC','City Corporation'),
(2,'CMC','City Municipal Council'),
(3,'TMC','Town Municipal Council'),
(4,'TP','Town Panchayat'),
(5,'NAC','Notified Area Committee'),
(6,'CB','Cantonment Board'),
(7,'OB','Other Board')
;

select * from ulb_type;

/* ---------------------------------------------------- Table ULBs -------------------------------------------------- */

create table ulbs (
ulb_hrms_id varchar(10) not null,
ulb_name char(100) not null,
ulb_type_id int not null,
ulb_dist_id int not null,

primary key (ulb_hrms_id),
constraint fk_dist_id foreign key (ulb_dist_id) references district(dist_id),
constraint fk_ulb_type_id foreign key (ulb_type_id) references ulb_type(type_id)
);

use ulb_data;
truncate ulbs;
drop table ulbs;

ALTER TABLE ulbs DROP FOREIGN KEY ulb_dist_id;

select * from ulbs;

desc ulbs;

insert into ulbs values
('2200CC0001','Belagavi',1,1),
('2204CU0001','Gokak',2,1),
('2210CU0001','Nippani',2,1),
('2252TU0001','Mudalagi',3,1),
('2201TU0001','Athani',3,1),
('2202TU0001','Bylahongala',3,1),
('2203TU0001','Chikkodi',3,1),
('2208TU0001','Ramadurga',3,1),
('2211TU0001','Sankeshwara',3,1),
('2209TU0001','Savadatti',3,1),
('2205PU0001','Hukkeri',3,1),
('2207PU0002','Kudachi',3,1),
('2203PU0002','Sadalaga',3,1),
('2207TU0001','Mugalkhoda',3,1),
('2209TU0002','Munavalli',3,1),
('2214TU0001','Ugarkhurda',3,1),
('2000PU0002','Konnur',3,1),
('2207TU0002','Harugeri',3,1),
('2204TP0002','Ghataprabha',3,1),
('2206PU0001','Khanapura',4,1),
('2207PU0001','Raibagh',4,1),
('2207TP0001','Kankanawadi',4,1),
('2251TP0001','MK-Hubballi',4,1),
('2252TP0001','Naganur',4,1),
('2207TP0002','Chinchili',4,1),
('2203TP0001','Examba',4,1),
('2251TP0002','Chennamma-Kithur',4,1),
('2252TP0002','Kalloli',4,1),
('2214TP0001','Ainapura',4,1),
('2214TP0002','Shedbala',4,1),
('2203TP0002','Kabbur',4,1),
('2252TP0003','Arambhavi',4,1),
('2203TP0003','Boragava',4,1),
('2201TU0002','Kagawada',4,1),
('2209TU0003','Yaragatti',4,1),
('2200PU0001','Machhe',4,1),
('2200TP0002','Peeranwadi',4,1),
('2204PU0001','Ankalagi-Akkatangerahala',4,1),
('2900CU0001','Bagalakote',2,2),
('2903CU0001','Rabakavi-Banahatti',2,2),
('2906CU0001','Jamakhandi',2,2),
('2905CU0001','Ilakal',2,2),
('2908TU0001','Mudhol',2,2),
('2900TU0002','Mahalingapura',3,2),
('2904TU0001','Guledagudda',3,2),
('2901TU0001','Badami',3,2),
('2906TU0002','Teradal',3,2),
('2907PU0001','Hunagunda',3,2),
('2902PU0001','Bilagi',4,2),
('2901PU0002','Kerur',4,2),
('2907TP0001','Amingada',4,2),
('2908TP0001','Belagali',4,2),
('2907TP0002','Kamathagi',4,2),
('2908PU0001','Lokapura',4,2),
('2900PU0001','Shirur',4,2),
('2800CU0001','Vijayapura',1,3),
('2802TU0001','Indi',3,3),
('2803TU0001','Muddebihal',3,3),
('2804TU0001','Sindhagi',3,3),
('2805TU0001','Talikote',3,3),
('2800TU0002','Basavana-Bagewadi',3,3),
('2804TP0001','Alamela',4,3),
('2801TP0002','Managooli',4,3),
('2801TP0001','Kolhara',4,3),
('2803TP0001','Nalatavada',4,3),
('2806TP0001','Nidagundi',4,3),
('2804TP0004','Devarahipparagi',4,3),
('2808TP0001','Chadchana',4,3),
('2800PU0002','Tikota',4,3),
('2800PU0003','Babaleshwar',4,3),
('3800CU0001','Bidar',2,4),
('3802CU0001','Basavakalyana',2,4),
('3800TU0002','Chitaguppa',3,4),
('3804TU0001','Humnabad',3,4),
('3803TU0001','Bhalki',3,4),
('3804TU0002','Hallikheda',3,4),
('3801PU0001','Aurad',4,4),
('3600CU0001','Raichur',2,5),
('3604CU0001','Sindhanur',2,5),
('3603TU0001','Manvi',3,5),
('3601TU0001','Devadurga',3,5),
('3602TU0001','Lingasugur',3,5),
('3651PU0001','Mudagal',3,5),
('3651TU0001','Maski',3,5),
('3603TP0001','Kavitala',4,5),
('3604TP0001','Turuvihala',4,5),
('3604TP0002','Balaganur',4,5),
('3603TP0002','Sirivara',4,5),
('3602TU0002','Hatti',4,5),
('0500NAC001','Hatti Gold Mines',5,5),
('1500CU0001','Koppal',2,6),
('1501CU0001','Gangavathi',2,6),
('1502TU0001','Kustagi',3,6),
('1501TU0001','Karatagi',3,6),
('1503PU0001','Yelaburga',4,6),
('1503TP0001','Kukanuru',4,6),
('1501TP0001','Kanakagiri',4,6),
('1502TP0001','Tavaragera',4,6),
('1500TP0001','Bhagyanagara',4,6),
('2600CU0001','Gadag-Betageri',2,7),
('2600TU0002','Gajendragada',3,7),
('2603TU0001','Naragunda',3,7),
('2601TU0001','Lakshmeshwara',3,7),
('2602TU0001','Mundaragi',3,7),
('2651TU0001','Rona',3,7),
('2605PU0001','Shirahatti',4,7),
('2600PU0002','Mulagunda',4,7),
('2651PU0002','Naregal',4,7),
('2500CC0001','Hubballi-Dharwad',1,8),
('2500TU0002','Annigeri',3,8),
('2503TU0001','Navalagunda',3,8),
('2500PU0002','Alnavar',4,8),
('2501PU0001','Kalaghatagi',4,8),
('2502PU0001','Kundagol',4,8),
('3000CU0001','Karawara',2,9),
('3011CU0001','Dandeli',2,9),
('3008CU0001','Sirasi',2,9),
('3002TU0001','Bhatkal',3,9),
('3005TU0001','Kumta',3,9),
('3003PU0001','Haliyala',3,9),
('3001PU0001','Ankola',3,9),
('3004PU0001','Honnavara',4,9),
('3006PU0001','Mundagod',4,9),
('3007PU0001','Siddapura',4,9),
('3010PU0001','Yellapura',4,9),
('3002TP0001','Jali',4,9),
('3004PU0002','Manki',4,9),
('2700CU0001','Haveri',2,10),
('2706CU0001','Ranebennur',2,10),
('2701TU0001','Byadagi',3,10),
('2702TU0001','Hanagal',3,10),
('2704TU0001','Savanur',3,10),
('2705TU0001','Shiggaon',3,10),
('2705TU0002','Bankapura',3,10),
('2703PU0001','Hirekerur',4,10),
('2700TP0001','Guthala',4,10),
('2703PU0002','Rattihalli',4,10),
('3400CC0001','Ballari',1,11),
('3406TU0001','Siraguppa',2,11),
('3400TU0002','Kampli',3,11),
('3405TU0001','Sandur',3,11),
('3405TU0002','Kurekuppa',3,11),
('3451TU0001','Kurugodu',3,11),
('3406PU0002','Tekkalakote',4,11),
('3451TP0001','Kudithini',4,11),
('1600CU0001','Chitradurga',2,12),
('1601TU0001','Challakere',2,12),
('1602TU0001','Hiriyur',2,12),
('1604TU0001','Hosadurga',3,12),
('1603TP0001','Holalkere',3,12),
('1605TP0001','Molakalmuru',4,12),
('1601TP0001','Nayakanahatti',4,12),
('1700CC0001','Davanagere',1,13),
('1703CU0001','Harihara',2,13),
('1705PU0001','Channagiri',3,13),
('1703TU0001','Malebennur',3,13),
('1706PU0001','Honnali',3,13),
('1701PU0001','Jagalur',4,13),
('1706PU0002','Nyamathi',4,13),
('1400CU0001','Shivamogga',1,14),
('1401CU0001','Bhadravathi',2,14),
('1403CU0001','Sagar',2,14),
('1404TU0001','Shikaripura',3,14),
('1451TP0001','Shiralakoppa',3,14),
('1405PU0001','Soraba',3,14),
('1402TP0001','Hosanagara',4,14),
('1406PU0001','Thirthahalli',4,14),
('1403TP0001','Jog-Kargal',4,14),
('1405TP0001','Anavatti',4,14),
('1401TP0001','Holehonnur',4,14),
('2000CU0001','Udupi',2,15),
('2004TU0001','Karkala',3,15),
('2005TU0001','Kundapura',3,15),
('2000TU0002','Kapu',3,15),
('2000TU0001','Saligrama',4,15),
('2051PU0001','Baindur',4,15),
('1800CU0001','Chikkamagaluru',2,16),
('1800TU0001','Birur',3,16),
('1801TU0001','Kadur',3,16),
('1806TU0001','Tarikere',3,16),
('1802PU0001','Koppa',4,16),
('1803PU0001','Mudigere',4,16),
('1804PU0001','Narasimharajapura',4,16),
('1805PU0001','Sringeri',4,16),
('1806PU0002','Ajjampura',4,16),
('1600NAC001','Kuduremukha',5,16),
('0800CU0001','Tumakuru',1,17),
('0808CU0001','Tipatur',2,17),
('0807CU0001','Sira',2,17),
('0801TU0001','Chikkanayakanahalli',3,17),
('0804TU0001','Kunigal',3,17),
('0805TU0001','Madhugiri',3,17),
('0806TU0001','Pavagada',3,17),
('0802TP0001','Gubbi',4,17),
('0803TP0001','Koratagere',4,17),
('0809TP0001','Turuvekere',4,17),
('0801TU0002','Huliyar',4,17),
('1800BBMP01','Bengaluru',1,18),
('0101CU0001','Hebbagodi',2,18),
('0100CU0003','Madanayakanahalli',2,18),
('0101TU0003','Bommasandra',3,18),
('0101TU0001','Anekal',3,18),
('0101TU0004','Jigani',3,18),
('0101TU0005','Chandapura',3,18),
('0101TU0002','Attibele',3,18),
('0100TU0006','Hunasamaranahalli',3,18),
('0102TU0001','Chikkabanavar',3,18),
('1800PU0001','Doddathoguru',4,18),
('1100CU0001','Mandya',2,19),
('1102TU0001','Maddur',3,19),
('1103TU0001','Malavalli',3,19),
('1106TU0001','Srirangapatna',3,19),
('1101TU0001','Krishnarajapet',3,19),
('1105PU0001','Pandavapura',3,19),
('1104PU0001','Nagamangala',3,19),
('1100TP0002','Bellur',4,19),
('1300CU0001','Hassan',2,20),
('1303TU0001','Arasikere',2,20),
('1305TU0001','Channarayapatna',3,20),
('1306TU0001','Holenarasipura',3,20),
('1307TU0001','Sakaleshpura',3,20),
('1304TU0001','Belur',3,20),
('1301PU0001','Alur',4,20),
('1302PU0001','Arakalagud',4,20),
('1900CC0001','Mangaluru',1,21),
('1903TU0001','Puttur',2,21),
('1900TU0001','Ullal',2,21),
('1953TU0001','Moodubidire',3,21),
('1981TU0001','Bantwal',3,21),
('1900PU0001','Someshwara',3,21),
('1901PU0001','Belthangadi',4,21),
('1951PU0001','Mulki',4,21),
('1904PU0001','Sullia',4,21),
('1952TP0001','Vitla',4,21),
('1900TP0001','Kotekaaru',4,21),
('1903PU0001','Kadaba',4,21),
('1900PU0002','Bajape',4,21),
('1900PU0003','Kinnigoli',4,21),
('1200CU0001','Madikeri',2,22),
('1202PU0001','Virajapet',3,22),
('1205PU0001','Kushalnagara',3,22),
('1201PU0001','Somavarpet',4,22),
('0900CC0001','Mysuru',1,23),
('0902TU0001','Hunasur',2,23),
('0904TU0001','Nanjangudu',2,23),
('0900CU0001','Hootagalli',2,23),
('0903TU0001','Krishnarajanagar',3,23),
('0906TU0001','Bannur',3,23),
('0906PU0001','Tirumakudalu-Narasipura',3,23),
('0905PU0001','Piriyapatna',3,23),
('0901PU0001','Heggadadevanakote',3,23),
('0904PU0002','Saragur',4,23),
('0900TP0001','Rammanahalli',4,23),
('0900PU0002','Kadakola',4,23),
('0900PU0001','Srirampura',4,23),
('0900TU0001','Bogadi',4,23),
('1000CU0001','Chamarajanagara',2,24),
('1002CU0001','Kollegala',2,24),
('1001TU0001','Gundlupete',3,24),
('1003PU0001','Yelandur',4,24),
('1000PU0001','Hanur',4,24),
('3200CC0001','Kalaburagi',1,25),
('3210CU0001','Shahabad',2,25),
('3200TU0002','Wadi',3,25),
('3202TU0001','Aland',3,25),
('3204TU0001','Chittapura',3,25),
('3206TU0001','Sedam',3,25),
('3201PU0001','Afzalpura',3,25),
('3203PU0001','Chincholi',3,25),
('3205PU0001','Jewargi',3,25),
('3213PU0001','Kalagi',4,25),
('3200PU0001','Kamalapura',4,25),
('3205TP0002','Yadrami',4,25),
('3200TP0001','Shahbad',5,25),
('3300CU0001','Yadagiri',2,26),
('3303TU0001','Shahapura',2,26),
('3304TU0001','Shorapura',2,26),
('3301PU0001','Gurumitkal',3,26),
('3302TU0001','Kakkera',3,26),
('3351TU0001','Kembhavi',3,26),
('3302PU0001','Hunasagi',4,26),
('2600NAC001','Bheemarayanagudi',5,26),
('0700CU0001','Kolar',2,27),
('0711CU0001','Robertsonpet(KGF)',2,27),
('0708TU0001','Mulabagal',2,27),
('0702TU0001','Bangarpet',3,27),
('0707TU0001','Malur',3,27),
('0710TU0001','Srinivasapura',3,27),
('0700PU0001','Vemagal-Kurugal',4,27),
('0600CU0001','Chikkaballapura',2,28),
('0602CU0001','Chintamani',2,28),
('0605TU0001','Shidlaghatta',2,28),
('0603TU0001','Gowribidanur',2,28),
('0601TU0001','Bagepalli',3,28),
('0706TP0001','Gudibande',4,28),
('0303CU0001','Doddaballapura',2,29),
('0304TU0001','Hosakote',2,29),
('0307TU0001','Nelamangala',2,29),
('0302TU0001','Devanahalli',3,29),
('0302TU0002','Vijaypura',3,29),
('0300PU0001','Bashettihalli',4,29),
('0400CU0001','Ramanagara',2,30),
('0401CU0001','Channapatna',2,30),
('0402TU0001','Kanakapura',2,30),
('0403TU0001','Magadi',3,30),
('0400TU0001','Bidadi',3,30),
('0402PU0001','Harohalli',4,30),
('3402CU0001','Hosapete',2,31),
('3400TU0003','Hoovinahadagali',3,31),
('3402PU0002','Kamalapura',3,31),
('1704TU0001','Harapanahalli',3,31),
('3404TU0001','Hagaribommanahalli',3,31),
('3403PU0002','Kottur',4,31),
('3403PU0001','Kudligi',4,31),
('3402TP0001','Mariyammanahalli',4,31)
;

select u.ulb_hrms_id, u.ulb_name, t.type_short, d.dist_name, dv.div_name
from ulbs u
left join district d
on u.ulb_dist_id = d.dist_id
left join division dv
on d.dist_div_id = dv.div_id
left join ulb_type t
on t.type_id = u.ulb_type_id
where ulb_name like "%Kamala%";

select u.ulb_hrms_id, u.ulb_name, t.type_short, d.dist_name, dv.div_name
from ulbs u
left join district d
on u.ulb_dist_id = d.dist_id
left join division dv
on d.dist_div_id = dv.div_id
left join ulb_type t
on t.type_id = u.ulb_type_id
where ulb_hrms_id = '3402PU0002';

select * from ulbs;

/* ---------------------------------------------------- View -------------------------------------------------- */
create view ulb_details as
select u.ulb_hrms_id, u.ulb_name, t.type_short, d.dist_name, dv.div_name
from ulbs u
left join district d
on u.ulb_dist_id = d.dist_id
left join division dv
on d.dist_div_id = dv.div_id
left join ulb_type t
on t.type_id = u.ulb_type_id;

select * from ulb_details;

select u.ulb_hrms_id, u.ulb_name, t.type_short, d.dist_name, dv.div_name
from ulbs u
left join district d
on u.ulb_dist_id = d.dist_id
left join division dv
on d.dist_div_id = dv.div_id
left join ulb_type t
on t.type_id = u.ulb_type_id
order by dist_id;

select dist_name, count(dist_id) as num_of_ULBs
from ulbs u
left join district d
on u.ulb_dist_id = d.dist_id
group by dist_id order by num_of_ulbs desc;

select t.type_short, count(type_short) as num_of_ULBs
from ulbs u
left join ulb_type t
on t.type_id = u.ulb_type_id
group by t.type_short order by t.type_short;

select ulb_hrms_id, ulb_name from ulbs where ulb_name like "%robert%";

update ulbs set ulb_name = "Robertsonpet(KGF)" where ulb_hrms_id = "";

desc ulbs;

show tables;

/* ------------------------------------ Table Employees ------------------------------------- */

