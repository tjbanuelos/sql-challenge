-- Analysis -- 

-- Salary by employee
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees as e
	Left Join salaries as s
		On (e.emp_no = s.emp_no)
Order By e.emp_no;

-- Employees hired in 1986
Select first_name, last_name, hire_date
From employees
Where hire_date Between '1986-01-01' And '1986-12-31';

-- Department Managers
Select dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
From dept_manager As dm
	Inner Join departments As d
		On (dm.dept_no = d.dept_no)
	Inner Join employees As e
		On (dm.emp_no = e.emp_no);

-- Departments of every employee
Select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
From employees As e
	Inner Join dept_emp As de
		On (e.emp_no = de.emp_no)
	Inner Join departments As d
		On (de.dept_no = d.dept_no);

-- Employees whose first name is "Hercules" and last name begins with "B"
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules'
And last_name Like 'B%';

-- Sales Department Employees
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees As e
	Inner Join dept_emp As de
		On (e.emp_no = de.emp_no)
	Inner Join departments As d
		On (de.dept_no = d.dept_no)
Where d.dept_name = 'Sales'
Order By e.emp_no;

-- Sales and Development Departments
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees As e
	Inner Join dept_emp As de
		On (e.emp_no = de.emp_no)
	Inner Join departments As d
		On (de.dept_no = d.dept_no)
Where d.dept_name = 'Sales' Or d.dept_name = 'Development'
Order By e.emp_no;

-- Frequency Count by Last Name in Descending Order
Select last_name, Count(last_name) As "Frequency"
From employees
Group By last_name
Order By "Frequency" Desc;