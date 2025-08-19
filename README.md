# SQL-Roadmap-for-DataAnalyst
This roadmap is designed to guide aspiring Data Analysts from SQL basics to advanced concepts, with practical project applications.

📌 SQL Project – Data Cleaning (Layoffs 2022 Dataset)

Dataset: Kaggle – Layoffs 2022

Database: MySQL
Objective: Clean raw layoff data by removing duplicates, standardizing values, handling nulls, and dropping irrelevant data. This prepares the dataset for analysis and visualization.

📂 Project Workflow
1. Create a Staging Table

We never clean directly on raw data. Instead, we copy it into a staging table.

CREATE TABLE world_layoffs.layoffs_staging LIKE world_layoffs.layoffs;
INSERT INTO world_layoffs.layoffs_staging SELECT * FROM world_layoffs.layoffs;


2. Remove Duplicates

Identify duplicates using ROW_NUMBER() with PARTITION BY.

CREATE TABLE world_layoffs.layoffs_staging2 AS
SELECT *,
       ROW_NUMBER() OVER (
         PARTITION BY company, location, industry, total_laid_off, 
                      percentage_laid_off, `date`, stage, country, 
                      funds_raised_millions
         ORDER BY company
       ) AS row_num
FROM world_layoffs.layoffs_staging;

DELETE FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;




3. Standardize Data
a. Industry Column

Convert blanks → NULL.

Fill missing values from other rows of the same company.

Standardize variations (e.g., Crypto Currency → Crypto).

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');


b. Country Column

Fix inconsistencies (United States. → United States).

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);


c. Date Column

Convert string to DATE type.

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

✅ Data is now clean and consistent.



4. Handle Null Values

Keep NULL for missing total_laid_off, percentage_laid_off, and funds_raised_millions (important for analysis).

Remove completely useless rows (both layoffs & percentage null).

DELETE FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;



5. Remove Unnecessary Columns

Remove helper column row_num.

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;



✅ Final Clean Table: layoffs_staging2

No duplicates

Standardized industry, country, and date

Null values handled properly

Only useful data retained

📊 Before vs After Cleaning
Raw Data Issues

❌ Duplicates (same company, date, and layoffs count)

❌ Inconsistent industries (Crypto Currency vs Crypto)

❌ Country mismatch (United States. vs United States)

❌ Date column in string format

❌ Rows with no meaningful data


Cleaned Data

✅ Unique rows only

✅ Standardized industry and country names

✅ Dates in proper DATE format

✅ Removed useless rows

✅ Ready for EDA and dashboards



🚀 Next Steps (EDA Ideas)

Analyze total layoffs by country, industry, and year.

Identify top 10 companies with the highest layoffs.

Explore relationship between funds raised vs layoffs.

Create interactive dashboards in Tableau/Power BI.



🛠️ Tech Stack

SQL (MySQL) – Data cleaning & transformations

Kaggle Dataset – Real-world raw data

Tableau/Power BI (optional next step) – Visualization



📌 Key Learnings

Creating staging tables for safe cleaning

Detecting/removing duplicates using window functions

Standardizing text data across rows

Handling null values smartly instead of blindly replacing

Dropping unnecessary rows & columns for cleaner analysis


✨ This project simulates real-world data cleaning in SQL and is a great addition to your portfolio.
