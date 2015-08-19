get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @goals = @user.goals
  erb :"users/show"
end

get '/users/:user_id/edit' do
  @user = User.find(params[:user_id])
  if @user == current_user
    erb :"users/edit"
  else
    redirect "/login"
  end
end

put '/users/:user_id' do
  @user = User.find(params[:user_id])

  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"users/edit"
  end
end
