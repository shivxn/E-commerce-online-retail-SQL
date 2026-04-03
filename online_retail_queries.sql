-- ============================================
-- ONLINE RETAIL E-COMMERCE SQL ANALYSIS
-- Complete Portfolio with 10 Business Queries
-- ============================================

-- ==========================================
-- QUERY 1: Top 10 Customers by Total Spending
-- ==========================================
-- Purpose: Identify highest-value customers for VIP treatment
-- Returns: Customer spending patterns and purchase frequency

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) as purchase_count,
    SUM(Quantity * UnitPrice) as total_spent,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) as avg_order_value
FROM online_retail
WHERE CustomerID IS NOT NULL AND Quantity > 0
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;


-- ==========================================
-- QUERY 2: Products That Were Never Sold
-- ==========================================
-- Purpose: Identify dead stock for inventory management
-- Returns: Products with no sales records
-- Fixed: Changed from COUNT(customerid) IS NULL to proper LEFT JOIN logic

SELECT DISTINCT 
    StockCode,
    Description
FROM online_retail
WHERE StockCode NOT IN (
    SELECT DISTINCT StockCode 
    FROM online_retail 
    WHERE Quantity > 0 AND InvoiceNo IS NOT NULL
)
GROUP BY StockCode, Description
ORDER BY StockCode;


-- ==========================================
-- QUERY 3: Monthly Revenue Trend Analysis
-- ==========================================
-- Purpose: Track sales performance over time (growth/decline)
-- Returns: Monthly revenue with transaction count

SELECT 
    MONTH(InvoiceDate) as month_number,
    MONTHNAME(InvoiceDate) as month_name,
    SUM(Quantity * UnitPrice) as monthly_revenue,
    COUNT(DISTINCT InvoiceNo) as transaction_count,
    COUNT(DISTINCT CustomerID) as unique_customers
FROM online_retail
WHERE Quantity > 0
GROUP BY MONTH(InvoiceDate), MONTHNAME(InvoiceDate)
ORDER BY month_number;


-- ==========================================
-- QUERY 4: Average Order Value by Country
-- ==========================================
-- Purpose: Compare purchasing power across countries
-- Returns: Country-wise AOV, order count, and total revenue

SELECT 
    Country,
    ROUND(AVG(Quantity * UnitPrice), 2) as avg_order_value,
    COUNT(DISTINCT InvoiceNo) as order_count,
    COUNT(DISTINCT CustomerID) as unique_customers,
    SUM(Quantity * UnitPrice) as total_revenue
FROM online_retail
WHERE Country IS NOT NULL AND Quantity > 0
GROUP BY Country
ORDER BY avg_order_value DESC;


-- ==========================================
-- QUERY 5: High-Frequency Customers (50+ Purchases)
-- ==========================================
-- Purpose: Identify loyal repeat customers
-- Returns: Customers with extensive purchase history

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) as purchase_count,
    SUM(Quantity * UnitPrice) as total_spending,
    COUNT(DISTINCT DATE(InvoiceDate)) as active_days,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) as avg_order_value
FROM online_retail
WHERE CustomerID IS NOT NULL AND Quantity > 0
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 50
ORDER BY purchase_count DESC;


-- ==========================================
-- QUERY 6: Top 5 Most Sold Products by Quantity
-- ==========================================
-- Purpose: Find bestselling items (volume-based, not revenue)
-- Returns: Product details with sales metrics

SELECT 
    StockCode,
    Description,
    SUM(Quantity) as total_quantity_sold,
    COUNT(DISTINCT InvoiceNo) as times_purchased,
    COUNT(DISTINCT CustomerID) as unique_buyers,
    SUM(Quantity * UnitPrice) as total_revenue,
    ROUND(SUM(Quantity * UnitPrice) / SUM(Quantity), 2) as avg_unit_price
FROM online_retail
WHERE Quantity > 0
GROUP BY StockCode, Description
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- ==========================================
-- QUERY 7: RFM Customer Segmentation Analysis
-- ==========================================
-- Purpose: Segment customers into actionable groups
-- RFM = Recency (last purchase), Frequency (how often), Monetary (how much)
-- Returns: Customer segments with behavioral classification

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) as frequency,
    SUM(Quantity * UnitPrice) as monetary,
    MAX(InvoiceDate) as last_purchase_date,
    DATEDIFF(CURDATE(), MAX(InvoiceDate)) as days_since_purchase,
    CASE 
        WHEN COUNT(DISTINCT InvoiceNo) >= 5 AND SUM(Quantity * UnitPrice) > 500 THEN 'Champions'
        WHEN COUNT(DISTINCT InvoiceNo) >= 4 AND SUM(Quantity * UnitPrice) > 300 THEN 'Loyal'
        WHEN COUNT(DISTINCT InvoiceNo) >= 3 AND SUM(Quantity * UnitPrice) > 100 THEN 'Potential'
        WHEN COUNT(DISTINCT InvoiceNo) = 2 THEN 'New'
        ELSE 'At Risk'
    END as customer_segment
FROM online_retail
WHERE CustomerID IS NOT NULL AND Quantity > 0
GROUP BY CustomerID
ORDER BY monetary DESC;


-- ==========================================
-- QUERY 8: Customer Repeat Purchase Rate
-- ==========================================
-- Purpose: Measure customer loyalty percentage
-- Returns: % of customers who made more than 1 purchase

SELECT 
    ROUND(
        COUNT(DISTINCT CASE WHEN purchase_count > 1 THEN CustomerID END) * 100.0 / 
        COUNT(DISTINCT CustomerID), 2
    ) as repeat_purchase_rate_percent,
    
    COUNT(DISTINCT CASE WHEN purchase_count > 1 THEN CustomerID END) as repeat_customers,
    
    COUNT(DISTINCT CustomerID) as total_customers
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) as purchase_count
    FROM online_retail
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
) customer_purchases;


-- ==========================================
-- QUERY 9: Weekly Revenue Trend Analysis
-- ==========================================
-- Purpose: Identify peak shopping weeks/days
-- Returns: Weekly sales performance metrics

SELECT 
    WEEK(InvoiceDate) as week_number,
    SUM(Quantity * UnitPrice) as weekly_revenue,
    COUNT(DISTINCT InvoiceNo) as order_count,
    COUNT(DISTINCT CustomerID) as customer_count,
    ROUND(AVG(Quantity * UnitPrice), 2) as avg_transaction_value
FROM online_retail
WHERE Quantity > 0
GROUP BY WEEK(InvoiceDate)
ORDER BY week_number;


-- ==========================================
-- QUERY 10: Customer Lifetime Value (CLV)
-- ==========================================
-- Purpose: Calculate total value each customer brings
-- Returns: Complete customer profitability metrics

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) as total_orders,
    SUM(Quantity) as total_items_purchased,
    SUM(Quantity * UnitPrice) as lifetime_value,
    MIN(InvoiceDate) as first_purchase_date,
    MAX(InvoiceDate) as last_purchase_date,
    DATEDIFF(MAX(InvoiceDate), MIN(InvoiceDate)) as customer_lifecycle_days,
    COUNT(DISTINCT MONTH(InvoiceDate)) as months_active,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) as avg_order_value,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT MONTH(InvoiceDate)), 2) as avg_monthly_value
FROM online_retail
WHERE CustomerID IS NOT NULL AND Quantity > 0
GROUP BY CustomerID
ORDER BY lifetime_value DESC
LIMIT 20;

-- ============================================
-- END OF ONLINE RETAIL SQL PORTFOLIO
-- ============================================
