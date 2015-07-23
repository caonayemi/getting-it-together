class Strand < ActiveRecord::Base
  has_many :goals
  has_many :setters, through: :goals
  has_many :pillars, through: :goals
  has_many :milestones, through: :goals

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :tracking_style, presence: true
end
