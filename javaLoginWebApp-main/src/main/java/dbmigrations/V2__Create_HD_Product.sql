CREATE TABLE HD_Product(
    Product_ID int NOT NULL PRIMARY KEY,
    Product_Name VARCHAR(20) NOT NULL,
    Product_Description VARCHAR(20) NOT NULL,
    Product_Color VARCHAR(20) NOT NULL,
    Product_Size int (20) NOT NULL,
    Product_Price double PRECISION(7,2) NOT NULL
);