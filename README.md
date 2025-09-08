# AcumenBI HR Analytics Project

This dbt project implements a **medallion architecture** for HR data analysis using the AdventureWorks dataset and additional organizational CSV data. The project is designed to support insights into employee leave, department distribution, and workforce patterns.

---

## Medallion Architecture

- **Bronze**  
  Raw data ingestion from AdventureWorks and external CSV files (e.g., `EXT_REGIONMAPPING`, `Shift`).

- **Silver**  
  Transformed and cleaned tables, including:
  - `transform_dimEmployee`
  - `transform_dimDepartment`
  - `transform_dimShift`
  - `transform_factLeave`

- **Gold**  
  Business-level models for reporting and analytics:  
  - Dimensions: `DimEmployee`, `DimDepartment`, `DimRegion`, `DimShift`, `DimLeaveType`  
  - Fact: `FactLeave` (links to dimensions via surrogate keys)  
  - **SCD2** implemented for `DimEmployee` using **dbt snapshots**

---

## HR Use Case

The project supports the following requirement:

> *As a people leader, I want to understand distribution of leave volumes and types so that I can assess possible patterns associated with different job positions and areas of the organization.*

Key deliverables:
- Consolidating employee, department, and organizational data
- Demonstrating SCD2 for the Employee dimension
- Producing fact tables that link employee leave with dimensions
- Showcasing the impact of data quality, integration, and transformation on actionable insights

---

## Running the Project

From your dbt project root:

```bash
dbt deps             # Install required packages
dbt run              # Build all models
dbt test             # Run tests on the data
dbt snapshot         # Apply SCD2 logic to Employee dimension
dbt docs generate && dbt docs serve  # View documentation
