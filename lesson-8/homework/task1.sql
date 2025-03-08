

--create table Groupings (
--    StepNumber int PRIMARY KEY,
--    Status VARCHAR(10)
--);

--insert into Groupings (StepNumber, Status) values
--(1, 'Passed'),
--(2, 'Passed'),
--(3, 'Passed'),
--(4, 'Passed'),
--(5, 'Failed'),
--(6, 'Failed'),
--(7, 'Failed'),
--(8, 'Failed'),
--(9, 'Failed'),
--(10, 'Passed'),
--(11, 'Passed'),
--(12, 'Passed');

--select * from Groupings

with cte as (
    select 
        StepNumber, 
        Status,
        StepNumber - row_number() over (partition by Status order by StepNumber) as GroupID
    from Groupings
)
select 
    min(StepNumber) as MinStepNumber,
    max(StepNumber) as MaxStepNumber,
    Status,
    count(*) as ConsecutiveCount
from cte
group by Status, GroupID
order by MinStepNumber;