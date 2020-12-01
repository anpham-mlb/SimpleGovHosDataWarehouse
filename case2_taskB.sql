-- Case study 2
-- 3
-- create fact and dimension tables
-- accident location dimension 1 table 
drop table accident_location_dim1 cascade constraints purge;
create table accident_location_dim1 as
select distinct accident_location_code, accident_street, accident_suburb
from accident.accident;

-- accident event dimension table
drop table accident_event_dim cascade constraints purge;
create table accident_event_dim as
select distinct accident_event
from accident.accident;

-- time dimension table
drop table time_dim cascade constraints purge;
create table time_dim  
(time_id number,
time_desc varchar2(10),
begin_time date,
end_time date);

-- Insert lighting periods into the table as (daytime: 06:00 - 17:59 and nighttime 18:00 - 5:59)
-- instead of lighting periods (daytime: 6AM - 5:59PM and nighttime 6PM - 5:59AM)
insert into time_dim values (
1, 
'daytime', 
to_date('10/04/2020 06:00', 'dd/mm/yyyy hh24:mi'), 
to_date('22/04/2020 17:59', 'dd/mm/yyyy hh24:mi')
); 

insert into time_dim values (
2,
'nighttime',
to_date('10/04/2020 18:00', 'dd/mm/yyyy hh24:mi'),
to_date('22/04/2020 05:59', 'dd/mm/yyyy hh24:mi')
);

-- branch dimension table
drop table branch_dim cascade constraints purge;
create table branch_dim as
select distinct officer_branch 
from accident.police_officer;

-- vehicle dimension table 1
drop table vehicle_dim1 cascade constraints purge;
create table vehicle_dim1 as
select distinct v.vehicle_no, v.vehicle_model
from accident.vehicle v, accident.accident_record r
where v.vehicle_no = r.vehicle_no;

-- accident-vehicle bridge table 1
drop table accident_vehicle_bridge1 cascade constraints purge;
create table accident_vehicle_bridge1 as
select * 
from accident.accident_record;

-- accident dimension table 
drop table accident_dim cascade constraints purge;
create table accident_dim as
select distinct a.accident_no, 
a.accident_date_time,
1.0/count(r.vehicle_no) as WeightFactor,
listagg(r.vehicle_no, '_') within group (order by r.vehicle_no) as vehiclegrouplist
from accident.accident a, accident.accident_record r
where a.accident_no = r.accident_no
group by a.accident_no, 
a.accident_date_time;

-- location event dimension table
drop table location_event_dim cascade constraints purge;
create table location_event_dim as
select distinct a.accident_no,
a.accident_location_code,
a.accident_street,
a.accident_suburb,
a.accident_event
from accident.accident a,
accident.accident_record r
where a.accident_no = r.accident_no
order by a.accident_no;

-- accident-vehicle bridge table 2
drop table accident_vehicle_bridge2 cascade constraints purge;
create table accident_vehicle_bridge2 as
select * 
from accident.accident_record;

-- vehicle dimension table 2
drop table vehicle_dim2 cascade constraints purge;
create table vehicle_dim2 as
select v.vehicle_no,
v.vehicle_model,
1/count(r.accident_no) as WeightFactor,
listagg(r.accident_no, '_') within group (order by r.accident_no) as accidentgrouplist
from accident.vehicle v, accident.accident_record r
where v.vehicle_no = r.vehicle_no
group by v.vehicle_no,
v.vehicle_model;

-- accident fact temporary table
drop table accident_fact_temp cascade constraints purge;
create table accident_fact_temp as
select ac.accident_location_code,
ac.accident_date_time,
v.vehicle_no,
ac.accident_no,
p.officer_branch,
count(ac.accident_no) as total_accidents,
count(v.vehicle_no) as total_vehicles
from accident.accident ac,
accident.vehicle v,
accident.police_officer p,
accident.accident_record r
where ac.accident_no = r.accident_no
and v.vehicle_no = r.vehicle_no
and ac.officer_id = p.officer_id
group by ac.accident_location_code,
ac.accident_date_time,
v.vehicle_no,
ac.accident_no,
p.officer_branch;

select count(*) from location_event_dim;

select * from accident_location_dim;
select * from accident_event_dim;
select * from time_dim;
select * from branch_dim;
select * from vehicle_dim1;
select * from vehicle_dim2;
select * from accident_vehicle_bridge1;
select * from accident_vehicle_bridge2;
select * from accident_dim;
select * from location_event_dim;

select * from accident.accident;
select count(distinct accident_no) from accident.accident;
select distinct accident_event from accident.accident;
select * from accident.police_officer;
select * from accident.driver;
select * from accident.accident_record;
select * from accident.vehicle_driver;
select * from accident.licence;
select * from accident.vehicle;
select * from accident.owners;
