create database company;
show databases;

CREATE USER 'bianca'@'localhost' IDENTIFIED BY 'passw';
GRANT ALL PRIVILEGES ON company.* TO 'bianca'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'bianca'@'localhost';

SELECT d.department_name, AVG(e.salary) as average_salary
FROM employees e
JOIN departments d ON e.department = d.department_id 
GROUP BY department_name;

