DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite")

class Person
  include DataMapper::Resource
  property :id, Serial
  property :email, String, format: :email_address
  property :name, String
  has n, :projects
end

class Project
  include DataMapper::Resource
  belongs_to :person
  property :id, Serial
  has n, :posts
end

class Post
  include DataMapper::Resource
  belongs_to :project
  # properties ...
  has n, :comments
end

class Comment
  include DataMapper::Resource
  belongs_to :post
  # properties ...
end

DataMapper.finalize

# Use auto_migrate instead of auto_upgrade to wipe the database and start fresh
DataMapper.auto_upgrade!
