-- Create Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(100),
);

-- Create Addresses table
CREATE TABLE Addresses (
  address_id INT PRIMARY KEY,
  user_id INT,
  street VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Products table
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10, 2)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create Categories table
CREATE TABLE Categories (
  category_id INT PRIMARY KEY,
  name VARCHAR(100)
);

-- Create ProductCategories table
CREATE TABLE ProductCategories (
  product_category_id INT PRIMARY KEY,
  product_id INT,
  category_id INT,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
