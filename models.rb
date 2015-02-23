DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite")

require './controllers/root'

class Person
  include DataMapper::Resource
  property :id, Serial
  property :email, String, format: :email_address, :unique => true
  property :name, String, :unique => true
  property :created, Time
  property :updated, Time
  has n, :projects
end

require './controllers/person'

class Project
  include DataMapper::Resource
  belongs_to :person
  property :id, Serial
  property :name, String, :required => true
  property :name_url, String
  property :description, String
  property :created, Time
  property :updated, Time
  has n, :posts
end

require './controllers/project'

class Post
  include DataMapper::Resource
  belongs_to :project
  property :id, Serial
  property :file_path, String, :required => true
  property :file_is_retina, Boolean, :default => false
  property :created, Time
  property :updated, Time
  has n, :comments
end

require './controllers/post'

class Comment
  include DataMapper::Resource
  belongs_to :post
  property :id, Serial
  property :email, String
  property :comment, String
  property :created, Time
  property :updated, Time
end

require './controllers/comment'

DataMapper.finalize

# Use auto_migrate instead of auto_upgrade to wipe the database and start fresh
DataMapper.auto_upgrade!
