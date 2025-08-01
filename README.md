# Grocery Store Database Analysis

**Technologies:** MySQL, SQL (Joins, Aggregations, Views, Subqueries, Stored Procedures)
**Goal:** To analyze sales, inventory, customer behavior, and supplier performance using a relational database for a grocery store.

## Tables Used:
1. suppliers – Contains information about product suppliers.
2. categories – Lists product categories (e.g., dairy, bakery).
3. store_employees – Employee details (roles, departments).
4. customers – Customer demographics and contact info.
5. products – Product details (price, category, supplier).
6. orders – Order-level info (date, customer_id, employee_id).
7. orderdetails – Line items per order (product_id, quantity, discount).

## Key Analysis & Insights:
1. Sales & Revenue Analysis

Calculated total revenue per product, category, and supplier.
Identified top-selling products and high-revenue categories.
Tracked monthly and daily sales trends.

2. Customer Behavior

Analyzed repeat purchase patterns.
Identified most valuable customers (based on total spend).
Grouped customers based on buying frequency and volume.

3. Employee Performance

Tracked number of orders handled by each employee.
Evaluated employee contribution to overall sales.

4. Inventory & Supply Chain

Found slow- and fast-moving inventory using orderdetails.
Analyzed supplier performance based on product popularity and availability.
Linked product shortages to supplier delays.

5. Category-wise Analysis

Merged products, categories, and orderdetails to show best-performing categories.
Filtered seasonal products using time-series ordering data.

## Technical Highlights:
Used INNER JOINs and LEFT JOINs across multiple tables.

Created subqueries to find top customers and low-stock products.

Built views for daily reporting dashboards.

Wrote stored procedures to automate monthly sales aggregation.

## Outcome:Enabled data-driven decisions for inventory restocking and promotions.
Improved customer targeting through purchase pattern analysis.

Streamlined supplier selection using performance metrics.

