# README

![Job Board Image](/public/stickers1.jpg)

# Job Board Application

## Overview

A job board application is a dynamic platform designed to bridge the gap between employers and potential employees. It facilitates the posting of job vacancies by companies and the submission of applications by job seekers, creating a comprehensive marketplace for talent acquisition and career advancement.

## Key Features

- **Employer and Job Seeker Interface:** Offers a dual interface catering to the needs of both hiring companies and individuals seeking employment.
- **Advanced Search Functionality:** Enables users to filter job listings based on various criteria to find matches that suit their qualifications and career goals.

## Data Models

The application is built on a robust data model that includes:

- **User**: Created automatically by Devise for authentication.
- **Accounts**: Represents job seekers' profiles.
- **Companies**: Allows employers to create profiles and post job vacancies.
- **Jobs**: Listings created by companies looking for candidates.
- **Applications**: Submissions by users applying for jobs.

## Relationships

- A **User** can create one **Company** and one **Account**.
- A **Company** can post multiple **Jobs**.
- An **Account** can submit multiple **Applications**.
- **Job Applications** are linked directly to **Jobs**, incorporating both `company_id` and `account_id` to connect employers with potential candidates.

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

