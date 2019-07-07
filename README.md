# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

  ruby-2.4.6

* System dependencies

  gem 'figaro'
  gem 'mush'

* Configuration

  just download the project and run bundle

* Database creation

  postgresql

* Database initialization

  run rake:db migrate

project focused on shortening links using bitly,
to use it you must have the file:
config/application.yml

bitly_login: 'login'
bitly_api_key: 'api_key'

and has a service with answer in json to shorten links, which can be accessed in this way:
/shorter?link="Link_to_short"

* Deployment instructions

* ...
