# Power-BI-Executive-Churn-Ticket-Analytics-Using-SQL
An enterprise-grade Power BI analytical solution connecting MySQL transactional databases (fact_customer_churn and support_tickets) to track customer churn behavior, contractual risk factors, and support ticket resolution metrics across a multi-page interactive dashboard.
## Dashboard Preview

### Page 1: Executive Overview
![Executive Overview Dashboard](Screenshot%20\(388\).png)

### Page 2: Support Operations & Drill-Down
![Support Operations Dashboard](Screenshot%20\(389\).png)

# Executive Churn & Support Ticket Analytics Dashboard

An end-to-end business intelligence solution built in **Power BI Desktop** powered by a **MySQL** database (`churn_analytics`). This dashboard provides executive leadership and operations teams with real-time visibility into customer retention drivers, contract leakages, and support service bottlenecks.

---

## Key Technical Architecture & Modeling
* **Data Source:** MySQL relational database (`fact_customer_churn` and `support_tickets`).
* **Data Transformation:** Cleaned messy headers, standardized data types, and generated sequential index-based primary keys via Power Query.
* **Data Modeling:** Established a robust schema featuring an active **Many-to-One (*:1)** relationship linking `support_tickets` to `fact_customer_churn` via `Customer ID`.
* **DAX Engine:** Centralized all calculation metrics inside a dedicated `_Key Measures` table using explicit aggregation measures.

---

## Core DAX Measures Implemented
* **Total Customers:** `COUNTROWS('fact_customer_churn')`
* **Churned Customers:** Calculated via filtered row context on customer churn status.
* **Churn Rate %:** Dynamically calculated ratio using `DIVIDE()` to handle empty sets gracefully.
* **Total Tickets & Volume Metrics:** Evaluates operational ticket loads per customer account.

---

## Dashboard Structure (Multi-Page Layout)

### **Page 1: Executive Overview**
* **Top KPI Banner:** High-level metric cards tracking `Total Customers`, `Churn Rate %`, `Total Tickets`, `Avg Tickets per Customer`, and churned ticket counts.
* **Contract Risk Analysis:** Donut/Bar chart highlighting churn distribution across `Month-to-month`, `1-year`, and `2-year` agreements.
* **Support Volume Impact:** Clustered column chart analyzing ticket volume distribution by priority levels.

### **Page 2: Operations & Deep-Dive Analysis**
* **Global Slicers:** Dynamic filtering capabilities across `Internet Service`, `Payment Method`, and `Resolution Status`.
* **Cross-Table Analytics:** Investigates the exact correlation between support ticket severity (High/Medium/Low) and customer churn rate.

---

## How to Run Locally
1. Clone this repository or download the `.pbix` file.
2. Ensure your local MySQL instance is running with the `churn_analytics` database populated.
3. Open the `.pbix` file in **Power BI Desktop**.
4. Update the MySQL data source connection credentials if necessary under **Transform Data > Source Settings**, then click **Refresh**.
