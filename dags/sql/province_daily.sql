truncate table province_daily;
insert into province_daily(province_id, case_id, date, total)
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='suspect_diisolasi')as case_id,
	tanggal,
	sum (suspect_diisolasi) as total
from data_covid
group by tanggal 

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='suspect_discarded')as case_id,
	tanggal,
	sum (suspect_discarded) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='suspect_meninggal')as case_id,
	tanggal,
	sum (suspect_meninggal) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='closecontact_dikarantina')as case_id,
	tanggal,
	sum (closecontact_dikarantina) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='closecontact_discarded')as case_id,
	tanggal,
	sum (closecontact_discarded) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='closecontact_meninggal')as case_id,
	tanggal,
	sum (closecontact_meninggal) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='probable_diisolasi')as case_id,
	tanggal,
	sum (probable_diisolasi) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='probable_discarded')as case_id,
	tanggal,
	sum (probable_discarded) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='probable_meninggal')as case_id,
	tanggal,
	sum (probable_meninggal) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='confirmation_sembuh')as case_id,
	tanggal,
	sum (confirmation_sembuh) as total
from data_covid
group by tanggal

union 
select (select province_id from dims_province) as province_id , 
	(select id from dims_case where status_detail ='confirmation_meninggal')as case_id,
	tanggal,
	sum (confirmation_meninggal) as total
from data_covid
group by tanggal;
