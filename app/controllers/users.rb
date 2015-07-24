get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @goals = @user.goals
  erb :"users/show"
end