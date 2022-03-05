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

There are currently two envrionment variables that need to be configured. They can be set manually in the `config/environments/development.rb`, but for other environments, one should configure these variables in Heroku deployment config variables

* `GOOGLE_OAUTH_CLIENT_ID`
* `GOOGLE_OAUTH_CLIENT_SECRET`

## Deployment ##

A Heroku pipeline is automatically connected to the Github repository and configured such that updates are continually deployed when changes are detected. The `procfile` gives instructions to Heroku on how to configure the deployment such as creating and migrating the database. Additionally, all envrionmental variables listed in the previous section must be added manually to the Heroku app in Settings>Config Vars. Currently there are two live deployments of this web app:
* [Testing Envrionment](https://asla-test-adyypybxlxi8pcvf4xj9.herokuapp.com/)
* [Production Envrionment](https://tamu-asla.herokuapp.com/)


## CI/CD ##

CI/CD is handled by Google Actions and executes a series of tests on every push and PR
* Rspec tests
  * executes all unit and integration tests located in `./spec`
* Brakeman
  * security testing tool 
* Rubocop
  * code linter that can be configured in `./rubocop.yml`

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.

## Credit ##

Referenced Justin Cypret's blog post for validating and normalizing phone numbers: [Link](https://justincypret.com/blog/validating-normalizing-and-formatting-phone-numbers-in-rails)


