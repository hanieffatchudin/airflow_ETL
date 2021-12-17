truncate table district_yearly ;
insert into district_yearly (district_id , case_id, "year" , total)
select district_id, case_id, left("month" ,'4' ) as "year" , sum (total) as total
from district_monthly
group by district_id, case_id , "year" ;
