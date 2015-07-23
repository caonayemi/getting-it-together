class Milestone < ActiveRecord::Base
  belongs_to :setter, class_name: :User
  belongs_to :goal

  validates :setter, presence: true
  validates :goal, presence: true
  validates :description, presence: true
end
