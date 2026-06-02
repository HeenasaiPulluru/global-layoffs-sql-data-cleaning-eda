# 🚀 Global Layoffs SQL Data Cleaning & Exploratory Data Analysis

## 🎯 Objective
The objective of this project is to clean and analyze a real-world global layoffs dataset using SQL in order to uncover trends in workforce reductions across companies, industries, countries, and time periods.

---

## 🛠 Tools & Technologies
- MySQL
- SQL (CTEs, Window Functions, Aggregations)
- Data Cleaning Techniques
- Exploratory Data Analysis (EDA)

---

## 📂 Project Structure
/data_cleaning.sql → SQL scripts for cleaning raw data
/eda_queries.sql → SQL scripts for exploratory data analysis
/results/ → Screenshots of query outputs and insights


---

## 🧹 Data Cleaning Process
- Removed duplicate records using `ROW_NUMBER()` window function  
- Created a staging table to preserve raw data  
- Standardized company names and industry values  
- Handled missing values (NULLs) in key columns  
- Converted date column into proper DATE format  
- Removed inconsistent and invalid records  

---

## 📊 Exploratory Data Analysis (EDA)

### 1. Top Companies by Layoffs
Identified companies with the highest total layoffs globally.

### 2. Industry-Wise Impact
Analyzed which industries were most affected (e.g., Technology, Finance, Healthcare).

### 3. Layoffs Over Time
Trended layoffs on a monthly and yearly basis using aggregation.

### 4. Country-Wise Analysis
Compared layoffs across different countries to identify regional impact.

### 5. Stage-Wise Analysis
Analyzed layoffs based on company funding stage (Startup vs Enterprise).

---

## 📈 Key Insights
- The **Technology sector** experienced the highest layoffs globally  
- The years **2022–2023** showed the peak in global layoffs  
- A small number of companies contributed disproportionately to total layoffs  
- Early-stage startups were more vulnerable to workforce reductions  
- Layoffs were heavily concentrated in specific countries and regions  

---

## 💡 Business Impact
This analysis helps organizations and analysts to:

- Understand macroeconomic impact on employment trends  
- Identify industries most at risk during downturns  
- Analyze workforce stability across global markets  
- Support data-driven hiring and investment decisions  

---

## 🔥 Advanced SQL Concepts Used
- Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)
- Common Table Expressions (CTEs)
- Aggregation & Grouping
- Date formatting and transformation
- Subqueries and derived tables

---

## 📸 Visuals
(Add screenshots of SQL outputs inside `/results` folder)

---

## 👤 Author
**Heenasai Pulluru**  
Data Analyst Portfolio Project  
