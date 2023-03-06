create table Employees(
    ID int identity(1, 1) not null,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    Gender varchar(10) not null check (Gender in('Male', 'Female', 'Other')),
    primary key (ID)
);
go
create table JobTitles(
    ID int identity(1, 1) not null,
    title varchar(255),
    primary key (ID)
)
go
create table EmployeeSalary(
    EmployeeID int not null,
    JobTitleID int not null,
    Salary int,
    foreign key (EmployeeID) references Employees(ID),
    foreign key (JobTitleID) references JobTitles(ID),
)
go
create INDEX Index_EmployeeSalary on EmployeeSalary(JobTitleID,EmployeeID)
