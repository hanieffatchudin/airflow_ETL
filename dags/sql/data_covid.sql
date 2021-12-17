truncate table data_covid ;
insert into data_covid
select * from staging_data_covid  ;
