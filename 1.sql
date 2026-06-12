-- Creating the Database sales
Create Database If Not Exists sales;

-- Using the Database
Use sales;	
drop table sales_data;
-- Creating the table
CREATE TABLE sales_data (
    Product_ID INT NOT NULL,
    Sale_Date DATETIME NOT NULL,
    Sales_Rep VARCHAR(50),
    Region VARCHAR(10),
    Sales_Amount INT NOT NULL,
    Quantity_Sold INT(3),
    Product_Category VARCHAR(50),
    Unit_Cost INT,
    Unit_Price INT,
    Customer_Type VARCHAR(20),
    Discount INT,
    Payment_Method VARCHAR(20),
    Sales_Channel VARCHAR(20),
    Region_and_Sales_Rep VARCHAR(20)
);
Select * from sales_data;

desc sales_data;

# Counting total rows
Select Count(*) From sales_data;

# Category wise total sales and Revenue
Select Product_Category,count(Quantity_Sold),Sum(Sales_Amount) as Total_Revenue
From sales_data
Group by Product_Category
Order by Total_Revenue Desc;

# Most Payment is Used
Select Payment_Method,Count(Product_ID) as Total_Orders
From sales_data
Group by Payment_Method
Order by Total_Orders Desc;

# Region wise Revenue
Select Region,Sum(Sales_Amount) as Total_Revenue
From sales_data
Group by Region
Order by Total_Revenue Desc;

# Finding Most Product Selling from Which Channel
Select Sales_Channel, Count(Product_ID) as Total_Product
From sales_data
Group by Sales_Channel
Order by Total_Product Desc;

# Customer Type 
Select Customer_Type, Count(Product_ID) as Orders
From sales_data
Group by Customer_Type
Order by Orders Desc;



