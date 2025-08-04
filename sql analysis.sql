use financial_transactions 
CREATE TABLE FinancialTransactions (
    TransactionID     VARCHAR(50)     NOT NULL PRIMARY KEY, 
    CustomerID        VARCHAR(50)     NOT NULL,               
    TransactionType   VARCHAR(20)     NOT NULL,              
    Amount            DECIMAL(12,2)   NOT NULL,              
    Date              DATETIME        NOT NULL,              
    Branch            VARCHAR(50)     NULL,                  
    Region            VARCHAR(50)     NULL,                 
    CustomerSegment   VARCHAR(30)     NULL                   
);


BULK INSERT FinancialTransactions
FROM 'D:\new_chapter\project\financial_transactions.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

select * from FinancialTransactions


SELECT TransactionType, COUNT(*) AS Count
FROM FinancialTransactions
GROUP BY TransactionType


SELECT TOP 10 *
FROM FinancialTransactions
ORDER BY Amount DESC

-- ?? ?? ??? ???????
SELECT 
  COUNT(*) AS TotalRows,
  SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) AS NullAmounts,
  SUM(CASE WHEN TransactionType IS NULL THEN 1 ELSE 0 END) AS NullTypes
FROM FinancialTransactions;


SELECT
  AVG(Amount) AS AverageAmount,
  MIN(Amount) AS MinAmount,
  MAX(Amount) AS MaxAmount
FROM FinancialTransactions;


SELECT TransactionType, COUNT(*) AS Count
FROM FinancialTransactions
GROUP BY TransactionType;

SELECT CustomerSegment, COUNT(*) AS Count
FROM FinancialTransactions
GROUP BY CustomerSegment;