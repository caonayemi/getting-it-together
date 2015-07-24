get '/login' do
  @user = User.new
  erb :"sessions/login_form"
end

post '/login' do
  if user = User.authenticate(params[:sessions])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @user = User.new(params[:sessions])
    @errors = ["Bad username - password combination"]
    erb :"sessions/login_form"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end

get '/signup' do
  @user = User.new
  erb :"sessions/signup_form"
end

post '/signup' do
  @user = User.new(params[:sessions])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"sessions/signup_form"
  end
end

