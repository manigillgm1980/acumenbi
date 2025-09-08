# HR Analytics with dbt + Snowflake

This project demonstrates how to build a modern analytics pipeline using **dbt Cloud** and **Snowflake**, following the **medallion architecture** (Bronze → Silver → Gold).

---

## Business Goal  
As a people leader, understand **patterns in employee leave** (sick leave, vacation) across job roles, departments, and regions, to support workforce planning, attrition insights, and health & safety monitoring.  

---

## Approach  
- **Bronze** → Ingest raw AdventureWorks HR data and external CSV (Region mapping).  
- **Silver** → Clean, transform, and standardize (employees, departments, shifts, leave fact).  
- **Gold** → Deliver business-ready models:  
  - Dimensions with surrogate keys (DimEmployee, DimDepartment, DimShift, DimRegion, DimLeaveType).  
  - **SCD2** applied to Employee for historical tracking.  
  - FactLeave table linking employees to departments, shifts, regions, and leave types.  

---

## Key Features  
- **dbt Snapshots** for Slowly Changing Dimensions (Employee).  
- **Data tests** for referential integrity (fact → dimension keys).  
- **Documentation** auto-generated with `dbt docs`.  
- **GitHub** for version control and collaboration.  

---

## What This Shows  
- Scalable design for HR analytics, easily extendable to other domains (e.g., Sales).  
- Strong governance and reproducibility practices.  
- Foundation for BI dashboards and advanced analytics.  
