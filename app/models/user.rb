class User < ActiveRecord::Base
  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(un, pw)
    user = User.find_by(username: un)
    if user && user.password == pw
      user
    else
      nil
    end
  end



end
