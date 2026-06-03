 # 🚀 Global Layoffs SQL Data Cleaning & Exploratory Data Analysis
 ## 🎯 Objective

The objective of this project is to perform data cleaning and exploratory data analysis (EDA) on a real-world global layoffs dataset using SQL.

The goal is to understand patterns in workforce reductions across companies, industries, countries, and time periods.

This project demonstrates strong SQL skills including data preprocessing, transformations, and analytical querying.

## 🛠 Tools & Technologies

- MySQL
- SQL
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
- Common Table Expressions (CTEs)
- Aggregations & Grouping
- Date Functions
- Data Cleaning Techniques

## 📂 Project Structure

### 📁 SQL Scripts
- [Data Cleaning Script](SQL/data_cleaning.sql) → Data cleaning and preprocessing steps  
- [EDA Queries Script](SQL/eda_queries.sql) → Exploratory data analysis queries  

### 📁 Results
Screenshots of analysis outputs stored in [results folder](results/)

## 🧹 Data Cleaning Process

The dataset was cleaned using multiple SQL techniques:

### ✔ 1. Removing Duplicates
- Used ROW_NUMBER() window function
- Identified and removed duplicate records

### ✔ 2. Creating Staging Tables
- Created layoffs_staging and layoffs_staging2
- Preserved raw dataset for safety

### ✔ 3. Standardizing Data
- Trimmed extra spaces in company names
- Standardized industry values (e.g., "Crypto" → "crypto")
- Cleaned country values (removed trailing characters)

### ✔ 4. Handling Missing Values
- Converted blank values to NULL
- Used self-joins to fill missing industry data

### ✔ 5. Date Formatting
- Converted text date to proper DATE format using STR_TO_DATE()
- Altered column type to DATE

### ✔ 6. Removing Invalid Records
- Removed rows where both:
  - total_laid_off IS NULL
  - percentage_laid_off IS NULL

## 📊 Exploratory Data Analysis (EDA)

### 1️⃣ Top Companies by Layoffs
- Identified companies with the highest total layoffs globally

### 2️⃣ Industry-Wise Analysis
- Found which industries were most affected (e.g., Tech, Finance)

### 3️⃣ Country-Wise Impact
- Compared layoffs across different countries

### 4️⃣ Time-Based Trends
- Analyzed layoffs across years and months
- Identified peak layoff periods

### 5️⃣ Stage-Wise Analysis
- Evaluated layoffs based on company funding stage (Startup vs Enterprise)

### 6️⃣ Rolling Total Analysis
- Used window functions to calculate cumulative layoffs over time

### 7️⃣ Top Companies Per Year
- Ranked companies using DENSE_RANK() per year based on layoffs

## 📈 Key Insights

- The Technology sector experienced the highest number of layoffs globally
- The years 2022–2023 showed peak layoff activity
- A small number of companies contributed to a large portion of total layoffs
- Early-stage startups were more vulnerable to workforce reductions
- Layoffs were heavily concentrated in specific countries and regions
- Layoff trends show clear economic downturn patterns over time

## 💡 Business Impact

This analysis helps businesses and analysts:

- Understand global employment trends
- Identify industries most affected during economic downturns
- Analyze company stability across funding stages
- Support data-driven hiring and investment decisions
- Monitor workforce risks across regions and sectors

## 🔥 Advanced SQL Concepts Used

- Window Functions:
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()

- Common Table Expressions (CTEs)
- Aggregations & Grouping
- Date Manipulation Functions
- Self Joins
- Subqueries
- Rolling Calculations

## 📸 Visualizations

- Add screenshots of SQL query outputs in the [results folder](results/)
- Include key insights such as:
  - Top companies by layoffs
  - Industry-wise layoffs
  - Yearly trend of layoffs
  - Top companies by year(Rank Analysis)
  - Rolling total analysis

These visuals help in better understanding of the analysis results.

👤 Author

**Heenasai Pulluru**  
Data Analyst  

🛠 Skills:
SQL | Excel | Power BI | Python | Data Cleaning | EDA | Data Visualization | Git & GitHub

---

⭐ If you like this project, feel free to star the repository and connect with me!


