class Goal < ActiveRecord::Base
  belongs_to :setter, class_name: :User
  belongs_to :pillar
  belongs_to :strand
  has_many :milestones

  validates :setter, presence: true
  validates :name, presence: true
  validates :pillar, presence: true
  validates :strand, presence: true
  validates :set_at, presence: true
  validate :deadline_is_after_set_date

  def is_started
    self.set_at < DateTime.current
  end

  def is_completed
    self.milestones.all? do |milestone|
      milestone.is_completed
    end
  end

  def deadline_is_after_set_date
    self.set_at < self.deadline
  end
end
