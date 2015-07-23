class User < ActiveRecord::Base
  has_many :goals, foreign_key: :setter_id

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(args)
    user = User.find_by(username: args[:username])
    if user && user.password == args[:password]
      user
    else
      nil
    end
  end



end
