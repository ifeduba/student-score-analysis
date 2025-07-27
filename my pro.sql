-- get the class distribution by gender

SELECT GENDER, COUNT(*)
FROM student_scores
GROUP BY GENDER;

 -- The number of student from each country
 SELECT country, COUNT(*)
 FROM student_scores
 GROUP BY country;
 
 -- student that scored more than 50 in math in specific country
 SELECT country, `math score`, COUNT(*) 
 FROM student_scores
 WHERE  country IN ('Germany', 'Kenya', 'Egypt', 'Mexico')
 AND`Math Score` >50
 GROUP BY country, `Math Score`;
 
 -- calculate the average performance of each gender in mathematics
 SELECT Gender, AVG(`math score`)
 FROM student_scores
 GROUP BY Gender;
 
 -- Return all student that are either female or male less than 45 years 
 SELECT Name, Age, Gender
 FROM student_scores
 WHERE Age<45
 AND Gender = 'male';
 
 -- Return all male student that are not less 45 years
 SELECT Name, Age, Gender
  FROM student_scores
  WHERE Age<45
  AND gender = 'male';
-- joining the enlish grades  
  SELECT*
  FROM  student_scores
  JOIN english_grades AS e
  ON  student_scores.Name = e.Name;
  
  
SELECT* 
FROM student_scores
JOIN english_grades AS e
USING (Name);

SELECT*
FROM student_scores AS s
LEFT JOIN english_grades AS e
ON s.Name = e.Name;

SELECT*
FROM student_scores AS s
RIGHT JOIN english_grades AS e
ON s.Name = e.Name;


-- total score calculation

SELECT Name, `Math Score` , `Science Score`, `English Score`, (`Math Score` + `Science Score` + `English Score`)
FROM student_scores AS S
JOIN english_grades AS E
USING (Name);


SELECT Name, `Math Score` , `Science Score`, `English Score`, (`Math Score` + `Science Score` + `English Score`)
FROM student_scores AS S
JOIN english_grades AS E
USING (Name)
WHERE Gender = 'female';


SELECT Name, `Math Score` , `Science Score`, `English Score`, (`Math Score` + `Science Score` + `English Score`)
FROM student_scores AS S
JOIN english_grades AS E
USING (Name)
WHERE Gender = 'male';
 
 -- show student whose age is greater than the average student
 
 SELECT Name, Age
 FROM student_scores
 WHERE Age > (
 SELECT avg(age)
 
 FROM student_scores);
 
 -- what is the average  score by gender across all the object  from only student from Germany, Egypt, Kenya and Mexico.
 SELECT Name, Gender, country, (`math score` + `Science Score` + `English Score` )/3 AS `Average score`
 FROM student_scores
 JOIN english_grades
 USING(Name)
 WHERE country IN ('Germany' ,'Egypt' ,'Mexico');
 
 SELECT Gender, avg(`Average score`)
 FROM (
  SELECT Name, Gender, country, (`math score` + `Science Score` + `English Score` )/3 AS `Average score`
 FROM student_scores
 JOIN english_grades
 USING(Name)
 WHERE country IN ('Germany' , 'Kenya' ,'Egypt' ,'Mexico')
 ) AS t1
 GROUP BY 1;
 
 SELECT Gender, ROUND(avg(`Average score`),2)
 FROM (
  SELECT Name, Gender, country, (`math score` + `Science Score` + `English Score` )/3 AS `Average score`
 FROM student_scores
 JOIN english_grades
 USING(Name)
 WHERE country IN ('Germany' , 'Kenya' ,'Egypt' ,'Mexico')
 ) AS t1
 GROUP BY 1;
 
 
 

 





  
  SELECT e.Name,Age
  FROM student_scores
  JOIN english_grades AS e
  ON student_scores.Name = e.Name;
  
  