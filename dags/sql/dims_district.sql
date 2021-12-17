truncate table dims_district ;
insert into dims_district
select * from dim_district  ;
