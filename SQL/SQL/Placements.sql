-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

select s.name
from students s
join friends f on s.id = f.id
join packages sp on sp.id = f.id
join packages fp on fp.id = f.friend_id
where sp.salary < fp.salary
order by fp.salary