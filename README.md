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
git clone https://github.com/afifzuraidi/bateriku-backend-take-home-assessment.git
cd bateriku-backend-take-home-assessment
```

2. Install Dependencies
Ensure you have the correct Ruby version installed. Use a version manager like rbenv or rvm if needed.
```
bundle install
```
OR
This will run step 2, 3, 5. Follow step 4 before running this command.
```
bin/setup
```

3. Database Setup
Ensure PostgreSQL is installed and running.
Update the config/database.yml file with your database credentials if necessary.
Run the following commands to set up the database:
```
rails db:create
rails db:migrate
```

4. Generate JWT Secret Key
JWTs need to be created with a secret key that is private. It shouldn’t be revealed to the public. When we receive a JWT from the client, we can verify it with that secret key stored on the server.
We can generate a secret by typing the following in the terminal:
```
bundle exec rails secret
```
We will then add it to the encrypted credentials file so it won’t be exposed:
```
#VSCode 
EDITOR='code --wait' rails credentials:edit
```
Then we add a new key: value in the encrypted .yml file.
```
devise_jwt_secret_key: (copy and paste the generated secret here)
```

5. Run the Application
Start the Rails server:
```
rails server
```
OR
```
bin/dev
```
The API will be accessible at http://localhost:3001.


## License

This project is open-source and available under the MIT License.
