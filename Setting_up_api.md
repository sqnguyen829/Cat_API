For the useage of API install this gem form the terminal then require it in the seed file 
gem install 'rest-client'

this is to install it on the local machine, make sure to put the gems you use in the gemfile so when other people DL they will be able to install that gem
so place this gem in the gemfile [ gem 'rest-client' ]

You will now need the gem 'json'

Sometime api don't have certain attribute so we can assign a default value for that attribute

ran into seeding do to the environment file 

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'


require_all 'lib' was changed to require_all 'app' so that we can get the models
