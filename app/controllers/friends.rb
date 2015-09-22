get '/friends' do
  @user = User.find(params[:user_id])
  @friends = @user.friends
  erb :"friends/show"
end