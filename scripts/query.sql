-- get employees have more excellent salary
select E.FirstName, E.LastName, JT.title, Salary
from (
    select * FROM EmployeeSalary
    where Salary = (select max(Salary) from EmployeeSalary)
) as ES
inner join Employees E on E.ID = ES.EmployeeID
inner join JobTitles JT on JT.ID = ES.JobTitleID

-- add salary after race
select E.FirstName + ' ' + E.LastName as FullName, JT.title, Salary,
case
    when title = 'CEO' then Salary * 1.85
    when title = 'CTO' then Salary * 1.45
    else Salary
end as A
from EmployeeSalary ES
inner join Employees E on E.ID = ES.EmployeeID
inner join JobTitles JT on JT.ID = ES.JobTitleID

-- count employees by job title
select JT.title, count(E.ID) as number
from EmployeeSalary ES
inner join Employees E on E.ID = ES.EmployeeID
inner join JobTitles JT on JT.ID = ES.JobTitleID
group by JT.title
having count(E.ID) = 2


select avg(A) from
(
    select
    case
        when title = 'CEO' then Salary * 1.85
        when title = 'CTO' then Salary * 1.45
        else Salary
    end as A
    from EmployeeSalary ES
    inner join Employees E on E.ID = ES.EmployeeID
    inner join JobTitles JT on JT.ID = ES.JobTitleID
) as EEJA