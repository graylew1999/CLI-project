#require all of our files so they can talk to each other
require 'bundler'
Bundler.require #require all gems listed 

require_relative './lib/api.rb'
require_relative './lib/makeup.rb'
require_relative './lib/cli.rb'