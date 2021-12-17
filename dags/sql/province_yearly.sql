truncate table province_yearly ;
insert into province_yearly (province_id, case_id, "year" , total)
select province_id , case_id, left("month" ,'4' ) as "year" , sum (total) as total
from province_monthly 
group by province_id , case_id , left("month" ,'4' ) ;
