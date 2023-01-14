{{ config {
    materialized = "table"
}}}

with customers as (
    select * from {{ref('Customers')}}
)

with products as (
    select * from {{ref('Products')}}
)

with regions as (
    select * from {{ref('Regions')}}
)

with orders as (
    select * from {{ref('orders')}}
)

With Sales_andCustomers as ( 
  SELECT * FROM orders  so
  inner join customers C
  ON so.Customer_Name_Index = C.Customer_Index
  inner join products P
  ON so.Product_Description_Index = P.Index
  inner join regions R
  ON so.Delivery_Region_Index = R.Index
)

SELECT * FROM Sales_andCustomers;
