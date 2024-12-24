WITH first_quater AS(
    SELECT *
    FROM  jan_jobs

    UNION ALL

    SELECT *
    FROM  feb_jobs

    UNION ALL

    SELECT *
    FROM mar_jobs)

SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    job_via,
    job_posted_date::DATE
FROM
    first_quater
WHERE
    salary_year_avg > 70000
ORDER BY
    salary_year_avg DESC;
