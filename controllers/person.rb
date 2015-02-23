get '/:person/?' do |person|
  "see all projects for person: #{person}"
end

post '/person/new/?' do
  content_type :json
  params = JSON.parse(request.body.read)
  @person = Person.create(
    :email => params["email"],
    :name => params["name"],
    :created => Time.now
  )
  @person.save
  if @person.save
    @person.to_json
    # redirect "/#{person.name}"
  else
    person.errors each do |error|
      puts error
    end
  end
end

put '/:person/update/?' do
  content_type :json
  params = JSON.parse(request.body.read)
  # @person = Person.update(
  #   :email => params["email"],
  #   :name => params["name"],
  #   :updated => Time.now
  # )
  # @person.save
  # if @person.save
  #   @person.to_json
  #   # redirect "/#{person.name}"
  # else
  #   person.errors each do |error|
  #     puts error
  #   end
  # end
end

delete '/:person/delete/?' do |name|
  Person.get(params[:name]).destroy
  if @person.destroy
    {:success => "ok"}.to_json
    # "ヾ(＾∇＾) We miss you already #{name}. Come back anytime!"
  else
      halt 500
  end
end
