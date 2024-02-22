# README

![Job Board Image](/public/stickers1.jpeg)

# Job Board Application

## Overview
    A job board application is a digital platform that connects employers with potential employees by allowing companies to post job vacancies and job seekers to submit their applications. It serves as a marketplace where employers can find candidates with the specific skills and experience they need, and job seekers can find opportunities that match their qualifications and career aspirations.
    This job application platform has four data models plus User that was created automatically by Devise. 
    There are Accounts, Companies, Jobs and Applications models. 
    User can create one Company and one Account. 
    Company can create multiple jobs. 
    Account can create multiple applications. 
    Job Application can be created from the Job page, the route for it will involve Account, so the Job application record will include both the company_id and the account_id.

## Features
- User authentication (sign up, sign in, sign out)
- Job posting by employers
- Job search
- Application by candidates

## Technology Stack
- **Ruby on Rails**: Web application framework
- **SQLite**: Database
- **Devise**: Authentication
- **Bootstrap**: Front-end framework
- **Ransack**: Search functionality

## Getting Started
Instructions on setting up the project locally:
1. Clone the repository
2. Install dependencies: `bundle install`
3. Setup database: `rails db:create db:migrate db:seed`
4. Start the server: `rails server`

## How to Use
- Sign up and log in to access personalized features.
- Navigate using the menu for jobs, companies, and applications.
- Use the search feature to filter jobs based on criteria.
- Apply for jobs through the application form provided.
- Employers can post and manage job listings.

