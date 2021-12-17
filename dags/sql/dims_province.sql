truncate table public.dims_province ;
insert into public.dims_province 
select * from dim_province  ;
