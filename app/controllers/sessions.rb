get '/login' do
  @person = User.new
  erb :"sessions/login_form"
end

post '/login' do
  if person = User.authenticate(params[:sessions])
    session[:user_id] = person.id
    redirect "/users/#{person.id}"
  else
    @person = User.new(params[:sessions])
    @errors = ["Bad username - password combination"]
    erb :"sessions/login_form"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end

get '/signup' do
  @person = User.new
  erb :"sessions/signup_form"
end

post '/signup' do
  @person = User.new(params[:sessions])
  if @person.save
    session[:user_id] = @person.id
    redirect "/users/#{person.id}"
  else
    @errors = @person.errors.full_messages
    erb :"sessions/signup_form"
  end
end

