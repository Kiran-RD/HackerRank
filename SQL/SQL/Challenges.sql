-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

select h.hacker_id, h.name, count(*) challenges_created
from hackers h
join challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having challenges_created = (select count(*) cnt from challenges group by hacker_id order by cnt desc limit 1) or challenges_created in (select t.cnt from (select count(*) cnt from challenges group by hacker_id) t group by cnt having count(*) = 1)
order by challenges_created desc, h.hacker_id ;