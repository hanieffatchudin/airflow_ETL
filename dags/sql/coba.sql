truncate table fact_contoh ;
insert into fact_contoh  
select * from data_covid_sql dcs ;
