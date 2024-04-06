# **Hospital Quality Analysis using SQL**
## **Overview**

This repository contains the necessary files to perform a comprehensive analysis of hospital quality metrics across various dimensions such as hospital type, ownership, and regional distribution. The goal is to leverage SQL queries to uncover insights into hospital performance, patient experience, and mortality rates.

## **Repository Structure**
- Hospital_general_information: Raw data file.
- Hospital Performance Metrics Analysis Data Cleaning: Data Cleaning and Preprocessing in Python for SQL.
- Hospital_SQL.csv: The main dataset containing hospital information and quality measures.
- measure-descriptions.csv: Descriptions of the measures used in the analysis.
- SQL_hospitalanalysis_USA.sql: SQL script with queries for the analysis.
- SQL_averagemortality_categories_linegraph.png: Visualization of average mortality categories over time.
- SQL_averagemortality_categories_stackedbarc...: Visualization of average mortality categories with a stacked bar chart.
- README.md: Instructions and information about this project.

## **Prerequisites**

To run the SQL queries, you will need:

- A SQL database server such as PostgreSQL, MySQL, or SQLite.
- A tool to run SQL scripts such as pgAdmin for PostgreSQL, MySQL Workbench for MySQL, or a similar SQL interface.

## **Running the Analysis**

- Import the Hospital_SQL.csv file into your SQL database. This can typically be done through an import wizard in your SQL management tool.
- Execute the SQL queries found in SQL_hospitalanalysis_USA.sql to perform the analysis.
- Use measure-descriptions.csv for reference on what each measure represents.

## **SQL Scripts**

The SQL script includes the following types of analyses:

- Hospital benchmarking based on hospital type and overall ratings.
- Regional analysis based on the state and overall ratings.
- The impact of hospital ownership and type on quality scores.
- Emergency service availability and its correlation with hospital ratings.
- Patient experience measures in relation to hospital ownership.

## **Installation**

No installation is required other than the setup of your SQL environment.

## **Visualization**

The repository includes visualizations in the form of PNG images that represent some of the key findings from the analysis. These can be viewed directly or used in reports.
