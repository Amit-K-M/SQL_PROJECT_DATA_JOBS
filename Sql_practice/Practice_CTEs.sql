WITH Remote_jobs AS(
    SELECT 
       skills_job_dim.skill_id,
        COUNT(*) AS Total_jobs
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_work_from_home = TRUE,
        
    GROUP BY
        skills_job_dim.skill_id
    )

SELECT
    skills_dim.skills,
    Remote_jobs.Total_jobs
FROM
    skills_dim
INNER JOIN Remote_jobs ON Remote_jobs.skill_id = skills_dim.skill_id
ORDER BY
    Remote_jobs.Total_jobs DESC
LIMIT 5;