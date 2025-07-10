# Write your MySQL query statement below
select EmployeeUNI.unique_id, e.name 
from employees e
left join employeeUNI
on e.id = EmployeeUNI.id