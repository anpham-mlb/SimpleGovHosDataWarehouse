-- Case study 1
-- i The SQL commands to create the operational database
-- create clinic table
drop table clinic cascade constraints purge;
create table clinic (
hospital_id varchar2(10) not null,
hospital_name varchar2(50) not null,
hospital_address varchar2(50),
suburb varchar2(20),
postcode varchar2(20),
primary key (hospital_id)
);

insert into clinic values (
'1001', 
'The Alfred', 
'55 Commercial Rd, Victoria', 
'Melbourne', 
'3004'
);

insert into clinic values(
'1002',
'Caulfield Hospital',
'260-294 Kooyong Rd, Victoria',
'Caulfield',
'3162'
);

insert into clinic values(
'1003',
'Sandringham Hospital',
'193 Bluff Rd', 
'Sandringham', 
'3191'
);

insert into clinic values(
'1004',
'The Royal Melbourne Hospital - Royal Park Campus',
'34-54 Poplar Rd, Victoria',
'Parkville',
'3052'
);

insert into clinic values(
'1005',
'The Royal Melbourne Hospital - City Campus',
'300 Grattan Street, Victoria',
'Parkville',
'3050'
);

insert into clinic values(
'1006',
'Box Hill Hospital',
'8 Arnold Street, Victoria',
'Box Hill',
'3128'
);

insert into clinic values(
'1007',
'Casey Hospital',
'62-70 Kangan Dr',
'Berwick',
'3806'
);

-- create service table
-- Assume the cost for each service is for one day with the unit is Australian dollars
drop table service cascade constraints purge;
create table service (
service_id varchar2(10) not null,
staff_id varchar2(10) not null,
hospital_id varchar2(10) not null,
service_name varchar2(30) not null,
service_cost varchar2(10) not  null,
primary key (service_id, staff_id, hospital_id)
);

insert into service values (
's1',
'd1',
'1001',
'General medical consultation',
'50'
);

insert into service values (
's2',
'd1',
'1001',
'Aged care',
'47.86'
);

insert into service values (
's3',
'd3',
'1002',
'General medical consultation',
'48'
);

insert into service values (
's4',
'd4',
'1003',
'Neurodevelopmental stream',
'65'
);

insert into service values (
's5',
'd5',
'1004',
'Allergy Asthma and Immunology',
'125'
);

insert into service values (
's6',
'd6',
'1003',
'General medical consultation',
'65'
);

insert into service values (
's7',
'd7',
'1005',
'Audiology',
'19'
);

insert into service values (
's8',
'd2',
'1001',
'Aged Community Mental Health',
'35'
);

insert into service values (
's9',
'd8',
'1006',
'Cardiac Rehabilitation',
'41'
);

insert into service values (
's10',
'd5',
'1004',
'Anatomical Pathology',
'89'
);


-- create assignment table
drop table assignment cascade constraints purge;
create table assignment (
assignment_id varchar2(10) not null,
patient_id varchar2(10) not null,
patient_service_start_date date,
patient_service_end_date date,
service_id varchar2(10) not null,
primary key (assignment_id, patient_id)
);

insert into assignment values (
'a1',
'p1',
to_date('30/04/2019 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/05/2019 12.00', 'dd/mm/yyyy hh24.mi'),
's1'
);

insert into assignment values (
'a2',
'p2',
to_date('30/07/2020 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/09/2020 12.00', 'dd/mm/yyyy hh24.mi'),
's2'
);

insert into assignment values (
'a3',
'p2',
to_date('30/10/2020 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/11/2020 12.00', 'dd/mm/yyyy hh24.mi'),
's3'
);

insert into assignment values (
'a4',
'p3',
to_date('23/01/2020 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/04/2029 12.00', 'dd/mm/yyyy hh24.mi'),
's4'
);

insert into assignment values (
'a5',
'p4',
to_date('30/04/2020 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/05/2020 12.00', 'dd/mm/yyyy hh24.mi'),
's5'
);

insert into assignment values (
'a6',
'p5',
to_date('23/11/2019 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('23/12/2019 12.00', 'dd/mm/yyyy hh24.mi'),
's4'
);

insert into assignment values (
'a7',
'p6',
to_date('30/10/2019 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('30/12/2019 12.00', 'dd/mm/yyyy hh24.mi'),
's5'
);

insert into assignment values (
'a8',
'p7',
to_date('15/04/2029 12.00', 'dd/mm/yyyy hh24.mi'),
to_date('17/04/2020 12.00', 'dd/mm/yyyy hh24.mi'),
's4'
);

-- create doctor table
drop table doctor cascade constraints purge;
create table doctor (
staff_id varchar2(10) not null,
staff_name varchar2(20) not null,
staff_ph varchar2(20),
primary key (staff_id)
);

insert into doctor values(
'd1',
'Mithu Palit',
'0434666475'
);

insert into doctor values(
'd2',
'Sudeep Saraf',
'0423666457'
);

insert into doctor values(
'd3',
'Ilan Rauchberger',
'0123666987'
);

insert into doctor values(
'd4',
'David Kaye',
'0987666231'
);

insert into doctor values(
'd5',
'Peter Hunter',
'0967123456'
);

insert into doctor values(
'd6',
'Mark Hew',
'0987444523'
);

insert into doctor values(
'd7',
'Michael Chou',
'0456789123'
);

insert into doctor values(
'd8',
'Catriona Mclean',
'0675432123'
);

insert into doctor values(
'd9',
'David Kaye',
'0788345676'
);

insert into doctor values(
'd10',
'Vincent Cousins',
'0455123456'
);

-- create patient table
drop table patient cascade constraints purge;
create table patient (
patient_id varchar2(10) not null,
patient_name varchar2(20),
patient_age number,
patient_ph_no varchar2(20),
patient_address varchar2(50),
patient_nationality varchar2(10),
patient_emergency_contact varchar2(10),
primary key (patient_id)
);

insert into patient values (
'p1',
'Cristiano Ronaldo',
12,
'0434568900',
'122 Albert St, Port Melbourne, VIC 3207',
'Portugese',
'0434657090'
);

insert into patient values (
'p2',
'Wayne Rooney',
36,
'0122345808',
'99 Beacon Rd, Port Melbourne, VIC 3207',
'English',
'0232555808'
);

insert into patient values (
'p3',
'David Cameroon',
15,
'0123666789',
'128 Farrell St, Port Melbourne, VIC 3207',
'English',
'0343123321'
);

insert into patient values (
'p4',
'Harry Potter',
65,
'0343666990',
'396 Clarendon St, South Melbourne, VIC 3205',
'Wales',
'0346512000'
);

insert into patient values (
'p5',
'Emma Watson',
74,
'0645777666',
'120 Princes St, Port Melbourne, VIC 3207',
'Australian',
'0123456789'
);

insert into patient values (
'p6',
'Severus Snape',
43,
'0434666457',
'248 Esplanade East, Port Melbourne, VIC 3207',
'Australian',
'0989000123'
);

insert into patient values (
'p7',
'Phong Tong Thi',
29,
'0123321123',
'9/ 271 William St, Melbourne, VIC 3000',
'Vietnamese',
'090090787'
);

insert into patient values (
'p8',
'Lance Amstrong',
37,
'0675321456',
'177 Cecil St, South Melbourne, VIC 3205 ',
'French',
'090878666'
);

insert into patient values (
'p9',
'Alison Becker',
22,
'0656777123',
'7 Orion Mews, Port Melbourne, VIC 3207 ',
'Brazilan',
'0396456897'
);

insert into patient values (
'p10',
'Kristen Stewart',
77,
'0393489730',
'225 Abbotsford St, North Melbourne, VIC 3051',
'Japanese',
'0396992186'
);

-- ii The SQL commands to create the data warehouse

-- Create dimension tables
-- time dimension table
-- Assume the periods of appointment are divided based on patient service start date
drop table time_dim cascade constraints purge;
create table time_dim (
time_id number,
time_period varchar2(10),
begin_month number,
end_month number
);

insert into time_dim values (
'1',
'spring',
1,
3
);

insert into time_dim values (
'2',
'summer',
4,
6
);

insert into time_dim values (
'3',
'autumn',
7,
9
);

insert into time_dim values (
'4',
'winter',
10,
12
);

select * from time_dim;

-- suburb dimension table
drop table suburb_dim cascade constraints purge;
create table suburb_dim as
select distinct suburb
from clinic;

select * from suburb_dim;

-- age dimension  table
drop table age_dim cascade constraints purge;
create table age_dim 
(age_id number,
age_group varchar2(10),
start_age number,
end_age number);

insert into age_dim values (1, 'infant', 0, 1);
insert into age_dim values (2, 'children', 2, 18);
insert into age_dim values (3, 'adult', 19, 64);
insert into age_dim values (4, 'senior', 65, null);

select * from age_dim;

-- cost dimension table
drop table cost_dim cascade constraints purge;
create table cost_dim (
cost_id number,
cost_type varchar2(20),
start_price varchar2(10),
high_price varchar2(10)
);

insert into cost_dim values (1, 'low price', '0', '20');
insert into cost_dim values (2, 'medium price', '20', '50');
insert into cost_dim values (3, 'high price', '50', null);

select * from cost_dim;

-- service dimension table
drop table service_dim cascade constraints purge;
create table service_dim as
select distinct service_name 
from service;

select * from service_dim;

-- patient cost temporary fact table
drop table patient_cost_temp cascade constraints;
create table patient_cost_temp as
select p.patient_age,
s.service_name,
s.service_cost,
a.patient_service_start_date,
c.suburb,
count(p.patient_id) as total_patients,
sum(s.service_cost) as total_services_charged
from patient p, service s, assignment a, clinic c
where p.patient_id = a.patient_id
and a.service_id = s.service_id
and c.hospital_id = s.hospital_id
group by p.patient_age,
s.service_name,
s.service_cost,
a.patient_service_start_date,
c.suburb;

alter table patient_cost_temp add (
age_id number,
time_id number,
cost_id number
);

update patient_cost_temp set age_id =
(case
when patient_age >= 0 and patient_age <= 1 then 1
when patient_age >=2 and patient_age <= 18 then 2
when patient_age  >= 19 and patient_age <= 64 then 3
when patient_age >= 65 then 4
end);

update patient_cost_temp set time_id = 
(case 
when to_char(patient_service_start_date, 'mm') >= 1 and to_char(patient_service_start_date, 'mm') <= 3 then 1
when to_char(patient_service_start_date, 'mm') >= 4 and to_char(patient_service_start_date, 'mm') <= 6 then 2
when to_char(patient_service_start_date, 'mm') >= 7 and to_char(patient_service_start_date, 'mm') <= 9 then 3
when to_char(patient_service_start_date, 'mm') >= 10 and to_char(patient_service_start_date, 'mm') <= 12 then 4
end);

update patient_cost_temp set cost_id =
(case
when service_cost > 0 and service_cost < 20 then 1
when service_cost >= 20 and service_cost <= 50 then 2
when service_cost > 50 then 3
end);

-- patient cost fact table
drop table patient_cost_fact cascade constraints purge;
create table patient_cost_fact as
select service_name,
cost_id,
time_id, 
suburb,
age_id,
total_patients,
total_services_charged
from patient_cost_temp;

select * from patient_cost_fact;


-- iii The SQL commands to answer the queries in Task 5
-- a Show the total number of patients making appointments during Winter
select t.time_period,
sum(p.total_patients) as total_patients
from patient_cost_fact p, time_dim t
where t.time_id = p.time_id
and t.time_period = 'winter'
group by t.time_period;

-- b Show the total service charged for each service cost type
select c.cost_type,
sum(p.total_services_charged) as total_services_charged
from cost_dim c, patient_cost_fact p
where c.cost_id = p.cost_id
group by c.cost_type;

-- c Show the total number of patients by each age group (infant <1, children <18, adult 18+,
-- senior 65+) in April 2020
select a.age_group,
sum(p.total_patients) as total_patients
from age_dim a, patient_cost_fact p
where a.age_id = p.age_id
group by a.age_group;

-- d Show the total service charged for general medical consultations in each suburb
select p.suburb,
p.service_name,
sum(p.total_services_charged) as total_services_charged
from patient_cost_fact p
where p.service_name = 'General medical consultation'
group by p.suburb,
p.service_name;

select * from patient_cost_fact;
select * from patient_cost_temp;
select * from service_dim;
select * from cost_dim;
select * from age_dim;
select * from time_dim;
select * from suburb_dim;

select age_id,
sum(total_patients) as total_patients,
sum(total_services_charged) as total_services_charged
from patient_cost_fact
group by age_id;

select * from clinic;
select * from service;
select * from patient;
select * from doctor;
select * from assignment;