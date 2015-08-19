get "/goals/new" do
  @user = current_user
  @goal = Goal.new
  erb :"goals/new"
end

post "/goals" do
  if current_user
    @user = current_user
  else
    redirect "/login"
  end

  @goal = Goal.new(setter: @user, name: params[:name], pillar: Pillar.find_by(name: params[:pillar_name]), strand: Strand.find_by(name: params[:strand_name]), description: params[:description])
  @goal.generate_set_at(params[:set_date], params[:set_time])
  @goal.generate_deadline(params[:end_date], params[:end_time])

  if @goal.save
    redirect "/goals/#{@goal.id}/edit"
  else
    @errors = @goal.errors.full_messages
    erb :"goals/new"
  end
end

get "/goals/:goal_id" do
  @goal = Goal.find(params[:goal_id])
  if current_user == @goal.setter
    @user = current_user
    erb :"goals/show"
  else
    redirect "/login"
  end
end

get "/goals/:goal_id/edit" do
  if current_user
    @user = current_user
  else
    redirect "/login"
  end

  @goal = Goal.find(params[:goal_id])
  erb :"goals/edit"
end

put "/goals/:goal_id" do
end

delete "/goals/:goal_id" do
end
