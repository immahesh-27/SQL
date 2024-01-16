-- 1 What are the details of all cars purchased in the year 2022?
SELECT C.Car_id
	,C.make
	,C.Type
	,C.style
	,C.cost_$
	,S.purchase_date
FROM cars C
INNER JOIN sales S using (Car_id)
WHERE year(purchase_date) = 2022;

-- 2 What is the total number of cars sold by each salesperson?

SELECT SP.name AS salesman_name
	,count(S.car_id) AS numbers_of_cars_sold
FROM salespersons SP
INNER JOIN sales S USING (salesman_id)
GROUP BY SP.name;

-- 3 What is the total revenue generated by each salesperson?

SELECT s.salesman_Id,
	sp.name,
	sum(C.cost_$ * s.car_id) AS Revenue
FROM cars C
INNER JOIN sales S USING (Car_id)
INNER JOIN salespersons SP USING (salesman_id)
GROUP BY s.salesman_Id,sp.name;

-- 4  What are the details of the cars sold by each salesperson?

SELECT s.salesman_Id
	,sp.NAME
	,C.Car_id
	,C.make
	,C.Type
	,C.style
	,C.cost_$
FROM cars C
INNER JOIN sales S using (Car_id)
INNER JOIN salespersons SP using (salesman_id);



-- 5  What is the total revenue generated by each car type?

SELECT C.type,
	sum(C.cost_$ * s.car_id) AS Revenue
FROM cars C
INNER JOIN sales S using (Car_id)
GROUP BY C.type
ORDER BY revenue DESC;

--  6 What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?

 SELECT s.salesman_Id
	,sp.NAME
	,s.purchase_Date
	,C.Car_id
	,C.make
	,C.Type
	,C.style
	,C.cost_$
FROM cars C
INNER JOIN sales S using (Car_id)
INNER JOIN salespersons SP using (salesman_id)
WHERE sp.NAME = 'Emily Wong'
	AND year(purchase_date) = 2021;

-- 7 What is the total revenue generated by the sales of hatchback cars?

SELECT c.car_id
	,c.make
	,c.style
	,sum(C.cost_$ * s.car_id) AS revenue
FROM cars C
INNER JOIN sales S using (Car_id)
WHERE style = "hatchback"
GROUP BY c.car_id ,c.make;

-- 8 . What is the total revenue generated by the sales of SUV cars in the year 2022?

SELECT c.car_id
	,c.make
	,c.style
	,s.purchase_Date
	,sum(C.cost_$ * s.car_id) AS Revenue
FROM cars C
INNER JOIN sales S using (Car_id)
WHERE c.style = 'SUV'
	AND year(purchase_date) = 2022
GROUP BY c.car_id,c.make,s.purchase_Date;

-- 9 What is the name and city of the salesperson who sold the most number of cars in the year 2023?

SELECT SP.name
	,SP.city
	,COUNT(S.car_id) AS sold_cars
FROM salespersons SP
INNER JOIN sales S using (salesman_id)
WHERE year(S.purchase_date) = 2023
GROUP BY SP.name,SP.city
ORDER BY sold_cars DESC limit 1;

-- 10 What is the name and age of the salesperson who generated the highest revenue in the year 2022?

SELECT SP.name
	,SP.age
	,sum(C.cost_$ * s.car_id) AS Revenue  
FROM salespersons SP
INNER JOIN sales S using (salesman_id)
INNER JOIN cars C using (Car_id)
WHERE year(S.purchase_date) = 2022
GROUP BY SP.name
	,SP.age
ORDER BY revenue DESC 
LIMIT 1;








