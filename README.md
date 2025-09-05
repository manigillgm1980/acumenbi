# AcumenBI HR Analytics Project

This dbt project implements a **medallion architecture** for HR data analysis using the AdventureWorks dataset and additional organizational CSV data. The project is designed to support insights into employee leave, department distribution, and workforce patterns.

## Medallion Architecture

* **Bronze**: Raw data ingestion from AdventureWorks and external CSV files (e.g., `EXT_REGIONMAPPING`).
* **Silver**: Transformed and cleaned tables, ready for analysis (fact tables, cleaned employee and department data).
* **Gold**: Business-level dimensions and fact tables, including surrogate keys and slowly changing dimensions (SCD2), optimized for reporting and analytics.

## HR Use Case

The project supports the following requirement:

> *As a people leader, I want to understand distribution of leave volumes and types so that I can assess possible patterns associated with different job positions and areas of the organization.*

This includes:

* Consolidating employee, department, and organizational data.
* Demonstrating SCD2 for Employee dimension.
* Producing fact tables that link employee activities with dimensions.
* Showcasing the impact of data quality, integration, and transformation on actionable insights.

## Running the Project

From your dbt project root, try:

```bash
dbt deps    # Install required packages
dbt run     # Build all models
dbt test    # Run tests on the data
dbt docs generate && dbt docs serve  # View documentation
```

## Resources

* [dbt Documentation](https://docs.getdbt.com/docs/introduction)
* [dbt Discourse](https://discourse.getdbt.com/)
* [dbt Community](https://getdbt.com/community)
* [dbt Blog](https://blog.getdbt.com/)
