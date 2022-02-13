-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

set @r1:=0, @r2:=0, @r3:=0, @r4:=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from (
    select
        case when Occupation = 'Doctor' then Name else Null end as Doctor,
        case when Occupation = 'Professor' then Name else Null end as Professor,
        case when Occupation = 'Singer' then Name else Null end as Singer,
        case when Occupation = 'Actor' then Name else Null end as Actor,
        case
            when Occupation = 'Doctor' then @r1:=@r1+1
            when Occupation = 'Professor' then @r2:=@r2+1
            when Occupation = 'Singer' then @r3:=@r3+1
            when Occupation = 'Actor' then @r4:=@r4+1
            end as Rownum
    from Occupations
    order by Name
    ) tmp
group by Rownum;