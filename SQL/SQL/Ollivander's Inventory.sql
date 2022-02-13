-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

select w.id, wp.age, w.coins_needed, w.power
from wands w
join wands_property wp on w.code = wp.code
join (
        select code, power, min(coins_needed) min_coins_needed 
            from wands 
            group by code, power
        ) tmp 
    on tmp.min_coins_needed = w.coins_needed and tmp.code = w.code and tmp.power = w.power
where is_evil = 0
order by w.power desc, wp.age desc;