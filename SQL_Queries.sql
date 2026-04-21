-- ============================================
-- LOGISTICS KPI PERFORMANCE ANALYSIS
-- Author: Ansa Siddiqui
-- Date: April 2026
-- Purpose: OTIF, TAT, Freight Cost Analysis
-- ============================================

USE logistics_project;

-- Query 1: Overall KPI Summary
SELECT
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) AS OTIF_Met,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS OTIF_Rate_Pct,
    ROUND(AVG(Freight_Cost_INR), 0) AS Avg_Freight_Cost,
    ROUND(AVG(Actual_TAT_Days - Promised_TAT_Days), 2) AS Avg_TAT_Delay_Days
FROM shipments;

-- Query 2: OTIF and Freight Cost by Route
SELECT
    Route,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS OTIF_Pct,
    ROUND(AVG(Freight_Cost_INR), 0) AS Avg_Freight_Cost_INR,
    ROUND(AVG(Actual_TAT_Days - Promised_TAT_Days), 2) AS Avg_TAT_Delay
FROM shipments
GROUP BY Route
ORDER BY OTIF_Pct ASC;

-- Query 3: Carrier Performance Scorecard
SELECT
    Carrier,
    COUNT(*) AS Total_Shipments,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS OTIF_Pct,
    ROUND(AVG(Freight_Cost_INR), 0) AS Avg_Cost,
    ROUND(AVG(Actual_TAT_Days - Promised_TAT_Days), 2) AS Avg_Delay
FROM shipments
GROUP BY Carrier
ORDER BY OTIF_Pct ASC;

-- Query 4: Service Failure Root Causes
SELECT
    Service_Failure_Reason,
    COUNT(*) AS Failure_Count,
    ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM shipments WHERE Service_Failure_Reason != 'None'), 1
    ) AS Pct_of_Failures
FROM shipments
WHERE Service_Failure_Reason != 'None'
GROUP BY Service_Failure_Reason
ORDER BY Failure_Count DESC;

-- Query 5: Regional Performance
SELECT
    Region,
    COUNT(*) AS Orders,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS OTIF_Pct,
    ROUND(SUM(Freight_Cost_INR), 0) AS Total_Freight_Spend,
    ROUND(AVG(Freight_Cost_INR), 0) AS Avg_Freight_Cost
FROM shipments
GROUP BY Region
ORDER BY OTIF_Pct ASC;

-- Query 6: Shipment Type vs TAT Performance
SELECT
    Shipment_Type,
    COUNT(*) AS Orders,
    ROUND(AVG(Promised_TAT_Days), 1) AS Avg_Promised_TAT,
    ROUND(AVG(Actual_TAT_Days), 1) AS Avg_Actual_TAT,
    ROUND(AVG(Actual_TAT_Days - Promised_TAT_Days), 2) AS Avg_Delay,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS OTIF_Pct
FROM shipments
GROUP BY Shipment_Type
ORDER BY Avg_Delay DESC;

-- Query 7: TMS-Style Lane Analysis
SELECT
    Route,
    Shipment_Type,
    COUNT(*) AS Lane_Volume,
    ROUND(AVG(Freight_Cost_INR), 0) AS Avg_Lane_Cost,
    ROUND(SUM(CASE WHEN OTIF = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Lane_OTIF_Pct,
    ROUND(AVG(Actual_TAT_Days - Promised_TAT_Days), 2) AS Lane_TAT_Delay
FROM shipments
GROUP BY Route, Shipment_Type
ORDER BY Avg_Lane_Cost DESC
LIMIT 15;