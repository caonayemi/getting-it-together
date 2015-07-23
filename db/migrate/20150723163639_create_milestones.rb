class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.references :setter
      t.references :goal
      t.string     :description
      t.boolean    :is_completed

      t.timestamps
    end
  end
end
