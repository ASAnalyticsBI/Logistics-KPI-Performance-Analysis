# Logistics-KPI-Performance-Analysis
End-to-end logistics KPI analysis - OTIF tracking, RCA, Power BI dashboard, SQL analysis, Python EDA.

## Problem Statement

Logistics networks across industries face a persistent challenge: shipments that fail to arrive **on time and in full (OTIF)**, leading to customer dissatisfaction, operational inefficiency, and uncontrolled freight costs. Without systematic KPI tracking and root cause analysis, these failures repeat indefinitely.

This project analyzes **5,000 shipment records** across 10 routes and 5 carriers to:
- Quantify the OTIF gap against industry benchmark
- Identify which routes and carriers are failing and why
- Map service failure root causes
- Recommend data-driven corrective actions

---

## Key Findings

| Metric | Value |
|--------|-------|
| Overall OTIF Rate | 35.9% (vs 85% benchmark) |
| OTIF Gap | 49.1 percentage points |
| Critical Routes (0% OTIF) | Delhi-Mumbai, Kolkata-Delhi, Lucknow-Patna |
| Freight Cost Premium on Bad Routes | 47% above network average |
| Total Service Failures | 2,332 orders |
| Top Failure Cause | Vehicle Breakdown (408 cases) |
| Underperforming Carriers | DTDC (16.1%), XpressBees (17.1%) |
| Projected OTIF Improvement | 15–20% via carrier reallocation |

---

## Methodology

### Step 1 — Data Preparation (Excel + Power Query)
- Loaded 5,000 shipment records
- Cleaned nulls, standardized date formats
- Validated OTIF logic: On_Time AND In_Full = OTIF

### Step 2 — SQL Analysis (MySQL)
- 7 structured queries for KPI extraction
- Route-level, carrier-level, and lane-level analysis
- TMS-equivalent lane performance output

### Step 3 — Python EDA (Pandas, Matplotlib, Seaborn)
- Exploratory analysis on 5,000 records
- Pareto analysis on service failures
- Scatter plot: Freight Cost vs OTIF by Route

### Step 4 — Root Cause Analysis (5-Why Methodology)
- Identified root cause: No carrier performance-based assignment policy
- Fishbone analysis on top 3 failure categories
- Corrective action plan with projected impact

### Step 5 — Power BI Dashboard (5 Pages)
- Executive Summary
- Route & Freight Analysis
- Carrier Performance Scorecard
- Service Failure RCA
- TMS Lane Analysis

### Step 6 — SOP Documentation
- Standard Operating Procedure for monthly KPI reporting
- UAT validation checklist (6 checkpoints)

---

## Tools Used

| Tool | Purpose |
|------|---------|
| MySQL | KPI queries, lane analysis, carrier scorecard |
| Python (Pandas, Matplotlib, Seaborn) | EDA, Pareto chart, scatter analysis |
| Power BI | 5-page leadership dashboard, DAX measures |
| Advanced Excel | Data cleaning, RCA documentation, SOP |

## About

**Ansa Siddiqui** | Data Analyst | Jodhpur, Rajasthan | 
siddiquiansa66@gmail.com | github.com/ASAnalyticsBI
