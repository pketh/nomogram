require 'rubygems'
require 'sinatra'
require 'data_mapper'
require './models'
require './kittens'

# 🌺 Hello

get '/' do
  # erb :index
  "☆ﾐ(o*･ω･)/ marketing, or person page if logged in"
  # see 'using sessions' for accessing cookie vals
end

# 🙋 Person Routes

get '/:person/?' do |person|
  "see all projects for person: #{person}"
end

post '/:person/new/?' do |name, email|
  @person = Person.create(
    :created => DateTime.now,
    :name => name,
    :email => email
  )
  if person.save
    redirect "/#{person.name}"
  else
    person.errors each do |error|
      puts error
    end
  end
end

get '/:person/profile/?' do
  # @person = Person.get(params[:id])
  erb :person_edit
end

post '/:person/update/?' do |name, email|
  # @person = Person.get(params[:name].to_s)
end

post '/:person/delete/?' do |name|
  Person.get(params[:id]).destroy
  if person.destroy
    "ヾ(＾∇＾) We miss you already #{name}. Come back anytime!"
  end
end

# 💃 Project Routes

get '/:person/:project/?' do |person, project|
  "retrieve #{person}'s project named
  #{project}." #, :locals => { :bar => foo } This is typically used when rendering templates as partials from within other templates
  # + If person exists, but project doesn't - show a unique error pg with person's info/email
end

post '/:person/project/new/?' do |name, description|
  # "#{person}" how to set up belonging rels?
  @project = Project.create(
    :created => DateTime.now,
    :name => name,
    :description => description
  )
  if project.save
    redirect "/#{person.name}/#{project.id}"
  else
    project.errors each do |error|
      puts error
    end
  end
end

post '/:person/:project/update/?' do |name, description|
  #
end

# 🎆 Post Routes

## get -> get all posts belonging to a project
## post -> add post to project
## post -> update post
## post -> reorder posts

# 👍 Comment Routes

## get -> get all comments belonging to a post
## post -> add a comment to a post
## post -> update a specific comment
