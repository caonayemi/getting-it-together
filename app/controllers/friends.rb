get '/friends' do
  @user = current_user
  @friends = @user.friends
  erb :"friends/show"
end