



# High-Performance In-Memory Data Wrangling Using data.table

## Project Title

**High-Performance In-Memory Data Wrangling on Enterprise Sales Transactions using data.table**

---

## Project Objective

The objective of this project is to understand how enterprise organizations process and analyze extremely large transactional datasets using the **data.table** package in R. The project demonstrates high-speed data manipulation using pointer-level reference semantics, enabling efficient in-memory updates, filtering, sorting, indexing, grouping, and aggregation. The project also includes business analysis, report generation, and visualization while handling a dataset containing **500,000 transaction records**.

---

## Software Used

* R Programming
* RStudio
* data.table Package
* Git
* GitHub

---

## Dataset Description

A synthetic enterprise sales transaction dataset containing **500,000 records** was generated using R.

The dataset includes the following columns:

* TransactionID
* CustomerID (Renamed as CustID)
* CustomerName
* Gender
* Age
* ProductID (Renamed as ProdID)
* ProductName
* Category
* Quantity
* UnitPrice
* Discount
* GST
* PaymentMethod
* City
* State
* OrderDate
* SalesPerson
* Revenue
* DiscountAmount
* GSTAmount
* NetRevenue

The dataset was saved as:

**sales_transactions.csv**

---

## Project Tasks

### Task 1 – Generate Dataset

* Generated 500,000 transaction records
* Saved dataset as **sales_transactions.csv**
* Displayed first and last 10 records
* Displayed dataset dimensions
* Displayed dataset structure

### Task 2 – Load and Explore Dataset

* Imported dataset using `fread()`
* Displayed first and last records
* Displayed column names
* Checked data types
* Displayed summary statistics
* Identified missing values
* Checked duplicate records
* Counted unique customers, products, and cities

### Task 3 – Data Cleaning and Preparation

* Removed duplicate records
* Renamed columns
* Reordered columns
* Converted data types
* Displayed cleaned dataset

### Task 4 – High-Speed Data Manipulation

* Selected single and multiple columns
* Filtered rows using conditions
* Sorted data
* Displayed Top 20 expensive products
* Displayed Top 20 highest quantity transactions

### Task 5 – In-place Column Updates

Created new columns using the `:=` operator:

* Revenue
* DiscountAmount
* GSTAmount
* NetRevenue

### Task 6 – Index Keying

* Created keys using `setkey()`
* Indexed Customer ID
* Indexed Product ID
* Performed indexed searches
* Compared search performance

### Task 7 – Grouping and Aggregation

Generated:

* Customer Summary
* Product Summary
* City Summary
* Category Summary

### Task 8 – Business Analysis

Solved business questions related to:

* Highest revenue city
* Maximum sales product
* Highest ordering customer
* Most used payment method
* Average transaction value
* Highest revenue category
* Top 20 customers
* Top 20 products

### Task 9 – Export Reports

Exported:

* customer_summary.csv
* product_summary.csv
* city_summary.csv
* category_summary.csv

### Task 10 – Visualization

Generated Base R visualizations:

* Transactions by City
* Revenue by Product Category
* Top 20 Customers
* Payment Method Distribution

---

## Steps to Run the Program

1. Install R and RStudio.
2. Install the `data.table` package.
3. Open the file **high_performance_data_wrangling.R**.
4. Run the script from beginning to end.
5. The program will:

   * Generate the dataset
   * Save the dataset as `sales_transactions.csv`
   * Perform data exploration and cleaning
   * Generate business reports
   * Export CSV files
   * Create visualizations
   * Save outputs in the **Output** folder.

---

## GitHub Repository Structure


High-Performance-DataWrangling-Week2/
│
├── README.md
├── Week2_Report.pdf
├── sales_transactions.csv
├── high_performance_data_wrangling.R
│
└── Output/
    ├── city_transactions.png
    ├── category_revenue.png
    ├── top_customers.png
    ├── payment_distribution.png

---

## Output Screenshots

Transaction by City:
<img width="670" height="670" alt="Screenshot 2026-07-19 213929" src="https://github.com/user-attachments/assets/ead93e8b-7ae2-4c0e-a603-22d9a943600f" />
Revenue by Porduct Category:
<img width="670" height="667" alt="Screenshot 2026-07-19 214657" src="https://github.com/user-attachments/assets/9a4f9534-efb9-4916-8a2d-f04de1d16936" />
Top 20 Customers by Revenue:
<img width="669" height="668" alt="Screenshot 2026-07-19 214734" src="https://github.com/user-attachments/assets/c0840433-eece-4174-9c95-9f489cd3408d" />
Payment Method Distribution:
<img width="666" height="664" alt="Screenshot 2026-07-19 214800" src="https://github.com/user-attachments/assets/9eca546d-1714-460a-b2d3-9b839338d687" />


---

## Business Questions Solved

* Which city generated the highest revenue?
* Which product generated the maximum sales?
* Which customer placed the highest number of orders?
* Which payment method is used most frequently?
* What is the average transaction value?
* Which category generated the maximum revenue?
* Who are the Top 20 customers by revenue?
* Which are the Top 20 products by quantity sold?

---

## Learning Outcomes

After completing this project, I learned to:

* Generate large synthetic datasets in R.
* Use the **data.table** package for efficient data manipulation.
* Perform in-place updates using the `:=` operator.
* Apply indexing with `setkey()` for faster searching.
* Perform grouping and aggregation operations.
* Analyze enterprise transaction data.
* Export reports in CSV format.
* Create visualizations using Base R.
* Organize project files and manage version control using Git and GitHub.

This version follows the exact sections requested in your project description and is suitable to save as **README.md**.
