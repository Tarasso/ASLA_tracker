# README

## Introduction ##

The American Society of Landscape Architects (ASLA) is the primary student organization of the relatively small department of Landscape Architecture and Urban Planning and this web application is their tool to help manage members, interface with alumni and donors, track attendance, and coordinate registration for their major events like the career fair, workshop, and the professional advisory board (PAB).

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2
* Rails - 6.1.4.4
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/Tarasso/ASLA_tracker.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec ./spec`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd ASLA_tracker`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

There are currently four envrionment variables that need to be configured. They can be set manually in the `config/environments/development.rb` for local development, but for other environments, one should configure these variables in Heroku deployment config variables

* `GOOGLE_OAUTH_CLIENT_ID`
* `GOOGLE_OAUTH_CLIENT_SECRET`
* `AMAZON_ACCESS_KEY_ID`
* `AMAZON_SECRET_ACCESS_KEY`

A more in depth guide for user authentication can be found in [this](https://medium.com/craft-academy/encrypted-credentials-in-ruby-on-rails-9db1f36d8570) Medium article for setting the Google authentication. The AWS key and secret are linked to an AWS S3 bucket to store dyanmically updated pictures. This information can be accessed directly through the AWS portal.

## Deployment ##

A Heroku pipeline is currently connected to this Github repository and configured such that updates are continually deployed when changes are detected. The `procfile` gives instructions to Heroku on how to configure the deployment such as creating, migrating, and seeding the database. Additionally, all envrionmental variables listed in the previous section must be added manually to the Heroku app in Settings>Config Vars.

Below are more detailed instructions for how to set this up:

Follow these instructions to create a Heroku account: https://signup.heroku.com/

From the heroku dashboard select `New` -> `Create New Pipline`
 
Name the pipeline, and link the respective git repo to the pipline
 
Our application does not need any extra options, so select `Enable Review Apps` right away
 
Click `New app` under review apps, and link your test branch from your repo
 
Under staging app, select `Create new app` and link your main branch from your repo

To add enviornment variables to enable google oauth2 functionality, head over to the settings tab on the pipeline dashboard
 
Scroll down until `Reveal config vars`
 
Add both your Google client id and your secret id, with fields `GOOGLE_OAUTH_CLIENT_ID` and `GOOGLE_OAUTH_CLIENT_SECRET` respectively

Also, add both your AWS bucket key and secret, with fields `AMAZON_ACCESS_KEY_ID` and `AMAZON_SECRET_ACCESS_KEY` respectively
 
Now once your pipeline has built the apps, select `Open app` to open the app
 
With the staging app, if you would like to move the app to production, click the two up and down arrows and select `Move to production`
 
And now your application is setup and in production mode!


## CI/CD ##

For continuous development, we set up Heroku to automatically deploy our apps when their respective github branches are updated. Now that the app has been fully deployed however, only the production app is available for use:
* [Production Envrionment](https://tamu-asla.herokuapp.com/)

For continuous integration, we set up a Github action to run our specs, security checks, linter, etc. after every push or pull-request. This allows us to automatically ensure that our code is working as intended. The following are ran on every deployment, push, and PR:
* Rspec tests
  * executes all unit and integration tests located in `./spec`
* Brakeman
  * security testing tool 
* Rubocop
  * code linter that can be configured in `./rubocop.yml`

## Support ##

Admins looking for support should first look at the application help page which can be found at `/pages/help`.
Users looking for help should reference the FAQ page and seek out assistance from the ASLA officers.

## Credit ##

Thomas Ochman's [guide](https://medium.com/craft-academy/encrypted-credentials-in-ruby-on-rails-9db1f36d8570) for Google Auth for Rails

Referenced Justin Cypret's blog post for validating and normalizing phone numbers: [Link](https://justincypret.com/blog/validating-normalizing-and-formatting-phone-numbers-in-rails)


