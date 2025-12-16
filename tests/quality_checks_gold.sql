/*
================================================================================
Quality Validation Checks
================================================================================

Purpose:
This script executes data quality validations on the Gold layer to ensure
data integrity, consistency, and accuracy. The checks include:

- Verifying the uniqueness of surrogate keys in dimension tables.
- Ensuring referential integrity between fact and dimension tables.
- Validating model relationships to support reliable analytical reporting.

Usage Notes:
- Execute these checks after completing data loads into the Silver layer.
- Review, analyze, and fix any issues identified during the validation process.
================================================================================
*/

-- ====================================================================
-- Data Quality Validation: Customer Dimension
-- ====================================================================
-- Validate uniqueness of customer surrogate keys in gold.dim_customers
-- Expected Result: Query should return zero rows
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Data Quality Validation: Product Dimension
-- ====================================================================
-- Validate uniqueness of product surrogate keys in gold.dim_products
-- Expected Result: Query should return zero rows
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Data Model Integrity Check: Fact-to-Dimension Relationships
-- ====================================================================
-- Verify referential integrity between fact table and dimension tables
-- Expected Result: No records with missing dimension references
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
