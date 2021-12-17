truncate table district_monthly ;
insert into public.district_monthly (district_id, case_id , "month" , total)
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='suspect_diisolasi')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (suspect_diisolasi) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='suspect_discarded')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (suspect_discarded) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='suspect_meninggal')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (suspect_meninggal) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='closecontact_dikarantina')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (closecontact_dikarantina) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id , 
	(select id from dims_case where status_detail ='closecontact_discarded')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (closecontact_discarded) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='closecontact_meninggal')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (closecontact_meninggal) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='probable_diisolasi')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (probable_diisolasi) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='probable_discarded')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (probable_discarded) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id , 
	(select id from dims_case where status_detail ='probable_meninggal')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (probable_meninggal) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='confirmation_sembuh')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (confirmation_sembuh) as total
from data_covid
group by district_id , case_id, "month" 

union 
select kode_kab as district_id, 
	(select id from dims_case where status_detail ='confirmation_meninggal')as case_id,
	to_char(tanggal::date,'YYYYMM')as "month",
	sum (confirmation_meninggal) as total
from data_covid
group by district_id , case_id, "month" ;
