get '/goals/new' do
  erb :"goals/new"
end

post '/goals/new' do
  if current_user
    @user = current_user
  else
    redirect "/login"
  end

  @goal = Goal.new(setter: @user, params[:goal_info])
  if @goal.save
    redirect "/users/#{@user.id}"
  else
    @errors = @goal.errors.full_messages
    erb :"goals/new"
  end
end

get '/goals/:goal_id' do
  @goal = Goal.find(params[:goal_id])
  if current_user == @goal.setter
    @user = current_user
    erb :"goals/show"
  else
    redirect "/login"
  end
end
