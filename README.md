# README

## Bateriku Rails Boilerplate (API Only)

This repository contains a Rails boilerplate designed specifically for the Bateriku Take Home Test. The application is API-only, built with Ruby on Rails, and uses PostgreSQL as the database.

Technical Specifications

- Ruby Version: 3.3.5
- Rails Version: 8.0.1
- Database: PostgreSQL

## Setup Instructions
1. Clone the Repository

```
git clone <repository-url>
cd <repository-folder>
```

2. Install Dependencies
Ensure you have the correct Ruby version installed. Use a version manager like rbenv or rvm if needed.
```
bundle install
```

3. Database Setup
Ensure PostgreSQL is installed and running.
Update the config/database.yml file with your database credentials if necessary.
Run the following commands to set up the database:
```
rails db:create
rails db:migrate
```

4. Run the Application
Start the Rails server:
```
rails server
```
The API will be accessible at http://localhost:3000.


## License

This project is open-source and available under the MIT License.
