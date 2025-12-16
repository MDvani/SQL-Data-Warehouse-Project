📘 **Data Catalog – Gold Layer**

Overview:

The Gold Layer represents the business-level data model designed to support reporting, analytics, and decision-making use cases.
It contains cleaned, enriched, and curated dimension and fact tables, structured using a star schema to deliver reliable business metrics.

## gold.dim_customers

**Purpose:**

Stores consolidated customer information enriched with demographic and geographic attributes.
This table serves as the customer dimension for analytical queries and reporting.

| Column Name     | Data Type    | Key Type      | Description                                                                |
| --------------- | ------------ | ------------- | -------------------------------------------------------------------------- |
| customer_key    | INT          | Surrogate Key | Auto-generated surrogate identifier representing a unique customer record. |
| customer_id     | INT          | Business Key  | Customer identifier originating from the source application.               |
| customer_number | NVARCHAR(50) | Business Key  | Business-facing customer reference used for identification and tracking.   |
| first_name      | NVARCHAR(50) | Attribute     | Given name of the customer as stored in the system.                        |
| last_name       | NVARCHAR(50) | Attribute     | Surname or family name of the customer.                                    |
| country         | NVARCHAR(50) | Attribute     | Country associated with the customer’s primary location.                   |
| marital_status  | NVARCHAR(50) | Attribute     | Indicates the marital status of the customer.                              |
| gender          | NVARCHAR(10) | Attribute     | Gender information consolidated from CRM and ERP data sources.             |
| birthdate       | DATE         | Attribute     | Date of birth of the customer.                                             |
| create_date     | DATE         | Attribute     | Timestamp indicating when the customer record was created.                 |


## gold.dim_products

**Purpose:**  
Stores product master data along with classification, pricing, and lifecycle attributes. This table is used as the product dimension for analytical reporting.

| Column Name            | Data Type     | Key Type       | Description                                                                 |
|------------------------|--------------|----------------|-----------------------------------------------------------------------------|
| product_key            | INT          | Surrogate Key  | System-generated surrogate key uniquely identifying each product record.   |
| product_id             | INT          | Business Key   | Internal product identifier assigned by the source system.                  |
| product_number         | NVARCHAR(50) | Business Key   | Structured alphanumeric product code used for inventory and categorization.|
| product_name           | NVARCHAR(50) | Attribute      | Descriptive name of the product, including key identifying details.         |
| category_id            | NVARCHAR(50) | Business Key   | Identifier representing the product’s category at a high level.             |
| category               | NVARCHAR(50) | Attribute      | Broad product classification (for example, Bikes or Components).            |
| subcategory            | NVARCHAR(50) | Attribute      | More granular classification of the product within its category.            |
| maintenance_required   | NVARCHAR(50) | Attribute      | Indicates whether the product requires maintenance (Yes or No).             |
| cost                   | INT          | Measure        | Base cost or standard price of the product in monetary units.               |
| product_line           | NVARCHAR(50) | Attribute      | Product line or series to which the product belongs.                         |
| start_date             | DATE         | Attribute      | Date when the product became available for sale or use.                     |


## gold.fact_sales

**Purpose:**  
Stores detailed transactional sales records used for analytical reporting and business analysis.

| Column Name     | Data Type     | Description                                                                 |
|-----------------|--------------|-----------------------------------------------------------------------------|
| order_number    | NVARCHAR(50) | Unique alphanumeric identifier representing each sales order.               |
| product_key     | INT          | Surrogate key referencing the associated product in the product dimension. |
| customer_key    | INT          | Surrogate key referencing the associated customer in the customer dimension.|
| order_date      | DATE         | Date on which the sales order was created.                                   |
| shipping_date   | DATE         | Date on which the order was shipped to the customer.                         |
| due_date        | DATE         | Date by which payment for the order is expected.                             |
| sales_amount    | INT          | Total monetary value of the sales line item, expressed in whole units.      |
| quantity        | INT          | Number of product units sold for the order line.                             |
| price           | INT          | Unit price of the product for the sales line item.                           |

