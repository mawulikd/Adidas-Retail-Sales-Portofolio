CREATE DATABASE stores

  --Overview of Sales Table--
SELECT *
FROM sales
   --Overview of Products Table--
SELECT *
FROM products
  --Overview of Inventory Table--
SELECT *
FROM Inventory


	 --Query for Analysis and Viz--	  
SELECT 
       Cast(sales.Date as date) Sale_date,
       products.productid,
       products.productname,
	   products.supplier,
	   inventory.storename,
	   inventory.neighborhood,
	   ROUND(sum(sales.Quantity+inventory.QuantityAvailable),2) Total_Quantity,
	   ROUND(sum(sales.Quantity),2) Quantity_Sold, 
	   ROUND(sum(inventory.QuantityAvailable),2) Quantity_Unsold,
	   ROUND(avg(sales.UnitPrice),2) Price,
	   ROUND(sum((sales.Quantity+inventory.QuantityAvailable)*products.ProductCost),2) Cost_of_goods_purchased,
	   ROUND(sum(sales.Quantity*Sales.UnitPrice),2) Revenue,
	   ROUND(sum(sales.Quantity*Sales.UnitPrice)-sum((sales.Quantity+inventory.QuantityAvailable)*products.ProductCost),2) Profit,
	   ROUND(sum((inventory.QuantityAvailable)*products.ProductCost),2) inventory_revenue
FROM sales
JOIN products
ON products.productid=sales.productid
JOIN Inventory
ON products.ProductId=Inventory.Productid
GROUP BY Cast(sales.Date as date),
         products.productid,
         products.productname,
	     products.supplier,
	     sales.Quantity,
	     inventory.StoreName,
		 inventory.neighborhood
ORDER BY Profit DESC





