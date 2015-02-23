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

put '/:person/:project/update/?' do |name, description|
  #
end
