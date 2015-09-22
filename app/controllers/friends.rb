get '/users/:user_id/friends' do
  @user = current_user
  @friends = @user.friends
  erb :"friends/show"
end