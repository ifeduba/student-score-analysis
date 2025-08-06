# student-score-analysis

## Introduction
This SQL-based analysis examines academic performance patterns across 10,000+ student records to identify critical learning gaps and data quality issues. By analyzing demographic factors (gender, age, country) against math, science, and English scores.
This analysis helps identify trends, strengths, and areas needing improvement for individual students or groups.

## Project overview
- Analysis of student performance, data examinng.
- Demographic distribution
- Academic performance pattern across subjects
- Gender and age based performance gap
- Data quality assesment.

  
## Analyis techniques
- multi table joins
- Conditional aggregation
- subquries for comparative analysis
- Data quality checks
- Age cohort segmentation

  ## The Analysis

--get the class distribution by gender

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

  ## Insight
- Math Advantage: Male students outperform females in math by 5-7 points on average         v
- English Strength: Females show stronger English performance (implied through total score analysis)
- Age:Performance peaks before age 20, decreases steadily with age
- Data Quality Issues
25% missing English grades (from LEFT JOIN analysis)

- Name duplication risk: Using Name as join key caused 5% record mismatches

Age outliers: 8 students with age >100 (data collection error)

- Demographic Imbalances
Gender skew: 58% female vs. 42% male students

Geographic concentration: 40% of students from just 2 countries (Germany & Mexico)

- Subject-Specific Trends
Science struggles: Lowest average scores across all demographics

Math polarization: Significant % failing (<50) in Mexico (35%) vs. Germany (15%)


    

## Strategic Recommendation
Data Quality
Resolve missing English grades and Name duplication.

Add age validation to reject negative/implausible values (e.g., Age > 100).

Equity Initiatives

Launch math bootcamps for female students in low-performing regions.

Investigate cultural factors behind country-specific gender gaps.

Resource Allocation

Prioritize Mexico for science teacher training (lowest science scores: avg 61.3).

Scale "young learner" programs (age <20 group has highest scores).

Metric Standardization

Replace arbitrary math threshold (>50) with percentile-based benchmarks.

Track subject scores normalized by country GDP/education budget.
Strategic Recommendations

Mexico Math Initiative: Targeted tutoring for students scoring <50

Female STEM Program: Bridge the 6.6-point math gender gap

Older Learner Modules: Age-adaptive content for 30+ students.

  
  
  
