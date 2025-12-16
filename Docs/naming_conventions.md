# Naming Conventions

This document defines the standard naming conventions used for schemas, tables, views, columns, keys, and stored procedures within the data warehouse.

## General Principles
- Use snake_case with lowercase letters and underscores (_).
- Use English for all object names.
- Avoid SQL reserved keywords.
- Ensure names are clear, descriptive, and consistent.

## Table Naming Conventions

### Bronze Layer Rules
- Table names must start with the source system name.
- Original source table names must be preserved without renaming.

Pattern:
<source_system>_<entity>

Where:
- <source_system> represents the source system name (e.g., crm, erp).
- <entity> represents the original table name from the source system.

Example:
crm_customer_info

### Silver Layer Rules
- Table names must start with the source system name.
- Original source table names must be retained.
- Naming remains consistent with the Bronze layer.

Pattern:
<source_system>_<entity>

Example:
crm_customer_info

### Gold Layer Rules
- Table names must use meaningful, business-aligned names.
- Names must begin with a category prefix that defines the table type.

Pattern:
<category>_<entity>

Where:
- <category> defines the table role, such as dim or fact.
- <entity> represents a business-aligned entity name.

Examples:
dim_customers
fact_sales

## Table Category Glossary
dim_    → Dimension tables (e.g., dim_customers, dim_products)
fact_   → Fact tables (e.g., fact_sales)
report_ → Reporting tables (e.g., report_customers, report_sales_monthly)

## Column Naming Conventions

### Surrogate Keys
- All surrogate primary keys in dimension tables must end with the suffix _key.

Pattern:
<entity>_key

Example:
customer_key

### Technical Columns
- All system-generated metadata columns must start with the prefix dwh_.

Pattern:
dwh_<column_name>

Where:
- dwh_ is reserved for data warehouse technical metadata.

Example:
dwh_load_date

## Stored Procedure Naming
- Stored procedures used for loading data must follow the pattern below.

Pattern:
load_<layer>

Where:
- <layer> represents the target layer (bronze, silver, or gold).

Examples:
load_bronze
load_silver
load_gold
