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
Upon the primary inspection of the provided data, it became apparent that a significant amount of users displayed one or both of the following traits: there existed users who chose not to create an account, but used our services to purchase an item, and there were users who chose to give reviews to items before they had arrived; in the former case, users who used our services but decided not to create an account were given a temporary user identification that stores purchase information to allow the user the opportunity to streamline the process of account creation should they choose to create an account in the future. The latter of these issues is problematic as reviews can impact the impression on users browsing the item, and change its purchase rate; as such, a SQL query using CASE statement was created to flag users reviewing products before obtaining them.

A majority of the analysis performed during the course of this assignment was primarily conducted on MySQL. The SQL queries used were created using subqueries, CTE's, RANK(), CASE statements, and aggregate functions. The results of queries were typically stored as csv files, which were used in conjunction with Tableau to further analyze the attained data. In cases when aggregate functions were used to obtain singular values (e.g. an average), the result was written as a comment at the bottom of the mysql file.


## User Funnel Journey

### 

### Time Between User Signup and Their First Event

In this dataset, users have the possibility of performing one of the following actions: view, purchase, wishlist, and cart. Typically, an individual will perform approximately 8 actions throughout the lifecycle of their account. On average, it was found that if users created an account before taking any action, it took about 230 days for them to perform any action. If a user chose to use our site before creating an account, it took them about 226 days to create one.

The users who chose to begin using our site spend more than 250 days before taking any action:

| User Action | Average Time for Action (days)|
|---|---|
|purchase|272.81|
|view|272.81|
|cart|267.10|
|wishlist|263.78|


Users who viewed a product before buying it spent about 140 days before purchasing it.


## User Engagement and Activity

## Revenue Metrics

## Product Performance

## Acknowledgements
