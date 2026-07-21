# High-Performance In-Memory Data Wrangling (`data.table` in R)

##  Overview
This project demonstrates high-performance, in-memory data processing and analysis using R's powerful `data.table` package. Using a synthetically generated dataset of 500,000 retail sales transactions, the script walks through the complete data science pipeline—from data generation, cleaning, high-speed manipulation, and indexing, to aggregation, business metrics analysis, and visualization output.

---

## 🛠️ Features & Workflow

### 1. **Dataset Generation (`Part 1`)**
* Generates a 500,000-row synthetic sales transaction dataset (`sales_transactions.csv`).
* Features include: `TransactionID`, `CustomerID`, `CustomerName`, `Gender`, `Age`, `ProductID`, `ProductName`, `Category`, `Quantity`, `UnitPrice`, `Discount`, `GST`, `PaymentMethod`, `City`, `State`, `OrderDate`, and `SalesPerson`.

### 2. **Data Exploration & Cleaning (`Part 2 & Part 3`)**
* Inspects structure, missing values, and duplicates.
* Renames key identifier columns (`CustomerID` ➔ `CustID`, `ProductID` ➔ `ProdID`).
* Enforces appropriate data types (`integer`, `numeric`, `Date`).

### 3. **High-Speed Data Manipulation (`Part 4 & Part 5`)**
* Performs fast row filtering and column selection.
* Derives transactional financial metrics using in-place column updates (`:=` operator):
  * **Revenue** = `Quantity * UnitPrice`
  * **DiscountAmount** = `Revenue * Discount / 100`
  * **GSTAmount** = `Revenue * GST / 100`
  * **NetRevenue** = `Revenue - DiscountAmount + GSTAmount`

### 4. **Indexing & Optimization (`Part 6`)**
* Demonstrates performance optimization using `setkey()` for fast binary search filtering on primary keys (`CustID`, `ProdID`).

### 5. **Aggregation & Business Intelligence (`Part 7 & Part 8`)**
* Groups transaction data to calculate summary statistics:
  * Top customers by revenue and total order count.
  * Top product categories and individual products by volume sold.
  * Revenue distribution across cities and payment methods.

### 6. **Reporting & Visualizations (`Part 9 & Part 10`)**
* Automatically creates an `Output/` directory to store report files.
* Exports generated reports (`customer_summary.csv`, `product_summary.csv`, `city_summary.csv`, `final_sales_transactions.csv`).
* Renders visual analysis graphs saved as PNGs:
  * `city_transactions.png` – Transaction count by city.
  * `category_revenue.png` – Total revenue by product category.
  * `top_customers.png` – Revenue from top 20 customers.
  * `payment_distribution.png` – Breakdown of payment method preferences.

---

## Getting Started

### Prerequisites
Make sure you have [R](https://www.r-project.org/) and (optionally) [RStudio](https://posit.co/download/rstudio-desktop/) installed on your system.

### Dependencies
Install the required package before running the script:

```R
install.packages("data.table")
