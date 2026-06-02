/* =====================================================
   GLOBAL LAYOFFS PROJECT
   DATA CLEANING PROCESS
   ===================================================== */


/* -----------------------------------------------------
   1. VIEW RAW DATA
----------------------------------------------------- */

SELECT * 
FROM layoffs;


/* -----------------------------------------------------
   2. CREATE STAGING TABLE
   (Backup of raw data before cleaning)
----------------------------------------------------- */

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * 
FROM layoffs;

SELECT * 
FROM layoffs_staging;


/* -----------------------------------------------------
   3. REMOVE DUPLICATES (ROW NUMBER METHOD)
----------------------------------------------------- */

SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, industry, total_laid_off,
                 date, stage, country, funds_raised_millions
    ORDER BY company
) AS row_num
FROM layoffs_staging;


/* Identify duplicate rows */

WITH duplicate_cte AS (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY company, location, industry, total_laid_off,
                     date, stage, country, funds_raised_millions
    ) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


/* -----------------------------------------------------
   4. CREATE FINAL CLEANING STAGING TABLE
----------------------------------------------------- */

CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT DEFAULT NULL,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT DEFAULT NULL,
  row_num INT
);


/* Insert data with row number */

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location, industry, total_laid_off,
                 percentage_laid_off, date, stage, country, funds_raised_millions
) AS row_num
FROM layoffs_staging;


/* Remove duplicate records */

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;


/* -----------------------------------------------------
   5. STANDARDIZE DATA
----------------------------------------------------- */

-- Trim company names
UPDATE layoffs_staging2
SET company = TRIM(company);


-- Standardize industry values (Crypto)
UPDATE layoffs_staging2
SET industry = 'crypto'
WHERE industry LIKE 'crypto%';


-- Clean country field (remove trailing dot)
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);


/* -----------------------------------------------------
   6. CONVERT DATE FORMAT
----------------------------------------------------- */

UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');


ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;


/* -----------------------------------------------------
   7. HANDLE NULL AND MISSING VALUES
----------------------------------------------------- */

-- Convert blank industry values to NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';


-- Fill missing industry using self join
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
  ON t1.company = t2.company
 AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;


/* -----------------------------------------------------
   8. REMOVE UNNECESSARY ROWS
----------------------------------------------------- */

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;


/* -----------------------------------------------------
   9. FINAL CLEANUP
----------------------------------------------------- */

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


/* -----------------------------------------------------
   DATA CLEANING COMPLETED SUCCESSFULLY
----------------------------------------------------- */
