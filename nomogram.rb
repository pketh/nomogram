require 'rubygems'
require 'sinatra'

get '/' do
  "☆ﾐ(o*･ω･)/ marketing, or person page if logged in"
end

get '/:person/?' do |person|
  "see all projects for person: #{person}"
end

get '/:person/:project/?' do |person, project|
  "retrieve #{person}'s project named #{project}."
  # + If person exists, but project doesn't - show a unique error pg with person's info/email
end


# require './otherfile'
