--functiile VARIANCE si STDDEV
SELECT
    round(VARIANCE(life_expectancy_at_birth), 3)
FROM
    wf_countries;

SELECT
    round(STDDEV(lifelife_expectancy_at_birth), 4)
FROM
    wf_countries;