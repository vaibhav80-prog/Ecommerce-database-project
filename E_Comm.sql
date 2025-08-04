-- Microsoft SQL Server Used

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(25) NOT NULL,
    PasswordHash VARCHAR(50) NOT NULL,
    Created_at DATETIME DEFAULT GETDATE(),
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(25),
    State VARCHAR(25),
    Zip_Code VARCHAR(25) NOT NULL,
    Country VARCHAR(25)
);

-- Categories Table
CREATE TABLE Categories (
    Category_ID INT IDENTITY(1,1) PRIMARY KEY,
    Category_Name VARCHAR(25) NOT NULL,
    Description VARCHAR(1000)
);

-- Products Table
CREATE TABLE Products (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Description VARCHAR(1000) NOT NULL,
    Price INT NOT NULL,
    Quantiity INT NOT NULL,
    Category_ID INT,
    Img_Url VARCHAR(100),
    Created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE DEFAULT CAST(GETDATE() AS DATE),
    Total_Amount INT NOT NULL,
    Status VARCHAR(50) CHECK (Status IN ('Completed', 'Cancelled', 'Delivered')),
    Shipping_Address VARCHAR(500) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Order_Details Table
CREATE TABLE Order_Details (
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Price INT NOT NULL,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Payments Table
CREATE TABLE Payments (
    Payment_ID INT IDENTITY(1,1) PRIMARY KEY,
    Order_ID INT,
    Payment_Date DATE DEFAULT CAST(GETDATE() AS DATE),
    Amount INT NOT NULL,
    Payment_Method VARCHAR(50) CHECK (Payment_Method IN ('COD', 'UPI')),
    Payment_Status VARCHAR(50) CHECK (Payment_Status IN ('Paid', 'Pending')),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Shipping Table
CREATE TABLE Shipping (
    Shipping_ID INT IDENTITY(1,1) PRIMARY KEY,
    Order_ID INT,
    Shipping_Date DATE,
    Carrier VARCHAR(50),
    Tracking_Number VARCHAR(50),
    Status VARCHAR(50) CHECK (Status IN ('Pending', 'Dispatched', 'In Transit', 'Delivered', 'Cancelled')),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Product_Reviews Table
CREATE TABLE Product_Reviews (
    Review_ID INT IDENTITY(1,1) PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 1 AND 5),
    Review_Text VARCHAR(100),
    Review_Date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Cart Table
CREATE TABLE Cart (
    Cart_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT DEFAULT 1,
    Date_Added DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Wishlist Table
CREATE TABLE Wishlist (
    Wishlist_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Date_Added DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Admin_User Table
CREATE TABLE Admin_User (
    Admin_ID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Created_at DATETIME DEFAULT GETDATE()
);