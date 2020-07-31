# Budget Better

- Budgeting is important and super useful, but also repetitive and painful to do manually
- Budget Better takes the pain out of keeping track of your day-to-day spending, and gives you an overview of your savings, so you can see everything in one place!

React Native front-end Github + screenshots [here](https://github.com/samgorick/better-budgeting-frontend)

## Features

- Simple data visualizations track how much user has spent this month, how much they have remaining, and where their money has gone
- 1-click 'add budget' - automatically generated based on a user's income, and then fully customizable
- 2-step new user setup process to create a quality new user experience
- Savings tracks longer-term savings with value updated over time, and a full portfolio view

## Technologies

- Built with React Native front-end, for deployment on both iOS and Android. It was important for me to ensure the app was built on a mobile platform so users can check spending on the move
- AsyncStorage manages user credentials once logged in between sessions, and Bcrypt manages user authentication
- Lightweight Ruby on Rails API back-end with a SQL Postgres database

## Next steps

- Carrying over spending (over-spend, under-spend) from month to month
- Anonymized comparisons of spending by category
- Real-time stocks and shares data
