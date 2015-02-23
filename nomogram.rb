require 'rubygems'
require 'sinatra'
require 'data_mapper'
require './models'
require './kittens'

configure :development do
  enable :logging, :dump_errors, :raise_errors
end
