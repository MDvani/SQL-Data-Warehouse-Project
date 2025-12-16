# Project Requirements

This document outlines the business and technical requirements for the SQL Data Warehouse & Analytics Project.

---

## 1. Business Objective

The objective of this project is to design and implement a modern data warehouse using SQL Server to consolidate sales data from multiple source systems and enable analytical reporting for informed decision-making.

---

## 2. Scope of the Project

- Build a centralized data warehouse using Medallion Architecture (Bronze, Silver, Gold)
- Ingest data from multiple source systems
- Perform data cleansing and transformation
- Create analytics-ready data models
- Develop SQL-based analytical queries

---

## 3. Data Sources

- **ERP System**
  - Source format: CSV files
  - Contains transactional and product-related data

- **CRM System**
  - Source format: CSV files
  - Contains customer and sales-related data

---

## 4. Data Engineering Requirements

### 4.1 Data Ingestion
- Load raw CSV files into the Bronze layer
- Preserve source data without modification

### 4.2 Data Quality
- Handle missing values
- Remove duplicate records
- Standardize data formats
- Validate data consistency across sources

### 4.3 Data Integration
- Combine ERP and CRM data into a unified model
- Resolve schema and data-type conflicts

### 4.4 Data Modeling
- Implement a Star Schema in the Gold layer
- Create fact and dimension tables optimized for analytics

### 4.5 Scope Limitation
- Only the latest dataset is considered
- Historical tracking (SCD) is out of scope

---

## 5. Analytics & Reporting Requirements

The data warehouse must support analytical queries to generate insights related to:

- Customer behavior
- Product performance
- Sales trends
- Business KPIs

All analytics must be developed using SQL queries.

---

## 6. Documentation Requirements

- Data architecture documentation
- Data flow diagrams
- Data model diagrams
- Naming conventions
- Data catalog

---

## 7. Tools & Technologies

- SQL Server Express
- SQL Server Management Studio (SSMS)
- Git & GitHub
- Draw.io
- CSV files as source data

---

## 8. Deliverables

- Fully functional SQL Data Warehouse
- ETL SQL scripts (Bronze, Silver, Gold)
- Analytical SQL queries
- Project documentation
- GitHub repository

---
