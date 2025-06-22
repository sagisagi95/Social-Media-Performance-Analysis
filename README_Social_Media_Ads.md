
# 📊 Social Media Advertising Campaign Analysis

## 📝 Project Summary

This project analyzes a rich dataset of social media advertising campaigns collected across platforms like Facebook, Instagram, Twitter, and Pinterest. It aims to evaluate the **effectiveness** of campaigns based on metrics such as impressions, clicks, engagement, conversion rate, ROI, and more.

The analysis covers:
- Campaign performance by channel and goal
- Audience engagement by age, language, and segment
- ROI and CPA evaluation across demographics and platforms
- Time-based patterns in advertising effectiveness

---

## 📁 Dataset Overview

**File:** `Social_Media_Advertising.csv`  
**Size:** ~40MB  
**Records:** Multi-platform campaign data  
**Period:** Varies by campaign `Date` and `Duration`

---

## 🧱 Table Schema

| Column Name         | Data Type | Description                                                                 |
|---------------------|-----------|-----------------------------------------------------------------------------|
| `Campaign_ID`       | INT       | Unique identifier for each ad campaign                                     |
| `Target_Audience`   | TEXT      | Age group or demographic the ad targeted                                   |
| `Campaign_Goal`     | TEXT      | Objective of the campaign (e.g., Brand Awareness, Sales)                   |
| `Duration`          | TEXT      | Duration of the campaign (e.g., '7 days', '14 days')                       |
| `Channel_Used`      | TEXT      | Platform used (Facebook, Instagram, etc.)                                  |
| `Conversion_Rate`   | FLOAT     | Conversion rate (e.g., sign-up or purchase per click)                      |
| `Acquisition_Cost`  | TEXT      | Cost per acquisition (e.g., '$5.00') — requires cleaning                   |
| `ROI`               | FLOAT     | Return on investment                                                       |
| `Location`          | TEXT      | Country or region of the campaign                                          |
| `Language`          | TEXT      | Language used in the ad                                                    |
| `Clicks`            | INT       | Number of ad clicks                                                        |
| `Impressions`       | INT       | Number of times the ad was shown                                           |
| `Engagement_Score`  | INT       | Composite score measuring user interaction                                 |
| `Customer_Segment`  | TEXT      | Customer type (e.g., New, Loyal, Returning)                                |
| `Date`              | TEXT      | Date of campaign activity                                                  |
| `Company`           | TEXT      | Brand or advertiser name                                                   |

---

## 🎯 Key Objectives

- Clean and format acquisition cost values for numeric analysis
- Segment performance by customer type, age, language, and geography
- Visualize ROI and CPA across channels and goals
- Uncover trends over time (monthly clicks, weekday activity)

---

## 📊 Potential Visualizations

- Campaign count by channel and goal
- CTR & Conversion Rate by platform and age group
- CPA vs ROI by campaign goal
- Engagement by customer segment
- Time-series line charts for clicks and conversions

---

## 🛠 Tools Used

- **SQL:** For data cleaning and preprocessing (acquisition cost formatting, date parsing, etc.)
- **Python (pandas, matplotlib/seaborn):** Optional for EDA and visualization
- **Tableau / Power BI:** For dashboard creation
- **GitHub:** Version control and project sharing

---

## 📦 Project Structure (Suggested)

```
social-media-ads-analysis/
│
├── data/
│   ├── raw/
│   │   └── Social_Media_Advertising.csv
│   └── cleaned/
│
├── sql/
│   └── cleaning_scripts.sql
│
├── notebooks/
│   └── exploratory_analysis.ipynb
│
├── visualizations/
│   └── final_dashboard.pdf
│
├── README.md
└── requirements.txt
```

---

## 📣 Author Notes

This project was created to demonstrate data cleaning, campaign analysis, and insight extraction from real-world marketing datasets. It is a strong candidate for a **portfolio project** to showcase skills in data handling, visualization, and business insight generation.
