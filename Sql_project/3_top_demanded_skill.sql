/*
Question: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) as demand
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY 
    demand DESC
LIMIT 5;
    
/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.
[
  {
    "skills": "sql",
    "demand": "7291"
  },
  {
    "skills": "excel",
    "demand": "4611"
  },
  {
    "skills": "python",
    "demand": "4330"
  },
  {
    "skills": "tableau",
    "demand": "3745"
  },
  {
    "skills": "power bi",
    "demand": "2609"
  }
]*/