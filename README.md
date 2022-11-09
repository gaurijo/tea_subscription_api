# README

## Overview
This is a Rails API for a Tea Subscription Service that has built several endpoints for Customers and their Tea Subscriptions.
## :tea: Technologies Used:
[<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>](https://rubyonrails.org/) <br>
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)<br>
[<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://www.postman.com/product/what-is-postman/)<br>
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
## :tea: Database Schema:
[![Screen-Shot-2022-11-09-at-1-03-55-PM.png](https://i.postimg.cc/7ZBf7R54/Screen-Shot-2022-11-09-at-1-03-55-PM.png)](https://postimg.cc/NKHsvp8C)

## :tea: API Endpoints:
All SUBSCRIPTIONS for a single CUSTOMER: 
<br>
<br>
[![Screen-Shot-2022-11-09-at-1-22-33-PM.png](https://i.postimg.cc/PrSwzJ70/Screen-Shot-2022-11-09-at-1-22-33-PM.png)](https://postimg.cc/cr8Cdx0c)
<br><br>
CREATE SUBSCRIPTION for a single CUSTOMER: 
<br>
<br>
[![Screen-Shot-2022-11-09-at-1-24-25-PM.png](https://i.postimg.cc/6589gQ3k/Screen-Shot-2022-11-09-at-1-24-25-PM.png)](https://postimg.cc/qzdVC42w)
<br><br>
UPDATE(cancel) SUBSCRIPTION for a single CUSTOMER: <br>
<br>
[![Screen-Shot-2022-11-09-at-1-25-42-PM.png](https://i.postimg.cc/d3zgzwNF/Screen-Shot-2022-11-09-at-1-25-42-PM.png)](https://postimg.cc/n9GdmbtS)<br>

## :tea: Local Setup

1. Fork and clone the repo to your local machine 
2. Install gems and dependencies: `bundle install`
3. Set up database: `rails db:{drop,create,migrate,seed}`
6. Run test suite: `bundle exec rspec`
7. Start up your local server: `rails s`
8. Visualize the endpoints in Postman <br>
GET `http://localhost:3000/api/v1/customers/{{customer_id}}/subscriptions` <br> POST `http://localhost:3000/api/v1/subscriptions` <br> PATCH `http://localhost:3000/api/v1/subscriptions/remove?id={{id}}`  
