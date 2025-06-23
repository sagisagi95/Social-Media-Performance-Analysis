/*
Dataset Description:
This dataset is a comprehensive collection of data related to various social media advertising campaigns. It includes information such as ad impressions, clicks, spend, demographic targeting, and conversion rates. The dataset encompasses multiple social media platforms such as Facebook, Instagram, Pinterest, and Twitter, providing a diverse range of advertising campaign data.
In this project, only data filtered by a specific company (e.g Cozy Corners, "Home" category) would be gathered for a consistent analysis.

Skills used: Converting Data Types, CTE's, Windows Functions, Aggregate Functions

*/

-- Check for missing values. Replace or remove rows with missing data based on business logic

Select SUM(CASE 
		When Campaign_ID IS NULL Then 1 
        When Target_Audience IS NULL Then 1 
        When Campaign_Goal IS NULL Then 1 
		When Duration IS NULL Then 1 
		When Channel_Used IS NULL Then 1 
		When Conversion_Rate IS NULL Then 1 
		When Acquisition_Cost IS NULL Then 1 
		When ROI IS NULL Then 1 
		When Location IS NULL Then 1
        When Language IS NULL Then 1
        When Clicks IS NULL Then 1
        When Impressions IS NULL Then 1
        When Engagement_Score IS NULL Then 1
        When Customer_Segment IS NULL Then 1
        When Date IS NULL Then 1
        When Company IS NULL Then 1
        Else 0 End)
From SocialMediaAds.social_media_advertising;

-- Remove duplicate rows

With cte as (
	Select *, ROW_NUMBER() OVER (Partition by Campaign_ID, Target_Audience, Campaign_Goal, Channel_Used, Date, Company Order by Campaign_ID) as rn
	From SocialMediaAds.social_media_advertising)
Delete From cte
Where rn > 1;

-- Separate the 'target_audience' column into 'gender' and 'age_range' columns

ALTER TABLE SocialMediaAds.social_media_advertising
ADD Gender TEXT;

UPDATE SocialMediaAds.social_media_advertising
SET Gender =
	CASE When Target_Audience LIKE 'Men%' Then 'Male'
		When Target_Audience LIKE 'Women%' Then 'Female'
		Else 'Both'
		End;

ALTER TABLE SocialMediaAds.social_media_advertising
ADD Age_Range TEXT;

UPDATE SocialMediaAds.social_media_advertising
SET Age_Range =
	CASE When Target_Audience LIKE 'Men%' Then RIGHT(Target_Audience,5)
		When Target_Audience LIKE 'Women%' Then RIGHT(Target_Audience,5)
		When Target_Audience LIKE '%All ages%' Then 'All ages'
        Else 'unknown'
		End;
        
-- Convert Date, ROI and CPA columns to the proper datatype

ALTER TABLE SocialMediaAds.social_media_advertising
CHANGE COLUMN `Date` `Date` DATE NULL DEFAULT NULL ;

UPDATE SocialMediaAds.social_media_advertising
SET ROI = ROUND(ROI,2);

UPDATE SocialMediaAds.social_media_advertising
SET CPA = REPLACE(CPA, '$', '');

ALTER TABLE SocialMediaAds.social_media_advertising
CHANGE COLUMN `CPA` `CPA` DOUBLE NULL DEFAULT NULL ;

-- Check and remove outliers

Select MIN(Conversion_Rate), MAX(Conversion_Rate), AVG(Conversion_Rate)
From SocialMediaAds.social_media_advertising;

Select MIN(CPA), MAX(CPA), AVG(CPA)
From SocialMediaAds.social_media_advertising;

Select MIN(ROI), MAX(ROI), AVG(ROI)
From SocialMediaAds.social_media_advertising;

Select MIN(Engagement_Score), MAX(Engagement_Score), AVG(Engagement_Score)
From SocialMediaAds.social_media_advertising;

-- Check outliers using standard deviation 

Select *
From SocialMediaAds.social_media_advertising
Where Conversion_Rate > (Select AVG(Conversion_Rate) + 3 * STDDEV(Conversion_Rate) From SocialMediaAds.social_media_advertising)
OR Conversion_Rate < (Select AVG(Conversion_Rate) - 3 * STDDEV(Conversion_Rate) From SocialMediaAds.social_media_advertising);

Select *
From SocialMediaAds.social_media_advertising
Where ROI > (Select AVG(ROI) + 3 * STDDEV(ROI) From SocialMediaAds.social_media_advertising)
OR ROI < (Select AVG(ROI) - 3 * STDDEV(ROI) From SocialMediaAds.social_media_advertising);

Select *
From SocialMediaAds.social_media_advertising
Where Engagement_Score > (Select AVG(Engagement_Score) + 3 * STDDEV(Engagement_Score) From SocialMediaAds.social_media_advertising)
OR Engagement_Score < (Select AVG(Engagement_Score) - 3 * STDDEV(Engagement_Score) From SocialMediaAds.social_media_advertising);

-- Check outliers using Interquartile Range (IQR)

WITH RankedClicks AS (
    Select Clicks,
           ROW_NUMBER() OVER (ORDER BY Clicks) AS row_num,
           COUNT(*) OVER () AS total_rows
    From SocialMediaAds.social_media_advertising
),
Percentiles AS (
    Select 
        (Select Clicks From RankedClicks Where row_num = FLOOR(total_rows * 0.25)) AS Q1,
        (Select Clicks From RankedClicks Where row_num = FLOOR(total_rows * 0.75)) AS Q3
    From RankedClicks
    Limit 1  -- Ensures only one row is returned
)
Select Clicks
From SocialMediaAds.social_media_advertising
Where Clicks < (Select Q1 - 1.5 * (Q3-Q1) From Percentiles) 
   OR Clicks > (Select Q3 + 1.5 * (Q3-Q1) From Percentiles); -- IQR = Q3-Q1

-- Add calculated fields if necessary. Filter out unnecessary data

ALTER TABLE SocialMediaAds.social_media_advertising
ADD CTR double;

UPDATE SocialMediaAds.social_media_advertising
SET CTR = ROUND(Clicks/Impressions*100,2);

ALTER TABLE SocialMediaAds.social_media_advertising
DROP COLUMN Target_Audience;

ALTER TABLE SocialMediaAds.social_media_advertising
DROP COLUMN Language;

ALTER TABLE SocialMediaAds.social_media_advertising
DROP COLUMN Customer_Segment;

-- Create a new table filtering by the targeted company

CREATE TABLE SocialMediaAds.social_media_CozyCorners (
    Campaign_ID INT,
    Campaign_Goal VARCHAR(255),
    Duration VARCHAR(50),
    Channel_Used VARCHAR(50),
    Conversion_Rate DOUBLE,
    CPA DOUBLE,
    ROI DOUBLE,
    Location VARCHAR(50),
    Clicks INT,
    Impressions INT,
    Engagement_Score INT,
    Date DATE,
    Company VARCHAR(255),
    Gender VARCHAR(10),
    Age_Range VARCHAR(10),
    CTR DOUBLE
);

INSERT INTO SocialMediaAds.social_media_CozyCorners
Select *
From SocialMediaAds.social_media_advertising
Where Company = 'Cozy Corners';

-- Validate the dataset to ensure everything is consistent

Select *
From SocialMediaAds.social_media_CozyCorners;
