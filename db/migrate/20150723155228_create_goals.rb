class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :setter
      t.string     :name
      t.string     :description
      t.references :pillar
      t.references :strand
      t.datetime   :set_at
      t.datetime   :deadline
      t.boolean    :is_started
      t.boolean    :is_completed
      t.integer    :self_rating

      t.timestamps
    end
  end
end
