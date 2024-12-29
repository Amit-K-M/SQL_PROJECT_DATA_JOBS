/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) as demand,
    ROUND(AVG(salary_year_avg),0) as average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY
    average_salary DESC,
    demand DESC
LIMIT 25;

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
High-Demand Programming Languages: Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
Business Intelligence and Visualization Tools: Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
Database Technologies: The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

[
  {
    "skills": "go",
    "demand": "27",
    "average_salary": "115320"
  },
  {
    "skills": "confluence",
    "demand": "11",
    "average_salary": "114210"
  },
  {
    "skills": "hadoop",
    "demand": "22",
    "average_salary": "113193"
  },
  {
    "skills": "snowflake",
    "demand": "37",
    "average_salary": "112948"
  },
  {
    "skills": "azure",
    "demand": "34",
    "average_salary": "111225"
  },
  {
    "skills": "bigquery",
    "demand": "13",
    "average_salary": "109654"
  },
  {
    "skills": "aws",
    "demand": "32",
    "average_salary": "108317"
  },
  {
    "skills": "java",
    "demand": "17",
    "average_salary": "106906"
  },
  {
    "skills": "ssis",
    "demand": "12",
    "average_salary": "106683"
  },
  {
    "skills": "jira",
    "demand": "20",
    "average_salary": "104918"
  },
  {
    "skills": "oracle",
    "demand": "37",
    "average_salary": "104534"
  },
  {
    "skills": "looker",
    "demand": "49",
    "average_salary": "103795"
  },
  {
    "skills": "nosql",
    "demand": "13",
    "average_salary": "101414"
  },
  {
    "skills": "python",
    "demand": "236",
    "average_salary": "101397"
  },
  {
    "skills": "r",
    "demand": "148",
    "average_salary": "100499"
  },
  {
    "skills": "redshift",
    "demand": "16",
    "average_salary": "99936"
  },
  {
    "skills": "qlik",
    "demand": "13",
    "average_salary": "99631"
  },
  {
    "skills": "tableau",
    "demand": "230",
    "average_salary": "99288"
  },
  {
    "skills": "ssrs",
    "demand": "14",
    "average_salary": "99171"
  },
  {
    "skills": "spark",
    "demand": "13",
    "average_salary": "99077"
  },
  {
    "skills": "c++",
    "demand": "11",
    "average_salary": "98958"
  },
  {
    "skills": "sas",
    "demand": "126",
    "average_salary": "98902"
  },
  {
    "skills": "sql server",
    "demand": "35",
    "average_salary": "97786"
  },
  {
    "skills": "javascript",
    "demand": "20",
    "average_salary": "97587"
  },
  {
    "skills": "power bi",
    "demand": "110",
    "average_salary": "97431"
  }
]
*/