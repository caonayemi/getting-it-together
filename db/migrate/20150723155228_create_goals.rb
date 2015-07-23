class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :setter
      t.references :pillar
      t.references :strand
      t.date       :set_on
      t.date       :deadline
      t.boolean    :is_completed

      t.timestamps
    end
  end
end
