# 💼 Financial Transactions Analytics Project

*A real-world financial analytics workflow.*

This project showcases the full cycle of data analytics: from generating synthetic financial data with Python and Faker, to importing and analyzing in SQL Server, and visualizing trends using Excel and Python. All steps are documented clearly to support beginners and professionals alike.

---

## 🔧 Project Workflow

### 🔨 Step 1: Synthetic Data Generation
- **Tools**: Python + Faker
- **Output**: `financial_transactions.csv`
- **Highlights**: Realistic transaction records with merchant, category, amount, and date fields. Includes NULLs and outliers for testing analysis logic.

### 🛠 Step 2: SQL Server Import
- **Method**: Bulk Insert via SSMS
- **Table**: `FinancialTransactions`
- **Challenges Solved**:
  - Column mismatches and type conflicts
  - Header cleaning
  - Delimiter issues
  - NULL value handling

### 🔍 Step 3: Initial T-SQL Analysis
- **Goals**:
  - Total spending per customer
  - Frequent merchant detection
  - Category-based filtering
- **Output**: Exported result sets ready for plotting

### 📊 Step 4: Visualization & Reporting
- **Tools**: Power Bi (Power Query)
- **Deliverables**:
  - Spending trends
  - Category breakdowns
  - Outlier and anomaly detection

---

## 📁 Project Structure


### 🧹 Data Cleaning in Python
After generating the synthetic financial dataset, we read it back into Python to inspect and clean it. The cleaning steps included:

- Checking column structure and data shape
- Detecting and reporting missing values (`isnull().sum()`)
- Identifying duplicate records (`duplicated().sum()`)
- Converting the `Date` column to datetime format
- Saving the cleaned file as `Financial_Transactions_Cleaned.csv`

This ensures data quality before importing into Power BI for analysis.



---


### 2. 🔄 Transformation & Modeling in Power BI

- **Fact Table**: `Fact_Financial_Transactions_Cleaned`
  - Merged dimensions, normalized columns, applied type transformations
  - Ensured analytical consistency across fields

#### 🗂️ Dimensions Created:

| Table                    | Columns                               | Highlights                                    |
|-------------------------|----------------------------------------|-----------------------------------------------|
| `Dim_TransactionType`   | `TransactionTypeID`, `TransactionType` | Purchase, Deposit, Withdrawal                 |
| `Dim_Branch`            | `BranchID`, `Branch`                   | Nasr City, Zamalek, New Cairo, etc.           |
| `Dim_Region`            | `RegionID`, `Region`                   | Cairo, Giza, Mansoura, Alexandria, Assiut     |
| `Dim_CustomerSegment`   | `CustomerSegmentID`, `CustomerSegment` | VIP, Regular, New                             |

_All dimensions built with Power Query transformations: header promotion, deduplication, index addition and renaming._

### 3. 💾 Data Load to SQL Server

- Bulk Inserted cleaned CSV into SQL Server
- Resolved column mapping and type issues
- Documented schema and import steps for reproducibility

### 4. 📐 Star Schema Architecture

| Table                          | Type        | Purpose                                         |
|-------------------------------|-------------|-------------------------------------------------|
| `Fact_Financial_Transactions` | Fact         | Central data on transactions                   |
| `Dim_*` tables                 | Dimensions   | Lookup tables for analysis and filtering       |
| `Date`                        | Dimension    | Enables time-based slicing                     |
| `MyMeasures`                  | Calculated   | Custom KPIs for dashboard insights             |

---

## 📊 Power BI Dashboard & KPIs

Interactive dashboards created using Power BI to visualize behavioral patterns and KPIs.

#### 🔍 Key Visuals:

- **Transaction Volume Over Time** → line chart with filters
- **Customer Segment Breakdown** → pie chart
- **Branch Performance** → bar chart with drill-through
- **KPI Cards** → total transactions, total amount, average/max amount

#### 📐 Sample Measures:

```DAX
AvgAmountPerTransactionType = AVERAGEX(VALUES(Dim_TransactionType[TransactionType]), [TotalAmount])
MaxAmountPerTransactionType = MAXX(VALUES(Dim_TransactionType[TransactionType]), [TotalAmount])



# 📊 Power BI Analytics: Transaction Insights by Region

## 📁 Dataset Overview
This project analyzes financial transactions using:
- `Fact_Financial_Transactions_Clean`
- `Dim_Region`
- `Dim_TransactionType`

## 🔗 Data Model Relationships
Ensure the following relationships are defined:
- `Fact_Financial_Transactions_Cleaned[RegionID]` → `Dim_Region[RegionID]`
- `Fact_Financial_Transactions_Cleaned[TransactionTypeID]` → `Dim_TransactionType[TransactionTypeID]`

---

## 🧮 DAX Measures & Calculations

### ✅ Transaction Count
```DAX
Transaction Count = COUNTROWS(Fact_Financial_Transactions_Cleaned)


---


## 👨‍💻 Author

**toqa**  
Data analyst , beginner-friendly analytics projects that combine Python, SQL Server, 
and Power Bi.  
Passionate about empowering others through clear documentation and reproducible workflows.

---

