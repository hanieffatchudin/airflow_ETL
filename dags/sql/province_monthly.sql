truncate table province_monthly ;
insert into province_monthly (province_id, case_id, "month", total)
select province_id , case_id, to_char("date"::date ,'YYYYMM' )as "month", sum (total) as total
from province_daily pd 
group by province_id , case_id ,to_char("date"::date ,'YYYYMM') ;
