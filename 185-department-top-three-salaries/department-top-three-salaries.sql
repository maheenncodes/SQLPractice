# Write your MySQL query statement below
With employee_rank As(

    Select d.id ,d.name as Department, e.name as Employee , e.salary as Salary,
    Dense_Rank() over ( Partition By d.id order by salary Desc) as rnk
    From Employee e
    Join Department d  on e.departmentId = d.id
)
Select Department, Employee, Salary from employee_rank where rnk<=3;