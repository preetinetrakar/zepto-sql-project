drop table if exists zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountedPrice NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

--data exploration

select  count(*) from zepto;

--sample data

select *from zepto
limit 10;

-- null value

select * from zepto 
where name is NULL 
or
mrp  is NULL 
or
 category is NULL 
or
 discountedPrice  is NULL 
or
 availableQuantity is NULL 
or
 quantity is NULL 
or
 outOfStock is NULL 
or
  weightInGms is NULL 
or
 discountedSellingPrice is NULL 

-- different product category

select distinct category 
from zepto
order by category;


--product in stock and out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names  present multiple times
select name,count(sku_id) as "number of squs"
from zepto
group by name
having count(sku_id)>1
order by count (sku_id) desc;

--product with price =0
select * from zepto
where mrp=0 or discountedSellingPrice=0;

delete from zepto 
where mrp=0;

--convert paisa to mrp
update zepto
set mrp =mrp /100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto

--Find the top 10 best-value products based on the discount percentage

selct distinct name ,mrp,discountedSellingPrice 
from zepto
order by discountedPercent desc
limit 10;

--What are the products with high MRP but out of stock?

select distinct name,mrp
from zepto
where outOfStock = TRUE and mrp >300
order by mrp desc;

--Calculate Estimated Revenue for each category

select  category ,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;
--Find all products where MRP is greater than ₹500 and discount is less than 10%

SELECT DISTINCT name, mrp, discountedSellingPrice
FROM zepto
WHERE mrp > 500 AND discountedSellingPrice < mrp
ORDER BY mrp DESC;

--Find price per gram for products above 100g and sort by best value

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;


--Group products into categories like Low, Medium, Bulk
SELECT DISTINCT name, weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;


