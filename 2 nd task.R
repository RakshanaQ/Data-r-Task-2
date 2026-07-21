############################################################
# High-Performance In-Memory Data Wrangling
# Week 2 Project
#
# Student Name :
# Register Number :
############################################################

##############################
# Part 1 : Generate Dataset
##############################

# Install package (Run only once)
install.packages("data.table")

# Load package
library(data.table)

# Set seed for reproducibility
set.seed(123)

# Number of transactions
n <- 500000

# Generate synthetic dataset
sales <- data.table(

  TransactionID = 1:n,

  CustomerID = sample(sprintf("C%05d",1:10000), n, replace = TRUE),

  CustomerName = sample(c(
    "Arun","Kumar","Rahul","Vijay","Ajay",
    "Priya","Divya","Anitha","Sneha","Meena",
    "Ramesh","Suresh","Karthik","Deepa","Nisha",
    "Varun","Asha","Keerthi","John","David"
  ), n, replace = TRUE),

  Gender = sample(c("Male","Female"), n, replace = TRUE),

  Age = sample(18:60, n, replace = TRUE),

  ProductID = sample(sprintf("P%04d",101:500), n, replace = TRUE),

  ProductName = sample(c(
    "Laptop","Mouse","Keyboard","Monitor",
    "Printer","Tablet","Mobile","Camera",
    "Speaker","Headphone","SSD","Hard Disk",
    "Router","Projector","Smart Watch"
  ), n, replace = TRUE),

  Category = sample(c(
    "Electronics",
    "Accessories",
    "Computer",
    "Mobile",
    "Office"
  ), n, replace = TRUE),

  Quantity = sample(1:10, n, replace = TRUE),

  UnitPrice = sample(seq(500,50000,500), n, replace = TRUE),

  Discount = sample(c(0,5,10,15,20), n, replace = TRUE),

  GST = sample(c(5,12,18), n, replace = TRUE),

  PaymentMethod = sample(c(
    "Cash",
    "Credit Card",
    "Debit Card",
    "UPI",
    "Net Banking"
  ), n, replace = TRUE),

  City = sample(c(
    "Chennai",
    "Bangalore",
    "Hyderabad",
    "Mumbai",
    "Delhi",
    "Kolkata",
    "Pune",
    "Coimbatore",
    "Madurai",
    "Trichy"
  ), n, replace = TRUE),

  State = sample(c(
    "Tamil Nadu",
    "Karnataka",
    "Telangana",
    "Maharashtra",
    "Delhi",
    "West Bengal"
  ), n, replace = TRUE),

  OrderDate = sample(
    seq(as.Date("2024-01-01"),
        as.Date("2024-12-31"),
        by="day"),
    n,
    replace=TRUE
  ),

  SalesPerson = sample(c(
    "Raj",
    "Kiran",
    "Anu",
    "Sathish",
    "Praveen",
    "Rohit",
    "Swathi",
    "Priyanka",
    "Joseph",
    "Akash"
  ), n, replace = TRUE)

)
fwrite(sales,"sales_transactions.csv")
head(sales,10)
tail(sales,10)
dim(sales)
str(sales)
file.exists("sales_transactions.csv")

############################################################
# Part 2 : Load and Explore Dataset
############################################################

# Load data.table package
library(data.table)

# Import Dataset
sales <- fread("sales_transactions.csv")

head(sales, 10)
tail(sales, 10)
colnames(sales)
names(sales)
str(sales)
dim(sales)
summary(sales)
colSums(is.na(sales))
sum(is.na(sales))
sum(duplicated(sales))
sales[duplicated(sales)]
uniqueN(sales$CustomerID)
uniqueN(sales$ProductID)
uniqueN(sales$City)
cat("Rows :", nrow(sales), "\n")
cat("Columns :", ncol(sales), "\n")
data.table(
  Column = names(sales),
  DataType = sapply(sales, class)
)
sales[, .N, by = PaymentMethod]
sales[, .N, by = Category]

############################################################
# Part 3 : Data Cleaning and Preparation
############################################################

# Check missing values
colSums(is.na(sales))

# Total missing values
sum(is.na(sales))

sales <- unique(sales)

# Check duplicates again
sum(duplicated(sales))

setnames(sales,
         old = c("CustomerID","ProductID"),
         new = c("CustID","ProdID"))

names(sales)
setcolorder(sales,c(
"TransactionID",
"CustID",
"CustomerName",
"Gender",
"Age",
"ProdID",
"ProductName",
"Category",
"Quantity",
"UnitPrice",
"Discount",
"GST",
"PaymentMethod",
"City",
"State",
"OrderDate",
"SalesPerson"
))
# sales[, ColumnName := NULL]

sales[, Quantity := as.integer(Quantity)]

sales[, UnitPrice := as.numeric(UnitPrice)]

sales[, Discount := as.numeric(Discount)]

sales[, GST := as.numeric(GST)]

sales[, Age := as.integer(Age)]

sales[, OrderDate := as.Date(OrderDate)]

str(sales)
head(sales,10)
tail(sales,10)
dim(sales)
names(sales)

############################################################
# Part 4 : High-Speed Data Manipulation
############################################################
sales[, ProductName]
sales[, .(CustomerName, ProductName, Quantity, UnitPrice)]
sales[Quantity > 5]
sales[Category == "Electronics" & City == "Chennai"]
sales[Quantity >= 5 & UnitPrice >= 20000]
sales[order(UnitPrice)]
sales[order(Quantity)]
sales[order(-UnitPrice)]
sales[order(-Quantity)]
top20_expensive <- sales[order(-UnitPrice)][1:20]

top20_expensive
top20_quantity <- sales[order(-Quantity)][1:20]

top20_quantity
sales[order(-UnitPrice),
      .(CustomerName,
        ProductName,
        UnitPrice,
        Quantity)][1:20]
sales[order(UnitPrice)][1:20]
sales[City == "Chennai",
      .(CustomerName,
        ProductName,
        City,
        Quantity,
        UnitPrice)]
sales[Category == "Mobile"]
sales[PaymentMethod == "UPI"]
sales[Age > 50]
sales[UnitPrice >= 10000 & UnitPrice <= 30000]
dim(top20_expensive)

dim(top20_quantity)

###TASK 5
############################################################
# Part 5 : In-Place Column Updates (:=)
############################################################

# Create Revenue column
sales[, Revenue := Quantity * UnitPrice]

# Create DiscountAmount column
sales[, DiscountAmount := Revenue * Discount / 100]

# Create GSTAmount column
sales[, GSTAmount := Revenue * GST / 100]

# Create NetRevenue column
sales[, NetRevenue := Revenue - DiscountAmount + GSTAmount]

# First 10 rows
head(sales,10)

# Last 10 rows
tail(sales,10)

# Check new columns
names(sales)

sales[1:5, .(
  Quantity,
  UnitPrice,
  Revenue,
  Discount,
  DiscountAmount,
  GST,
  GSTAmount,
  NetRevenue
)]
summary(sales[, .(
  Revenue,
  DiscountAmount,
  GSTAmount,
  NetRevenue
)])

# Total Revenue
sum(sales$Revenue)

# Total Discount Given
sum(sales$DiscountAmount)

# Total GST Collected
sum(sales$GSTAmount)

# Total Net Revenue
sum(sales$NetRevenue)

sapply(sales[, .(
  Revenue,
  DiscountAmount,
  GSTAmount,
  NetRevenue
)], class)

str(sales)

############################################################
# Part 6 : Index Keying using setkey()
############################################################
system.time(
sales[CustomerID == "C0001"]
)

system.time(
sales[ProductID == "P0001"]
)

names(sales)

system.time(
sales[CustID == "C0001"]
)

system.time(
sales[ProdID == "P0001"]
)
setkey(sales, CustID)

key(sales)
sales["C0001"]

system.time(
sales["C0001"]
)
setkey(sales, ProdID)

key(sales)

sales["P0001"]

system.time(
sales["P0001"]
)

setkey(sales, CustID)

sales["C0001", .N]
setkey(sales, ProdID)

sales["P0001", .N]

############################################################
# Part 7 : Grouping and Aggregation
############################################################
customer_summary <- sales[, .(
  TotalOrders = .N,
  TotalRevenue = sum(NetRevenue),
  AverageRevenue = mean(NetRevenue)
), by = .(CustID, CustomerName)]

head(customer_summary, 10)
product_summary <- sales[, .(
  TotalQuantitySold = sum(Quantity),
  TotalRevenue = sum(NetRevenue)
), by = .(ProdID, ProductName)]

head(product_summary, 10)
city_summary <- sales[, .(
  NumberOfTransactions = .N,
  TotalRevenue = sum(NetRevenue)
), by = City]

head(city_summary, 10)
category_summary <- sales[, .(
  TotalRevenue = sum(NetRevenue),
  AverageRevenue = mean(NetRevenue)
), by = Category]

category_summary
customer_summary[order(-TotalRevenue)][1:10]
product_summary[order(-TotalRevenue)][1:10]
city_summary[order(-TotalRevenue)]
category_summary[order(-TotalRevenue)]
dim(customer_summary)

dim(product_summary)

dim(city_summary)

dim(category_summary)

############################################################
# Part 8 : Business Analysis
############################################################
city_summary[order(-TotalRevenue)][1]
product_summary[order(-TotalRevenue)][1]
customer_summary[order(-TotalOrders)][1]
sales[, .N, by = PaymentMethod][order(-N)][1]
sales[, mean(NetRevenue)]
category_summary[order(-TotalRevenue)][1]

top20_customers <- customer_summary[order(-TotalRevenue)][1:20]

top20_customers
top20_products <- product_summary[order(-TotalQuantitySold)][1:20]

top20_products
print(top20_customers)

print(top20_products)

############################################################
# Part 9 : Export Reports
############################################################
if(!dir.exists("Output")){
  dir.create("Output")
}
fwrite(customer_summary,
       "Output/customer_summary.csv")
fwrite(product_summary,
       "Output/product_summary.csv")
fwrite(city_summary,
       "Output/city_summary.csv")
list.files("Output")

############################################################
# Part 10 : Visualization
############################################################
png("Output/city_transactions.png",
    width=900,
    height=600)

barplot(city_summary$NumberOfTransactions,
        names.arg=city_summary$City,
        las=2,
        main="Transactions by City",
        xlab="City",
        ylab="Transactions")

dev.off()
png("Output/category_revenue.png",
    width=900,
    height=600)

barplot(category_summary$TotalRevenue,
        names.arg=category_summary$Category,
        las=2,
        main="Revenue by Product Category",
        xlab="Category",
        ylab="Revenue")

dev.off()
png("Output/top_customers.png",
    width=1200,
    height=700)

barplot(top20_customers$TotalRevenue,
        names.arg=top20_customers$CustID,
        las=2,
        main="Top 20 Customers by Revenue",
        xlab="Customer ID",
        ylab="Revenue")

dev.off()
payment_summary <- sales[, .N, by=PaymentMethod]

png("Output/payment_distribution.png",
    width=800,
    height=800)

pie(payment_summary$N,
    labels=payment_summary$PaymentMethod,
    main="Payment Method Distribution")

dev.off()

list.files("Output")
fwrite(sales, "Output/final_sales_transactions.csv")
list.files("Output")
getwd()
barplot(category_summary$TotalRevenue,
        names.arg = category_summary$Category,
        las = 2,
        col = "lightgreen",
        main = "Revenue by Product Category",
        xlab = "Category",
        ylab = "Revenue")
barplot(top20_customers$TotalRevenue,
        names.arg = top20_customers$CustID,
        las = 2,
        col = "orange",
        main = "Top 20 Customers by Revenue",
        xlab = "Customer ID",
        ylab = "Revenue")
