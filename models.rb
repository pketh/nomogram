DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite")

class Person
  include DataMapper::Resource
  property :id, Serial
  property :created, DateTime
  property :email, String, format: :email_address, :unique => true
  property :name, String, :unique => true
  has n, :projects
end

class Project
  include DataMapper::Resource
  belongs_to :person
  property :id, Serial
  property :created, DateTime
  property :name, String, :required => true
  property :name_url, String
  property :description, String
  has n, :posts
end

class Post
  include DataMapper::Resource
  belongs_to :project
  property :id, Serial
  property :created, DateTime
  property :file_path, String, :required => true
  property :file_is_retina, Boolean, :default => false
  has n, :comments
end

class Comment
  include DataMapper::Resource
  belongs_to :post
  property :id, Serial
  property :created, DateTime
  property :email, String
  property :comment, String
end

DataMapper.finalize

# Use auto_migrate instead of auto_upgrade to wipe the database and start fresh
DataMapper.auto_upgrade!
