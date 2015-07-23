class Pillar < ActiveRecord::Base
  has_many :goals
  has_many :setters, through: :goals
  has_many :strands, through: :goals

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :priority, presence: true, uniqueness: true
end
