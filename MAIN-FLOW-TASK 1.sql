CREATE DATABASE StudentManagement;

CREATE TABLE Students (
StudentID int primary key auto_increment,
name varchar(50) not null ,
Gender varchar(1) not null check(Gender in ('M','F')),
Age int,
Grade varchar(10),
MathsScore int check (MathsScore between 0 and 100),
ScienceScore int  check (ScienceScore between 0 and 100),
EnglishScore int  check (EnglishScore between 0 and 100)
);
insert into Students (name,Gender,Age,Grade,MathsScore,ScienceScore , EnglishScore) values
('KARTIK' ,'M', 24 , 'A' , 85 ,80 ,90),
('ADITYA' ,'M',25, 'A' , 90 , 82, 85),
('ABHISHEK' ,'M',23 , 'A' , 92 , 80, 81),
('POOJA' ,'F',24 , 'A' , 75 ,90 ,82),
('TEENA' ,'F',23 , 'B' , 70 , 65, 75),
('AADITI' ,'F', 24, 'A' , 82, 81, 80),
('VIKAS' ,'M', 26, 'B' ,63,66,70 ),
('RAJEEV' ,'M', 22, 'B' , 70, 71,75 ),
('TRIPTI' ,'F', 21, 'A' , 80, 85, 82),
('AKSHYA' ,'M',26 , 'A' , 83, 90,87 );


-- 1
select * from students;

--  2. Calculate the average scores for each subject to understand subject-wise performance.
SELECT 
    AVG(MathsScore) AS avg_mathsscore,
    AVG(ScienceScore) AS avg_ScienceScore,
    AVG(EnglishScore) AS avg_EnglishScore
FROM
    students;


-- 3. Find the student(s) with the highest total score across all subjects to identify the top performer
SELECT 
    name,
    SUM(MathsScore + ScienceScore + EnglishScore) AS total_marks
FROM
    students
GROUP BY name
ORDER BY total_marks DESC
LIMIT 1;

-- 4. Count the number of students in each grade to observe grade distributions.
SELECT 
    Grade, COUNT(Grade) AS total_student
FROM
    students
GROUP BY Grade;

-- 5. Find the average score for male and female students to compare performance by gender
SELECT 
    gender,
    AVG(MathsScore + ScienceScore + EnglishScore) AS avg_marks
FROM
    students
GROUP BY gender;

-- 6. Identify students whose Math score is above 80 to highlight high achievers in Math.
select * from students where MathsScore>80;

-- 7.Update the grade of a student with a specific Student ID to reflect changes or corrections.
update Students set Grade='A' , MathsScore=90 where StudentId=8;
select * from students;