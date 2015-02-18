require 'sinatra'

get '/' do
  "Hello World"
end

# optional / or /#{name} parms
get '/:greeting/?:name?' do
  "#{params[:greeting]} #{params[:name] ? params[:name] : 'world'}!"
end


# require './otherfile'
