-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

select t1.start_date, min(t2.end_date) proj_end_date from
(select start_date from projects where start_date not in (select end_date from projects)) t1,
(select end_date from projects where end_date not in (select start_date from projects)) t2
where t1.start_date < t2.end_date
group by t1.start_date
order by datediff(min(t2.end_date), t1.start_date) asc, t1.start_date;