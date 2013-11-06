students = LOAD 'students.txt' as (first:chararray, last:chararray, age:int, dept:chararray);
describe students;
dump students;
students_filtered = FILTER students BY age >= 20;
dept_info = LOAD 'dept_info.txt' as (dept:chararray, credits:int);
describe dept_info;
dump dept_info;
students_dept = JOIN students BY dept, dept_info BY dept;
students_proj = FOREACH students_dept GENERATE
 students::first as first, students::last as last,
 students::dept as dept, dept_info::credits as credits;
describe students_proj;
dump students_proj;
