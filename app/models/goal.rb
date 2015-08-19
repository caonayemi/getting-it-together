class Goal < ActiveRecord::Base
  belongs_to :setter, class_name: :User
  belongs_to :pillar
  belongs_to :strand
  has_many :milestones
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments

  validates :setter, presence: true
  validates :name, presence: true
  validates :pillar, presence: true
  validates :strand, presence: true
  # validates :set_at, presence: true
  # validate :deadline_is_after_set_date

  def is_started
    self.set_at < DateTime.current
  end

  def is_completed
    if self.milestones.empty?
      false
    else
      self.milestones.all? do |milestone|
        milestone.is_completed
      end
    end
  end

  def deadline_is_after_set_date
    self.set_at < self.deadline
  end

  def generate_set_at(set_date, set_time)
    date = Date.parse(set_date)
    time = Time.parse(set_time)
    @set_at = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
  end

  def generate_deadline(end_date, end_time)
    date = Date.parse(end_date)
    time = Time.parse(end_time)
    @deadline = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
  end
end
