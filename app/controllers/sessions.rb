get '/login' do
  @current_user = User.new
  erb :"sessions/login_form"
end

post '/login' do
  if @current_user = User.authenticate(params[:sessions])
    session[:user_id] = @current_user.id
    redirect "/users/#{@current_user.id}"
  else
    @current_user = User.new(params[:sessions])
    @errors = ["Invalid username or password"]
    erb :"sessions/login_form"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end

get '/signup' do
  @current_user = User.new
  erb :"sessions/signup_form"
end

post '/signup' do
  @current_user = User.new(params[:sessions])
  if @current_user.save
    session[:user_id] = @current_user.id
    redirect "/users/#{@current_user.id}"
  else
    @errors = @current_user.errors.full_messages
    erb :"sessions/signup_form"
  end
end

