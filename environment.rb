#require all of our files so they can talk to each other
require 'bundler'
Bundler.require
require 'terminal-table'
require 'table_print'
require 'rainbow'
require 'colorize'
require 'lolize/auto'

# require 'pry'
# require 'httparty'
# require 'json'
 #require all gems listed 
require_relative './lib/dior.rb'
require_relative './lib/api.rb'
require_relative './lib/cli.rb'
require_relative './lib/customer.rb'
require_relative './lib/order.rb'