class Goal < ActiveRecord::Base
  belongs_to :setter, class_name: "User"
  belongs_to :pillar
  belongs_to :strand
  has_many :milestones

  def is_completed
    self.milestones.all? do |milestone|
      milestone.is_completed
    end
  end
end
