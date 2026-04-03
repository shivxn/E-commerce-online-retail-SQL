# 🛍️ E-Commerce Online Retail SQL Analysis Portfolio

## Project Overview

Complete SQL analysis of Online Retail e-commerce dataset with 10 production-ready queries demonstrating advanced SQL concepts. This portfolio showcases real-world business intelligence and data analysis skills.

**Dataset**: UK-based online retail transactions
**Total Queries**: 10 optimized queries
**Skill Level**: Intermediate to Advanced
**Created**: April 2026

---

## 📊 About the Dataset

The Online Retail dataset contains transactional data from a UK-based non-store online retailer. 

**Key Fields**:
- InvoiceNo: Unique transaction identifier
- StockCode: Product identifier
- Description: Product name/description
- Quantity: Items purchased per transaction
- InvoiceDate: Transaction date
- UnitPrice: Price per unit
- CustomerID: Unique customer identifier
- Country: Customer location

**Dataset Size**: 500,000+ transactions spanning multiple years

---

## 🎯 Core SQL Concepts Demonstrated

### GROUP BY & AGGREGATION
- SUM, COUNT, AVG, MIN, MAX functions
- COUNT(DISTINCT column) for unique values
- Multiple column grouping
- Data summarization techniques

### FILTERING & CONDITIONS
- WHERE clause for row filtering
- HAVING clause for group filtering
- AND/OR logic combinations
- NULL value handling

### CASE STATEMENTS
- IF-THEN-ELSE logic in SQL
- Multi-condition categorization
- Customer segmentation
- Dynamic classification

### DATE FUNCTIONS
- MONTH, WEEK extraction
- DATEDIFF calculations
- Date-based grouping
- Time series analysis

### SUBQUERIES & CTEs
- Nested queries
- Derived tables
- NOT IN subqueries
- Complex filtering logic

---

## 📋 The 10 Queries Breakdown

### QUERY 1: Top 10 Customers by Spending

**Business Question**: Which customers generate the most revenue?

**What It Shows**:
- Identify VIP customers
- Understand high-value customer behavior
- Plan loyalty programs
- Target marketing efforts

**Key Metrics**:
- Customer ID
- Number of purchases
- Total spending
- Average order value

**Use Case**: Customer retention, VIP marketing campaigns, relationship management

---

### QUERY 2: Products Never Sold

**Business Question**: Which products are dead stock?

**What It Shows**:
- Identify slow-moving inventory
- Find discontinued items
- Optimize warehouse space
- Reduce carrying costs

**Key Logic**: Uses NOT IN subquery to find products with zero sales

**Use Case**: Inventory management, clearance planning, supplier negotiations

---

### QUERY 3: Monthly Revenue Trend

**Business Question**: Is revenue growing or declining month-over-month?

**What It Shows**:
- Sales performance trends
- Seasonal patterns
- Business health indicators
- Growth trajectory

**Key Metrics**:
- Month number and name
- Monthly revenue total
- Transaction count
- Unique customers

**Use Case**: Forecasting, budget planning, performance evaluation

---

### QUERY 4: Average Order Value by Country

**Business Question**: Which countries have highest/lowest spending patterns?

**What It Shows**:
- Geographic performance differences
- Market strength by region
- Pricing power by country
- Growth opportunities

**Key Insights**:
- Country ranking by AOV
- Market penetration level
- Revenue concentration
- Expansion priorities

**Use Case**: Market strategy, pricing decisions, regional focus

---

### QUERY 5: High-Frequency Customers (50+ Purchases)

**Business Question**: Who are our most loyal repeat customers?

**What It Shows**:
- Identify brand advocates
- Understand loyalty patterns
- Retention metrics
- Valuable customer segments

**Selection Criteria**: Customers with 50+ distinct purchases

**Use Case**: Loyalty programs, retention strategies, referral marketing

---

### QUERY 6: Top 5 Best-Selling Products

**Business Question**: Which products sell the most (by quantity, not price)?

**What It Shows**:
- Bestselling items
- Popular products
- Inventory needs
- Supplier priorities

**Key Distinction**: Based on QUANTITY, not revenue (important difference!)

**Use Case**: Stock management, supplier relations, promotion planning

---

### QUERY 7: RFM Customer Segmentation (ADVANCED)

**Business Question**: How can we segment customers for targeted marketing?

**RFM Explanation**:
- **R (Recency)**: How recently did they purchase?
- **F (Frequency)**: How often do they buy?
- **M (Monetary)**: How much do they spend?

**Customer Segments**:

1. **Champions** (R, F, M all high)
   - Top spenders with recent purchases
   - Frequent buyers
   - Action: Premium service, exclusive offers

2. **Loyal** (Good on all metrics)
   - Consistent, high-value customers
   - Regular purchases
   - Action: Maintain relationship, upsell

3. **Potential** (Medium F and M)
   - Could become loyal
   - Room for growth
   - Action: Engagement campaigns, personalization

4. **New** (Low frequency)
   - Just started buying
   - Testing the brand
   - Action: Onboarding, education, incentives

5. **At Risk** (Low recency, M, or both)
   - Inactive or low-value
   - Churning customers
   - Action: Win-back campaigns, surveys

**Use Case**: Email marketing segmentation, personalized campaigns, retention focus

---

### QUERY 8: Customer Repeat Purchase Rate

**Business Question**: What percentage of customers buy more than once?

**Business Insight**: Loyalty indicator for business health

**Calculation**: 
- Count customers with 2+ purchases
- Divide by total customers
- Multiply by 100 for percentage

**Benchmark Context**:
- 20-30%: Healthy
- 30-50%: Good
- 50%+: Excellent

**Use Case**: KPI tracking, success measurement, retention benchmarking

---

### QUERY 9: Weekly Revenue Trend

**Business Question**: Which weeks have peak sales? When do customers shop most?

**What It Shows**:
- Daily/weekly patterns
- Peak shopping periods
- Staffing needs
- Inventory requirements
- Marketing timing

**Key Metrics**:
- Week number
- Weekly revenue
- Order count
- Customer count
- Average transaction value

**Use Case**: Staffing planning, inventory allocation, campaign timing

---

### QUERY 10: Customer Lifetime Value (CLV)

**Business Question**: What is the total value each customer will generate?

**CLV Explanation**: 
Total money a customer will spend with your business over their entire relationship

**Key Metrics**:
- Total orders placed
- Total items purchased
- Lifetime spending
- Customer lifecycle duration
- Average order value
- Average monthly value

**Why It Matters**:
- Determine acquisition budget
- Identify high-value customers early
- Allocate retention spending
- Predict customer worth
- Calculate marketing ROI

**Formula**: Total Spending = Lifetime Value

**Use Case**: Customer profitability analysis, investment decisions, segmentation

---

## 🎓 Theory & Best Practices

### Aggregation Functions

**SUM()**: Total of numeric column
```
SUM(Quantity * UnitPrice) = Total revenue
```

**COUNT()**: Count of rows
```
COUNT(*) = Total rows
COUNT(DISTINCT CustomerID) = Unique customers
```

**AVG()**: Average value
```
AVG(Quantity * UnitPrice) = Average order value
```

**MIN/MAX()**: Smallest/largest value
```
MIN(InvoiceDate) = First purchase
MAX(InvoiceDate) = Last purchase
```

### GROUP BY

Organizes data into groups for aggregation

```
GROUP BY CustomerID → Summarize per customer
GROUP BY Country → Summarize per country
GROUP BY MONTH(InvoiceDate) → Summarize per month
```

**Rule**: Every column in SELECT must be in GROUP BY (unless aggregated)

### HAVING vs WHERE

- **WHERE**: Filters ROWS before grouping
- **HAVING**: Filters GROUPS after aggregation

```
WHERE Quantity > 0 → Remove negative quantities first
HAVING COUNT(*) > 50 → Keep only groups with 50+ rows
```

### CASE Statements

Create custom categories:

```
CASE 
  WHEN condition THEN value
  WHEN condition THEN value
  ELSE default_value
END
```

Used for customer segmentation, classification, categorization

---

## 💼 Business Applications

### Customer Analysis
- Identify VIP customers (Query 1, 7, 10)
- Measure loyalty (Query 5, 8)
- Calculate lifetime value (Query 10)

### Inventory Management
- Find dead stock (Query 2)
- Identify bestsellers (Query 6)
- Plan stock levels

### Revenue Analysis
- Track trends (Query 3)
- Compare regions (Query 4)
- Identify peak periods (Query 9)

### Marketing Strategy
- Segment for campaigns (Query 7)
- Target high-value customers
- Win-back at-risk customers
- Timing and personalization

---

## 📈 Key Metrics & KPIs

| Metric | Formula | Why It Matters |
|--------|---------|----------------|
| AOV | Revenue / Orders | Revenue per transaction |
| CLV | Total Spend | Customer worth |
| Repeat Rate | 2+ Purchase / Total | Loyalty indicator |
| Frequency | Purchases / Customer | Purchase habit |
| Recency | Days Since Purchase | Customer activity |

---

## 🚀 How to Use This Portfolio

### Step 1: Understand the Theory
Read each query explanation carefully. Understand the BUSINESS question first, then the SQL.

### Step 2: Run the Queries
Execute each query in your SQL environment (MySQL, PostgreSQL, etc.)

### Step 3: Analyze Results
Study the output. What insights do you see? How would you act on this?

### Step 4: Modify & Experiment
Try changing:
- Time periods
- Customer thresholds
- Country filters
- Segment definitions

### Step 5: Apply to Your Data
Use these patterns with your own datasets

---

## 🎯 Real-World Applications

**For Managers**: Use these queries for business reporting and KPI tracking

**For Data Analysts**: Foundation for deeper analysis and predictive modeling

**For Marketers**: Customer segmentation and campaign targeting

**For Finance**: Revenue analysis and forecasting

---

## 📝 Query Execution Tips

1. **Always filter Quantity > 0**: Removes returns and invalid transactions
2. **Filter CustomerID IS NOT NULL**: Excludes invalid customer records
3. **Use DISTINCT**: When counting unique entities
4. **Check Data Types**: Ensure correct function usage
5. **Validate Results**: Do numbers make sense?

---

## 🔧 Database Requirements

- MySQL 5.7 or higher
- Online Retail dataset
- SELECT permission

---

## 📊 Expected Insights

From these 10 queries, you should discover:

✅ Who your best customers are
✅ Which products drive sales
✅ Where your revenue comes from
✅ How customer behavior varies
✅ Peak shopping periods
✅ Customer loyalty metrics
✅ Geographic performance
✅ Growth trends

---

## 🎓 Skills Demonstrated

✅ GROUP BY & Aggregation
✅ WHERE & HAVING filtering
✅ CASE statements for segmentation
✅ Date functions and calculations
✅ Subqueries and complex logic
✅ Multiple table relationships
✅ Business intelligence thinking
✅ Real-world problem solving

---

## 💡 Next Steps

After mastering these queries:

1. **Add visualizations** (Power BI, Tableau)
2. **Create dashboards** (real-time monitoring)
3. **Build predictions** (machine learning)
4. **Automate reports** (scheduled queries)
5. **Combine datasets** (external data sources)

---

## 📞 Portfolio Value

This portfolio demonstrates:
- Intermediate to advanced SQL skills
- Business intelligence mindset
- Real-world problem solving
- Data analysis capability
- Professional query writing
- Production-ready code

**Perfect for**:
- Job interviews
- Portfolio showcase
- Professional development
- Reference material
- Teaching/training

---

## ✅ Status & Details

**Created**: April 2026
**Dataset**: Online Retail (UK E-commerce)
**Total Queries**: 10 optimized, production-ready
**Skill Level**: Intermediate to Advanced
**Status**: Complete & Professional Ready

---

*Complete E-Commerce SQL Analysis Portfolio - Ready for Professional Use* 🚀
