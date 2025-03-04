create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

--letter B is first

select letter from letters
order by
case when letter = 'b' then 0
else 1 end, letter
--------------------------


--letter B is last
select letter from letters
order by
case when letter = 'b' then 1
else 0 end, letter
-----------------


--letter B is third
with ranked as (
select letter, row_number() over(order by letter) as rnk
from letters
where letter <> 'b'
)

select letter from ranked
where rnk < 3
union all
select 'b'
union all
select letter from ranked
where rnk>2
-----------