# Ecommerce-database-project

# eCommerce Database Schema (Microsoft SQL Server)

This project contains a relational database schema for an eCommerce platform, designed for use with **Microsoft SQL Server**. It includes core functionalities such as customer management, product catalog, order processing, payments, shipping, reviews, carts, and admin controls.

---

## 📌 Tables Overview

### 1. `Customers`
Stores information about registered users.

- **Fields**: `Customer_ID`, `FullName`, `Email`, `Phone`, `PasswordHash`, `Created_at`, `Address`, `City`, `State`, `Zip_Code`, `Country`

### 2. `Categories`
Manages product categories.

- **Fields**: `Category_ID`, `Category_Name`, `Description`

### 3. `Products`
Holds product listings and related info.

- **Fields**: `Product_ID`, `Product_Name`, `Description`, `Price`, `Quantity`, `Category_ID`, `Img_Url`, `Created_at`

### 4. `Orders`
Tracks customer orders.

- **Fields**: `Order_ID`, `Customer_ID`, `Order_Date`, `Total_Amount`, `Status`, `Shipping_Address`

### 5. `Order_Details`
Line-item table for each product within an order.

- **Fields**: `Order_ID`, `Product_ID`, `Quantity`, `Price`

### 6. `Payments`
Logs payment transactions for each order.

- **Fields**: `Payment_ID`, `Order_ID`, `Payment_Date`, `Amount`, `Payment_Method`, `Payment_Status`

### 7. `Shipping`
Tracks shipping logistics for orders.

- **Fields**: `Shipping_ID`, `Order_ID`, `Shipping_Date`, `Carrier`, `Tracking_Number`, `Status`

### 8. `Product_Reviews`
Captures customer feedback and ratings for products.

- **Fields**: `Review_ID`, `Product_ID`, `Customer_ID`, `Rating`, `Review_Text`, `Review_Date`

### 9. `Cart`
Temporary storage of items customers wish to buy.

- **Fields**: `Cart_ID`, `Customer_ID`, `Product_ID`, `Quantity`, `Date_Added`

### 10. `Wishlist`
Stores products users are interested in for future purchase.

- **Fields**: `Wishlist_ID`, `Customer_ID`, `Product_ID`, `Date_Added`

### 11. `Admin_User`
Contains login and role information for admin panel users.

- **Fields**: `Admin_ID`, `FullName`, `Email`, `PasswordHash`, `Role`, `Created_at`

---

## ⚙️ Relationships

- **One-to-Many**:
  - Customers → Orders
  - Orders → Order_Details
  - Categories → Products
  - Products → Product_Reviews

- **Many-to-Many**:
  - Customers ↔ Products via `Cart`, `Wishlist`, and `Order_Details`

---

## ✅ Constraints and Rules

- Primary Keys (`ID` fields) are auto-incremented using `IDENTITY(1,1)`.
- `Email` fields in `Customers` and `Admin_User` are unique.
- Check constraints used to enforce:
  - Valid payment methods (`COD`, `UPI`)
  - Valid order and shipping statuses
  - Product ratings between 1 and 5

---

## 🛠️ How to Use

1. Run the schema in SQL Server Management Studio (SSMS) or equivalent tool.
2. Populate tables with sample data as needed.
3. Use JOIN queries to generate reports like order history, payment tracking, product ratings, etc.

---

## 📂 File Structure
