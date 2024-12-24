SELECT
    COUNT(job_id) AS Total_jobs,
    CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location LIKE'%India' THEN 'local'
    ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY
    Total_jobs;
