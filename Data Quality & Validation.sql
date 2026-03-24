use assignment ;
CREATE TABLE Sales_Transactions (
    Txn_ID INT,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(50),
    Product_ID VARCHAR(10),
    Quantity INT,
    Txn_Amount INT,
    Txn_Date DATE,
    City VARCHAR(50)
);

INSERT INTO Sales_Transactions VALUES
(201, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(202, 'C102', 'Anjali Rao', 'P12', 1, 1500, '2025-12-01', 'Bengaluru'),
(203, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(204, 'C103', 'Suresh Iyer', 'P13', 3, 6000, '2025-12-02', 'Chennai'),
(205, 'C104', 'Neha Singh', 'P14', NULL, 2500, '2025-12-02', 'Delhi'),
(206, 'C105', NULL, 'P15', 1, NULL, '2025-12-03', 'Pune'),
(207, 'C106', 'Amit Verma', 'P16', 1, 1800, NULL, 'Pune'),
(208, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai');


select * from Sales_Transactions;

## Q7  Write an SQL query on sales_transations to list all duplicate keys and their counts using the
#business key (Customer_ID + Product_ID + Txn_Date + Txn_Amount )

select Customer_ID,
    Product_ID,
    Txn_Date,
    Txn_Amount,
    count(*) as duplicates from Sales_Transactions
    group by Customer_ID,
    Product_ID,
    Txn_Date,
    Txn_Amount
    having count(*) >1;
    
### Q8 : Identify Sales_Transactions.Customer_ID values that violate referential integrity when joined with
#Customers_Master and write a query to detect such violations.

CREATE TABLE Customers_Master (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers_Master VALUES
('C101', 'Rahul Mehta', 'Mumbai'),
('C102', 'Anjali Rao', 'Bengaluru'),
('C103', 'Suresh Iyer', 'Chennai'),
('C104', 'Neha Singh', 'Delhi');

    select distinct * from sales_transactions st
    left join Customers_Master cm on
    cm.customerid = st.customer_id
    where cm.customerid is null;
    
