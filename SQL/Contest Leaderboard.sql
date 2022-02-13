-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

select t1.hacker_id, h.name, sum(t1.max_scores) total_score 
from (
    select hacker_id, challenge_id, max(score) max_scores
    from submissions
    group by hacker_id, challenge_id
) t1
join hackers h on h.hacker_id = t1.hacker_id
group by t1.hacker_id, h.name
having total_score > 0
order by total_score desc, hacker_id;