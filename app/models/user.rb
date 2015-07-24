class User < ActiveRecord::Base
  has_many :goals, foreign_key: :setter_id
  has_many :pillars, through: :goals
  has_many :strands, through: :goals
  has_many :friendships, foreign_key: :initiator_id
  has_many :friendships, foreign_key: :acceptor_id

  validate :email_requirements
  validates :username, presence: true, uniqueness: true
  validate :password_requirements

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(login_args)
    login_user = User.find_by(username: login_args[:username])
    if login_user && login_user.password == login_args[:password]
      login_user
    else
      nil
    end
  end

  private

  def raw_password
    @raw_password || ""
  end

  def password_requirements
    if raw_password || new_record?
      if raw_password.length < 6 || !(raw_password =~ /[!@#$%^&*]/)
        errors.add(:password, "must be at least 6 characters long and contain at least 1 special character (!@#$%^&*).")
      end
    end
  end

  def email_requirements
    if !(/.+@\w+\.\w+/ =~ self.email)
      errors.add(:email, "must be a valid email address")
    end
  end
end
