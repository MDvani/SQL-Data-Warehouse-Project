# Repository Structure

The following structure represents the organization of the SQL Data Warehouse & Analytics Project.  
It is designed to follow industry best practices for data engineering, ETL pipelines, and analytics workflows.

```text
SQL-Data-Warehouse-Project/
│
├── Datasets/                           # Source datasets (ERP and CRM CSV files)
│
├── Docs/                               # Project documentation and diagrams
│   ├── ETL.png                         # ETL methods and processing overview
│   ├── Highlevelarchitecture.png       # High-level data warehouse architecture
│   ├── Integration_model.png           # Data integration and modeling view
│   ├── data_flow_diagram.png           # End-to-end data flow diagram
│   ├── data_catalog.md                 # Dataset catalog and metadata descriptions
│   ├── naming_conventions.md           # Naming standards for tables, columns, and objects
│   ├── requirements.md                 # Business and technical project requirements
│   └── placeholder                     # Placeholder file to retain folder structure
│
├── scripts/                            # SQL scripts for ETL implementation
│   ├── bronze/                         # Raw data ingestion scripts
│   ├── silver/                         # Data cleansing and transformation scripts
│   └── gold/                           # Analytical models and business-ready views
│
├── tests/                              # Data quality checks and validation scripts
│
├── README.md                           # Project overview and usage instructions
├── .gitignore                          # Git ignore rules
└── LICENSE                             # License information
