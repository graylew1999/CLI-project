#require all of our files so they can talk to each other
require 'bundler'
Bundler.require

# require 'pry'
# require 'httparty'
# require 'json'
 #require all gems listed 
require_relative './lib/dior.rb'
require_relative './lib/api.rb'
require_relative './lib/cli.rb'
require_relative './lib/customers.rb'