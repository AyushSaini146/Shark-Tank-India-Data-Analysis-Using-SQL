
---execute the database
USE shark_project 
SELECT * FROM Data

---Q1] Total episodes telecasted in shark tank india.
SELECT COUNT(DISTINCT EpisodeNo) AS total_episodes
FROM Data

---Q2] Show the total number of brands came on show.
SELECT COUNT(DISTINCT Brand) AS total_brands
FROM Data

---Q3] Show pitches which actually turned into deal:- Name of Brand  and Equity taken.
SELECT Brand, [Equity Taken %],CASE WHEN  [Equity Taken %]>0 THEN  1 ELSE 0 END AS Deal_status
FROM Data
ORDER BY [Equity Taken %] DESC

---Q4] Total number of male and female participants?
SELECT SUM(Male) AS total_Males,SUM(Female)AS total_females
FROM Data

---Q5] Show Gender ratio of participants
SELECT SUM(Female)/SUM(male)
FROM Data

---Q6] Total amount invested by sharks?
SELECT SUM([Amount Invested lakhs]) AS Total_investment_lakhs
FROM Data

---Q7] Find Average equity taken.
SELECT AVG([Equity Taken %]) AS average_equity
FROM Data
WHERE [Equity Taken %]>0

---Q8] Show Highest amount taking deal.
SELECT top 1 (Brand), MAX([Amount invested Lakhs]) AS Investment_In_Lakhs
FROM Data
GROUP BY Brand   

---Q9] Find startups which have atleast one female entrepreneur

SELECT SUM(a.female_count) AS startups_having_women
FROM (SELECT Female,CASE WHEN Female>0 THEN 1 ELSE 0 END AS female_count
FROM Data) a

---Q10] Find Average amount invested per deal.
SELECT AVG([Amount invested Lakhs]) Average_amount_invested
FROM(SELECT * 
FROM Data
WHERE Deal!='[NO Deal]') a

---Q11] From Which Age group highest contestants came in Show?
SELECT [Avg age],count([Avg age]) AS No_of_contestants_came
FROM Data
GROUP BY [Avg age]
ORDER BY  No_of_contestants_came DESC

---Q12] From which sector highest pitches came in show?
SELECT Sector,COUNT(Sector) AS No_of_pitches
FROM Data
GROUP BY Sector
ORDER BY No_of_pitches DESC

---Q13] Show number of Contestants location-wise.
SELECT location,COUNT(location) AS No_of_contestants
FROM Data
GROUP BY location
ORDER BY No_of_contestants DESC

---Q14] Show Partnership Deals.
SELECT partners,COUNT(partners) As partnership_deals
FROM Data
WHERE partners!='-'
GROUP BY partners
ORDER BY partnership_deals DESC

---Q15] Select highest investment taking startups from each sector.
SELECT a.* 
FROM (SELECT Brand,sector,[amount invested lakhs],RANK() OVER(PARTITION BY sector
ORDER BY [amount invested lakhs] DESC) rank_
FROM Data) a
WHERE a.rank_=1        









   