
# 📊 Social Media Advertising Campaign Analysis

## 📝 Project Summary

This project analyzes a rich dataset of social media advertising campaigns collected across platforms like Facebook, Instagram, Twitter, and Pinterest. It aims to evaluate the effectiveness of advertising campaigns based on metrics such as impressions, clicks, engagement, conversion rate, ROI, and more.

*Note: This is a fictional database

The analysis covers:
- Campaign performance by channel and goal
- Audience engagement by age, gender, and platforms
- CTR, CR, ROI and CPA evaluation across platforms
- Time-based patterns in advertising effectiveness

---

## 📁 Dataset Overview

**Name:** Social Media Advertising Dataset  
**Scope:** Cross-channel campaign data from multiple social platforms  
**Format:** Cleaned via SQL, visualized via Tableau

## Table Schema

| Column Name         | Data Type | Description                                                                |
|---------------------|-----------|----------------------------------------------------------------------------|
| `Campaign_ID`       | INT       | Unique identifier for each ad campaign                                     |
| `Target_Audience`   | TEXT      | Age group or gender - demographic the ad targeted                          |
| `Campaign_Goal`     | TEXT      | Objective of the campaign (e.g.  Brand Awareness, Increase Sales)          |
| `Duration`          | TEXT      | Duration of the campaign (e.g.  '7 days', '14 days')                       |
| `Channel_Used`      | TEXT      | Social Media Platform used (Facebook, Instagram, etc.)                     |
| `Conversion_Rate`   | FLOAT     | Conversion rate = Num of conversions / Clicks                              |
| `Acquisition_Cost`  | TEXT      | Cost per acquisition                                                       |
| `ROI`               | FLOAT     | Return on investment                                                       |
| `Location`          | TEXT      | Location the ad targeted (states)                                          |
| `Language`          | TEXT      | Language used in the ad                                                    |
| `Clicks`            | INT       | Number of ad clicks                                                        |
| `Impressions`       | INT       | Number of times the ad was shown                                           |
| `Engagement_Score`  | INT       | Composite score measuring user interaction with the ad                     |
| `Customer_Segment`  | TEXT      | Category which brand/company is in (e.g. Health, Home, Technology, etc.)   |
| `Date`              | TEXT      | Date of campaign activity                                                  |
| `Company`           | TEXT      | Brand or company name                                                      |

---

## 🎯 Key Objectives

- Clean and format data for exploratory analysis
- Create a performance monitoring dashboard
- Uncover trends over time (monthly, weekly activity)

---
