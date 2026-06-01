-- Total Orders
SELECT COUNT(*) AS total_orders
FROM fact_orders;

-- Top 5 Plants by Shipment Cost
SELECT plant_code,
       ROUND(SUM(total_shipment_cost),2) AS total_cost
FROM fact_orders
GROUP BY plant_code
ORDER BY total_cost DESC
LIMIT 5;

-- Carrier Freight Cost
SELECT carrier,
       ROUND(SUM(freight_cost),2) AS total_freight
FROM fact_orders
GROUP BY carrier
ORDER BY total_freight DESC;

-- Service Level Delay Analysis
SELECT service_level,
       COUNT(*) AS total_orders,
       SUM(late_delivery) AS late_orders,
       ROUND(AVG(late_delivery)*100,2) AS late_rate_pct
FROM fact_orders
GROUP BY service_level;

-- Plant Utilization
SELECT plant_code,
       ROUND(AVG(capacity_utilization_pct),2) AS avg_utilization
FROM fact_orders
GROUP BY plant_code
ORDER BY avg_utilization DESC;