# Write your MySQL query statement below
select p.project_id, round(avg(e.experience_years),2) AS average_years
from  Project p
left join Employee e
on p.employee_id = e.employee_id
group by project_id