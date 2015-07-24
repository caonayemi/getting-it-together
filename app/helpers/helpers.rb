helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_logout_button(user)
    if user
      "<a href='/logout'>Logout</a>"
    else
      "<a href='/login'>Login</a>"
    end
  end

end
