# Write your MySQL query statement below
 

 Select d.name as Department,
 e.name as Employee,
 e.salary as Salary
 from Employee e
  Join Department d on e.departmentId = d.id
 where (e.salary, e.departmentId) in
 (
    Select
    Max(salary), departmentId
    From Employee
    group by departmentId
 ) 