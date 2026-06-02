/* =====================================================
   GLOBAL LAYOFFS PROJECT
   EXPLORATORY DATA ANALYSIS (EDA)
   ===================================================== */


/* -----------------------------------------------------
   1. VIEW CLEANED DATA
----------------------------------------------------- */

SELECT * 
FROM layoffs_staging2;


/* -----------------------------------------------------
   2. BASIC STATISTICS
----------------------------------------------------- */

-- Maximum layoffs
SELECT MAX(total_laid_off)
FROM layoffs_staging2;

-- Maximum percentage laid off
SELECT MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Min values
SELECT MIN(total_laid_off), MIN(percentage_laid_off)
FROM layoffs_staging2;


/* -----------------------------------------------------
   3. FULL COMPANY LAYOFF CASES
----------------------------------------------------- */

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;


/* -----------------------------------------------------
   4. COMPANY LEVEL ANALYSIS
----------------------------------------------------- */

-- Total layoffs by company
SELECT company, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY total_layoffs DESC;

-- Example: Amazon
SELECT *
FROM layoffs_staging2
WHERE company = 'Amazon';


/* -----------------------------------------------------
   5. INDUSTRY ANALYSIS
----------------------------------------------------- */

SELECT industry, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_layoffs DESC;


/* -----------------------------------------------------
   6. COUNTRY ANALYSIS
----------------------------------------------------- */

SELECT country, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC;


/* -----------------------------------------------------
   7. DATE / TIME ANALYSIS
----------------------------------------------------- */

-- Date range
SELECT MIN(date), MAX(date)
FROM layoffs_staging2;

-- Total layoffs by year
SELECT YEAR(date) AS year, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY year
ORDER BY year DESC;

-- Total layoffs by month
SELECT SUBSTRING(date, 1, 7) AS month, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE SUBSTRING(date, 1, 7) IS NOT NULL
GROUP BY month
ORDER BY month ASC;


/* -----------------------------------------------------
   8. ROLLING TOTAL (CUMULATIVE LAYOFFS)
----------------------------------------------------- */

WITH monthly_total AS (
    SELECT SUBSTRING(date, 1, 7) AS month,
           SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE SUBSTRING(date, 1, 7) IS NOT NULL
    GROUP BY month
)
SELECT month,
       total_off,
       SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM monthly_total;


/* -----------------------------------------------------
   9. STAGE ANALYSIS
----------------------------------------------------- */

SELECT stage, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_layoffs DESC;


/* -----------------------------------------------------
   10. COMPANY AVG PERCENTAGE LAYOFF
----------------------------------------------------- */

SELECT company,
       AVG(percentage_laid_off) AS avg_percentage,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY avg_percentage DESC;


/* -----------------------------------------------------
   11. TOP COMPANIES PER YEAR (RANKING)
----------------------------------------------------- */

WITH company_year AS (
    SELECT company,
           YEAR(date) AS year,
           SUM(total_laid_off) AS total_layoffs
    FROM layoffs_staging2
    GROUP BY company, YEAR(date)
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY year
               ORDER BY total_layoffs DESC
           ) AS ranking
    FROM company_year
    WHERE year IS NOT NULL
)
SELECT *
FROM ranked
WHERE ranking <= 5
ORDER BY year, ranking;


/* -----------------------------------------------------
   EDA COMPLETED
----------------------------------------------------- */
