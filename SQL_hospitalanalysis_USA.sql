CREATE TABLE hospital_info (
    facility_id VARCHAR(255),
    facility_name VARCHAR(255),
    address VARCHAR(255),
    city_town VARCHAR(255),
    state VARCHAR(2),
    zip_code VARCHAR(10),
    county_parish VARCHAR(255),
    telephone_number VARCHAR(15),
    hospital_type VARCHAR(255),
    hospital_ownership VARCHAR(255),
    emergency_services BOOLEAN,
    meets_criteria_for_promoting_interoperability_of_ehrs BOOLEAN,
    meets_criteria_for_birthing_friendly_designation BOOLEAN,
    hospital_overall_rating VARCHAR(5),
    hospital_overall_rating_footnote TEXT,
    mort_group_measure_count VARCHAR(255),
    count_of_facility_mort_measures VARCHAR(255),
    count_of_mort_measures_better VARCHAR(255),
    count_of_mort_measures_no_different VARCHAR(255),
    count_of_mort_measures_worse VARCHAR(255),
    mort_group_footnote TEXT,
    safety_group_measure_count VARCHAR(255),
    count_of_facility_safety_measures VARCHAR(255),
    count_of_safety_measures_better VARCHAR(255),
    count_of_safety_measures_no_different VARCHAR(255),
    count_of_safety_measures_worse VARCHAR(255),
    safety_group_footnote TEXT,
    readm_group_measure_count VARCHAR(255),
    count_of_facility_readm_measures VARCHAR(255),
    count_of_readm_measures_better VARCHAR(255),
    count_of_readm_measures_no_different VARCHAR(255),
    count_of_readm_measures_worse VARCHAR(255),
    readm_group_footnote TEXT,
    pt_exp_group_measure_count VARCHAR(255),
    count_of_facility_pt_exp_measures VARCHAR(255),
    pt_exp_group_footnote TEXT,
    te_group_measure_count INT,
    count_of_facility_te_measures VARCHAR(255),
    te_group_footnote TEXT
);

COPY hospital_info(facility_id,
    facility_name,
    address,
    city_town,
    state,
    zip_code,
    county_parish,
    telephone_number,
    hospital_type,
    hospital_ownership,
    emergency_services,
    meets_criteria_for_promoting_interoperability_of_ehrs,
    meets_criteria_for_birthing_friendly_designation,
    hospital_overall_rating,
    hospital_overall_rating_footnote,
    mort_group_measure_count,
    count_of_facility_mort_measures,
    count_of_mort_measures_better,
    count_of_mort_measures_no_different,
    count_of_mort_measures_worse,
    mort_group_footnote,
    safety_group_measure_count,
    count_of_facility_safety_measures,
    count_of_safety_measures_better,
    count_of_safety_measures_no_different,
    count_of_safety_measures_worse,
    safety_group_footnote,
    readm_group_measure_count,
    count_of_facility_readm_measures,
    count_of_readm_measures_better,
    count_of_readm_measures_no_different,
    count_of_readm_measures_worse,
    readm_group_footnote,
    pt_exp_group_measure_count,
    count_of_facility_pt_exp_measures,
    pt_exp_group_footnote,
    te_group_measure_count,
    count_of_facility_te_measures,
    te_group_footnote)
FROM 'C:\CarolineZiegler\Studium_DCU\8. Semester\Business Analytics Portfolio\Portfolio\03_Healthcare\Hospital_SQL.csv' DELIMITER ','
csv HEADER;

-- Benchmarking Hospitals
SELECT hospital_type, AVG(CAST(hospital_overall_rating AS INT)) AS average_rating
FROM hospital_info
WHERE hospital_overall_rating <> 'Not Available'
GROUP BY hospital_type
ORDER BY average_rating DESC;

-- Analysis of Regional Healthcare Quality
SELECT state, COUNT(facility_id) AS total_hospitals, AVG(CAST(hospital_overall_rating AS INT)) AS average_rating
FROM hospital_info
WHERE hospital_overall_rating <> 'Not Available'
GROUP BY state
ORDER BY average_rating DESC;

-- Correlation Between Hospital Type and Ownership on Quality Scores
SELECT hospital_ownership, AVG(CAST(hospital_overall_rating AS INT)) AS average_rating
FROM hospital_info
WHERE hospital_overall_rating <> 'Not Available'
GROUP BY hospital_ownership
ORDER BY average_rating DESC;

-- Analysis of Emergency Service Availability and Hospital Rating
SELECT
    emergency_services,
    AVG(CAST(NULLIF(hospital_overall_rating, 'Not Available') AS INTEGER)) AS average_rating
FROM
    hospital_info
GROUP BY
    emergency_services;

-- Impact of Hospital Ownership on Patient Experience Measures
SELECT
    hospital_ownership,
    AVG(CAST(NULLIF(count_of_facility_pt_exp_measures, 'Not Available') AS INTEGER)) AS avg_patient_experience
FROM
    hospital_info
GROUP BY
    hospital_ownership
ORDER BY
    avg_patient_experience DESC;

-- Comparison of Mortality Rates Across Different States
SELECT
    state,
    AVG(CAST(NULLIF(count_of_mort_measures_no_different, 'Not Available') AS INTEGER)) AS avg_no_difference_mortality,
    AVG(CAST(NULLIF(count_of_mort_measures_better, 'Not Available') AS INTEGER)) AS avg_better_mortality,
    AVG(CAST(NULLIF(count_of_mort_measures_worse, 'Not Available') AS INTEGER)) AS avg_worse_mortality
FROM
    hospital_info
GROUP BY
    state
ORDER BY
    avg_no_difference_mortality DESC;
