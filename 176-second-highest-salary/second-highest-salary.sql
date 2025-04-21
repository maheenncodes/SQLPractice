# Write your MySQL query statement below

select IFNULL(
    (select  salary as SecondHighestSalary from Employee where salary < (select Max(salary) from Employee ) order by salary desc Limit 1
), NULL) AS SecondHighestSalary  ;