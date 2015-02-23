get '/' do
  # erb :index
  "#{settings.logging?} ☆ﾐ(o*･ω･)/ marketing, or person page if logged in"
  # see 'using sessions' for accessing cookie vals
end

get '/settings/?' do
  # get person from sessions
  erb :settings
end
