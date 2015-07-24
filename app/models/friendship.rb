class Friendship < ActiveRecord::Base
  belongs_to :initiator, class_name: :User
  belongs_to :acceptor, class_name: :User

  validates :initiator, presence: true
  validates :acceptor, presence: true

  # Figure out how to validate that the initiator and acceptor are not the same user

  # Figure out how to validate that a friendship is not duplicated in reverse (initiator A and acceptor B is one friendship; initiator B and acceptor A cannot be another friendship)
end
