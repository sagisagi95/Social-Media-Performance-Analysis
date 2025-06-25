
# 📊 Social Media Advertising Campaign Analysis

## 📝 Project Summary

This project analyzes a rich dataset of social media advertising campaigns collected across platforms like Facebook, Instagram, Twitter, and Pinterest. It aims to evaluate the effectiveness of advertising campaigns based on metrics such as impressions, clicks, engagement, conversion rate, ROI, and more.

This project focuses exclusively on the Cozy Corner (Home category) to ensure consistency and analytical relevance.

The analysis covers:
- Campaign performance by channel and goal
- Audience engagement by age, gender, and platforms
- CTR, CR, ROI and CPA evaluation across platforms
- Evaluation of advertising effectiveness

---

## 📁 Dataset Overview

- **Name:** Social Media Advertising Dataset
- **Link:** https://www.kaggle.com/datasets/jsonk11/social-media-advertising-dataset/data
- **Scope:** Cross-channel campaign data from multiple social platforms 
- **Format:** Cleaned via SQL, visualized via Tableau

## Table Schema

| Column Name         | Data Type | Description                                                                |
|---------------------|-----------|----------------------------------------------------------------------------|
| `Campaign_ID`       | INT       | Unique identifier for each ad campaign                                     |
| `Target_Audience`   | TEXT      | Age group or gender - demographic the ad targeted                          |
| `Campaign_Goal`     | TEXT      | Objective of the campaign (e.g.  Brand Awareness, Increase Sales)          |
| `Duration`          | TEXT      | Duration of the campaign (e.g.  '7 days', '14 days')                       |
| `Channel_Used`      | TEXT      | Social Media Platform used (Facebook, Instagram, etc.)                     |
| `Conversion_Rate`   | FLOAT     | Conversion rate = Num of conversions / Clicks                              |
| `Acquisition_Cost`  | TEXT      | Total cost spending to acquire conversions                                 |
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

- Clean and format data for exploratory & diagnostic analysis
- Create a performance analytical dashboard

---

## Key insights
**1. Channel Performance**
- Instagram and Twitter are top performers: low CPA + high ROI
- Pinterest underperformed across all metrics (lowest CTR, Conversion Rate, and ROI, with the highest cost) → inefficient channel
- Facebook is volume-heavy, but less efficient than expected (moderate ROI)
→ consider reallocating budget to high-performing platforms: Instagram, Twitter

**2. Campaign Goals**
- Average CTRs across all goals are very close, suggesting creative/goal type has little impact on CTR
- Campaigns focused on Brand Awareness and Increase Sales had low Conversion Rate, while trategic goals like Product Launch and Market Expansion converted better despite lower CTR → high conversion quality

**3. Audience Analysis**
- All age groups respond similarly in volume of clicks (35-44 had the highest, followed by 18-24), but Instagram drives the most meaningful engagement with higher engagement score — strong choice for Gen Z and Millennials
→ Suggests that better segmentation / audience targeting may improve performance

**4. Seasonal pattern:**
- Click activity peaks mid-week (Wed-Thu) and weekend (Sat-Sun) → User engagement is strongest 
- There may be a seasonal lift in spring, early summer and the end of year, could possibly considered for seasonal promotions

**5. Advertising Effectiveness**
- Channels like Twitter and Instagram drive superior ROAS and revenue
- Pinterest is not cost-effective → suggests reallocating budget
- Top 3 high-revenue cities: Los Angeles, Miami and Las Vegas

---
