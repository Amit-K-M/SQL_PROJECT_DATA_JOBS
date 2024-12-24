CREATE TABLE Jan_jobs AS
            SELECT *
            FROM
            job_postings_fact
            WHERE
            EXTRACT(MONTH FROM job_posted_date) = 1;

 CREATE TABLE Feb_jobs AS
            SELECT *
            FROM
            job_postings_fact
            WHERE
            EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE Mar_jobs AS
            SELECT *
            FROM
            job_postings_fact
            WHERE
            EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM
    Mar_jobs;