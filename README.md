# Funnel-Analysis-E-Commerce

## Table of Contents
- [Executive Summary](#Executive-Summary)
- [Project Background](#Project-Background)
- [Methods](#Methods)
- [User Funnel Journey](#User-Funnel-Journey)
- [User Engagement and Activity](#User-Engagement-and-Activity)
- [Revenue Metrics](#Revenue-Metrics)
- [Product Performance](#Product-Performance)
- [Acknowledgements](#Acknowledgements)


## Executive Summary
The conversion rate of users who choose to signup to this company for a purchase has been low; with approximately 70% of users choosing not to make a purchase, my goal became finding out potential problems in the user experience and offer potential solutions. Using SQL, Tableau, and , I created SQL queries to obtain useful metrics about the user journey through our platform while also using SQL queries fed into Tableau to to identify key characteristics about user spending habits. Having tested the user experience, I suggest the following recommedations to improve the conversion rate and profitability:



## Project Background

## Methods
Upon the primary inspection of the provided data, it became apparent that a significant amount of users displayed one or both of the following traits: there existed users who chose not to create an account, but used our services to purchase an item, and there were users who chose to give reviews to items before they had arrived. Although realistically problematic, in the former case, this can be explained by assuming that users who used the services but decided not to create an account were given a temporary user identification that stores purchase information to allow the user the opportunity to streamline the process of account creation should they choose to create an account in the future.  The latter of the issues mentioned is problematic as reviews can impact the impression on users browsing the item, and change its purchase rate. To address both of these issues, separate SQL queries using CASE statements were created to flag users who displayed the mentioned traits, which were also capable of counting the amount of flagged users.

Other issues arose with the quality of the data. For instance, a section of the data included user events, or the actions that a user was capable of performing: view, purchase, wishlist, and cart. The typical path for any individual who seeks to purchase an item is either view to cart to purchase, or view to purchase. Unfortunately, the way this dataset was simulated was such that the order of the events was randomized as was the timeline of events, and thus certain points of the funnel returned no values, or returned unreasonably long lengths in time. Nevertheless, SQL queries exist to find the two mentioned paths and create a count for them, as well as time elapsed between key events as averages.

A couple of questions arose regarding the amount of individuals within the dataset who made an account but never purchased an item. For these cases, a SQL query using EXCEPT was created to retrieve the pertinent list of individuals.

Still, a SQL query was created to flag the users and give the individual the opportunity to count the amount of individuals who used the services before creating an account. as such, a SQL query using CASE statement was created to flag users reviewing products before obtaining them.

A user may not always have the necessary funds required to spend on any products. Such a user may instead choose to store said product in the "wishlist" category.In order to determine if users deem the price of our products as being outside of their budget, I counted the amount of items that were either purchased or wishlisted; in cases where there was not enough data to conclusively determine if a product was more purchased than wishlisted, a separate category (*Marginal Difference*) was given for these products.

A majority of the analysis performed during the course of this assignment was primarily conducted on MySQL. The SQL queries used were created using subqueries, CTE's, RANK(), CASE statements, and aggregate functions. The results of queries were typically stored as csv files, which were used in conjunction with Tableau to further analyze the attained data. In cases when aggregate functions were used to obtain singular values (e.g. an average), the result was written as a comment at the bottom of the mysql file.


## User Funnel Journey

### 

### Time Between User Signup and Their First Event

 On average, it was found that if a user chose to use our site before creating an account, it took them about 226 days to create one. The users who chose to begin using our site spend more than 250 days before taking any action:

| User Action | Average Time for Action (days)|
|---|---|
|purchase|272.81|
|view|272.81|
|cart|267.10|
|wishlist|263.78|


Users who viewed a product before buying it spent about 140 days before purchasing it. If a product was purchased and the order was either kept or returned, the average user spent about 220 days before leaving a review, with the least amount of time being reviewing a product the day of.

## User Engagement and Activity

During my analysis, I found that 7,000 active users were found to have created an account, but chose never to make a purchase. 

In total, of all products that were succesfully purchased or returned, 65.54% of products received no review.In this dataset, users have the possibility of performing one of the following actions: view, purchase, wishlist, and cart. Typically, an individual will perform approximately 8 actions throughout the lifecycle of their account.

As mentioned in the Methods section, the data simulation assigned randomized dates and the order of events. The SQL query used to determine the path taken by individuals who completeed a purchase found that only 3 cases existed where viewing a product resulted in a succesful purchase, while about 59,000 other purchases followed an other path that did not conclude in a purchase.




## Revenue Metrics
The average order value was found to be $595.93. When separated by category, a user will spend the approximate amounts per order on average:

|category|Average Spent Per Category (USD)|
|---|---|
|Pet Supplies|82.60|
|Beauty|134.28|
|Automotive|644.18|
|Books|70.31|
|Electronics|1285.76|
|Toys|90.7|
|Home & Kitchen|292.38|
|Groceries|25.17|
|Clothing|171.23|
|Sports|258.38|

The following products were bought the most often:
![image_files/top_10_count.png](image_files/top_10_count.png)

From our catalogue of products, 15.07% were purchased more than they were wishlisted, while 65.83% of products were wishlisted.
## Product Performance

## Acknowledgements
