CREATE table mynsales
(
BrandName	VARCHAR(50),
Category	VARCHAR(40),
Individual_category	VARCHAR(35),
category_by_Gender	VARCHAR(15),
OriginalPrice	BIGINT,
DiscountOffered	NUMERIC(5,2),
DiscountedPrice	BIGINT,
SizeOption	VARCHAR(550),
Ratings	FLOAT,
Reviews BIGINT
)

-------------1 BRAND WISE SALES COUNT
SELECT brandname, count(*) as totalsalescount FROM mynsales
GROUP BY brandname

-----------2.INDIVIDUAL CATEGORY WISE SALES COUNT--92

SELECT Individual_category, COUNT(*) AS totalsalescount FROM mynsales
GROUP BY 1

-----------3.  Category wise salescount --- There are total 8 type of categories available 


select category, COUNT(*) from mynsales
GROUP BY 1


--------4. sales categorised by "gender" -----"Women sales count"> "Men sales count"

SELECT category_by_Gender, count(*) as salescount FROM mynsales
group by 1


------5.HAVE Founded TOP 3 ItemsCategory according to gender 

SELECT * FROM
(
SELECT  category_by_Gender ,category, Count(*) AS totalpurchase,
RANK() OVER(PARTITION BY category_by_Gender ORDER BY Count(*) DESC) AS TopPurchase
FROM mynsales
GROUP BY 1,2
)
WHERE TopPurchase <=3

------6.HAVE CALCULATED MAX AND MIN. DISCOUNT OFFERED BY INDIVIDUAL_CATEGORY

SELECT Individual_category, MAX(DiscountOffered), MIN(DiscountOffered) FROM mynsales
GROUP BY 1


----7.Average Discount by Brand

SELECT BrandName, ROUND(AVG(DiscountOffered),2) AS AvgDiscount FROM mynsales
GROUP BY 1
ORDER BY AvgDiscount DESC

----8. Price vs Discount Relationship


SELECT 
CASE 
        WHEN originalprice < 1000 THEN 'Low Price'
        WHEN originalprice BETWEEN 1000 AND 3000 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_category,
    AVG(discountoffered) AS avg_discount
FROM mynsales
GROUP BY price_category


----9 Which Individual_category offers maximum variety of sizes

SELECT Individual_category,count(*) as totalsizecount FROM
(
select Individual_category ,UNNEST(string_to_array(sizeoption, ',')) as count
from mynsales)
group by 1


---10.Majority products fall in which discount range?


SELECT 
    CASE 
        WHEN DiscountOffered < 30 THEN 'Low'
        WHEN DiscountOffered BETWEEN 30 AND 60 THEN 'Medium'
        ELSE 'High'
    END AS discount_category,
    COUNT(*)
FROM mynsales
GROUP BY discount_category;

-----11.Top Brands by Revenue Potential

SELECT brandname,SUM(discountedprice) AS totalrev
FROM mynsales
GROUP BY 1
ORDER BY totalrev DESC

12.---Brand Which haven't done any kind of sell

SELECT * from 
(
SELECT brandname,SUM(discountedprice) AS totalrev
FROM mynsales
GROUP BY 1
ORDER BY totalrev
) WHERE totalrev =0

-----13.High Discount but Low Rating (Hidden Problem 🚨)
---Poor quality products being pushed via discounts

SELECT *
FROM mynsales
WHERE DiscountOffered > 70 AND ratings < 3;

14.----“This query segments products by price range and analyzes their distribution,
--average ratings, and discount strategy to understand how pricing impacts customer satisfaction and promotional behavior.”

SELECT 
CASE 
	WHEN originalprice <1700 THEN 'Low Price'
	WHEN originalprice between 1700 AND 7000 THEN 'Medium Price'
	ELSE 'High Price'
	END AS price_category,
COUNT(*)AS totalproducts,
AVG(Ratings) AS avgreatings,
AVG(DiscountOffered) as avgdisoffered
FROM mynsales
GROUP BY 1


15.---ranking top 3 brands in each category by total orders

SELECT * from
(
SELECT category,brandname ,COUNT(*) AS totalordercount,
DENSE_RANK() OVER(PARTITION BY Category ORDER BY COUNT(*) DESC) AS RANK FROM mynsales
GROUP BY 1,2
)t
WHERE RANK <=3



