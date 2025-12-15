/*
=================================================================
Data Quality Validation – Silver Layer
=================================================================

Overview:
This script performs multiple data quality validations to ensure
data reliability, correctness, and standardization within the
'silver' schema.

Quality Checks Included:
- Detection of NULL or duplicate primary key values.
- Identification of leading or trailing spaces in text columns.
- Verification of data standardization and consistency rules.
- Validation of date ranges and chronological order.
- Consistency checks across related columns.

Usage Guidelines:
- Execute this script after completing the Silver layer load.
- Review and address any issues identified by the checks before
  proceeding to downstream layers.

=================================================================
*/

===================================================================
 Checking: 'silver.crm_cust_info'
===================================================================*/

-- Primary Key Validation (NULLs / Duplicates)
SELECT
    cst_id,
    COUNT(*) AS cnt
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Unwanted Spaces Check
SELECT
    cst_key
FROM silver.crm_cust_info
WHERE cst_key <> TRIM(cst_key);

-- Data Standardization Check
SELECT DISTINCT
    cst_marital_status
FROM silver.crm_cust_info;


/*===================================================================
 Checking: 'silver.crm_prd_info'
===================================================================*/

-- Primary Key Validation (NULLs / Duplicates)
SELECT
    prd_id,
    COUNT(*) AS cnt
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Unwanted Spaces Check
SELECT
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm <> TRIM(prd_nm);

-- Cost Validation (NULL / Negative Values)
SELECT
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Data Standardization Check
SELECT DISTINCT
    prd_line
FROM silver.crm_prd_info;

-- Invalid Date Order Check
SELECT
    *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


/*===================================================================
 Checking: 'silver.crm_sales_details'
===================================================================*/

-- Invalid Date Range Check (Bronze Source Validation)
SELECT
    NULLIF(sls_due_dt, 0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
   OR LEN(sls_due_dt) <> 8
   OR sls_due_dt < 19000101
   OR sls_due_dt > 20500101;

-- Invalid Date Order Check
SELECT
    *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- Sales Consistency Check
-- Rule: Sales = Quantity × Price
SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantity <= 0
   OR sls_price <= 0
   OR sls_sales <> sls_quantity * sls_price
ORDER BY sls_sales, sls_quantity, sls_price;


/*===================================================================
 Checking: 'silver.erp_cust_az12'
===================================================================*/

-- Birth Date Range Validation
SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01'
   OR bdate > GETDATE();

-- Gender Standardization Check
SELECT DISTINCT
    gen
FROM silver.erp_cust_az12;


/*===================================================================
 Checking: 'silver.erp_loc_a101'
===================================================================*/

-- Country Standardization Check
SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101
ORDER BY cntry;


/*===================================================================
 Checking: 'silver.erp_px_cat_g1v2'
===================================================================*/

-- Unwanted Spaces Check
SELECT
    *
FROM silver.erp_px_cat_g1v2
WHERE cat <> TRIM(cat)
   OR subcat <> TRIM(subcat)
   OR maintenance <> TRIM(maintenance);

-- Maintenance Category Standardization
SELECT DISTINCT
    maintenance
FROM silver.erp_px_cat_g1v2;


