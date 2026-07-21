# High-Performance In-Memory Data Wrangling in R

## Project Overview
This project, completed as part of the **Week 2 Data Processing Assignment**, demonstrates high-speed in-memory data manipulation, cleaning, aggregation, indexing, and visualization using R's `data.table` package on a synthetic dataset of **500,000 sales transactions**.

## Author
* **Author:** [Rakshana](https://github.com/RakshanaQ)
* **Repository:** [Data-r-Task-2](https://github.com/RakshanaQ/Data-r-Task-2)

---

## Code Breakdown & Pipeline Architecture

The script [`2 nd task.R`](https://github.com/RakshanaQ/Data-r-Task-2/blob/main/2%20nd%20task.R) is structured into 10 distinct sequential parts:

### Part 1: Dataset Generation
* Generates $500,000$ synthetic transactions using `data.table` and reproducible random sampling (`set.seed(123)`).
* Captures key transactional fields including `TransactionID`, `CustomerID`, `CustomerName`, `Gender`, `Age`, `ProductID`, `ProductName`, `Category`, `Quantity`, `UnitPrice`, `Discount`, `GST`, `PaymentMethod`, `City`, `State`, `OrderDate`, and `SalesPerson`.
* Writes the initial dataset directly to `sales_transactions.csv`.

### Part 2: Dataset Loading & Initial Exploration
* Imports data efficiently using `fread()`.
* Inspects dataset dimensions (`dim()`), structure (`str()`), missing values (`is.na()`), duplicate rows (`duplicated()`), and summary statistics.
* Analyzes distinct counts for customers, products, cities, and payment method distributions using `.N` grouping.

### Part 3: Data Cleaning & Schema Optimization
* Verifies missing values and removes duplicate entries using `unique()`.
* Renames key columns (`CustomerID` $\rightarrow$ `CustID`, `ProductID` $\rightarrow$ `ProdID`) with `setnames()`.
* Reorders columns with `setcolorder()` and optimizes memory by casting numeric types explicitly (`as.integer()`, `as.numeric()`, `as.Date()`).

### Part 4: High-Speed Filtering & Sorting
* Executes fast conditional filtering based on multiple criteria (e.g., category, location, and price ranges).
* Orders records efficiently using `-UnitPrice` and `-Quantity` to extract top 20 extreme transactions.

### Part 5: In-Place Column Mutation (`:=`)
Uses `data.table`'s memory-efficient `:=` operator to calculate financial attributes in-place without duplicating memory allocation:
$$\text{Revenue} = \text{Quantity} \times \text{UnitPrice}$$
$$\text{DiscountAmount} = \frac{\text{Revenue} \times \text{Discount}}{100}$$
$$\text{GSTAmount} = \frac{\text{Revenue} \times \text{GST}}{100}$$
$$\text{NetRevenue} = \text{Revenue} - \text{DiscountAmount} + \text{GSTAmount}$$

### Part 6: Binary Search Indexing (`setkey()`)
* Benchmarks standard vector scan filtering against key-based indexing using `setkey()`.
* Sets binary search keys on `CustID` and `ProdID` for instant $O(\log N)$ lookup performance.

### Part 7 & 8: Group-Wise Aggregations & Business Analysis
* Aggregates total orders, total net revenue, and mean spending grouped by:
  * **Customer:** Identifies top high-value buyers (`customer_summary`).
  * **Product:** Calculates volume sold and net earnings per product (`product_summary`).
  * **City & Category:** Generates location-wise and product line performance reports (`city_summary` & `category_summary`).

### Part 9: Report Export
* Automatically creates an `Output/` directory if missing.
* Exports detailed summary files: `customer_summary.csv`, `product_summary.csv`, `city_summary.csv`, and `final_sales_transactions.csv`.

### Part 10: Automated Visualizations
Saves performance charts directly into the `Output/` folder:
* `city_transactions.png`: Bar chart of transaction volume per city.
* `category_revenue.png`: Bar chart of net revenue across product categories.
* `top_customers.png`: Bar chart highlighting top 20 highest-spending customers.
* `payment_distribution.png`: Pie chart of transaction shares by payment channel.

---

## Directory Structure

```text
Data-r-Task-2/
│
├── 2 nd task.R                 # Main R script containing the full 10-part pipeline
├── sales_transactions.csv      # Generated dataset (500,000 rows)
├── README.md                   # Project documentation
└── Output/                     # Generated export folder
    ├── customer_summary.csv
    ├── product_summary.csv
    ├── city_summary.csv
    ├── final_sales_transactions.csv
    ├── city_transactions.png
    ├── category_revenue.png
    ├── top_customers.png
    └── payment_distribution.png
