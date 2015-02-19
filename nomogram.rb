require 'rubygems'
require 'sinatra'
require 'data_mapper'

require './models'
require './kittens'

get '/' do
  "☆ﾐ(o*･ω･)/ marketing, or person page if logged in"
  # see 'using sessions' for accessing cookie vals
end

get '/:person/?' do |person|
  "see all projects for person: #{person}"
end

get '/:person/:project/?' do |person, project|
  "retrieve #{person}'s project named #{project}." #, :locals => { :bar => foo } This is typically used when rendering templates as partials from within other templates
  # + If person exists, but project doesn't - show a unique error pg with person's info/email
end

# group :development do
#
# end
