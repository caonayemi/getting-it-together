class CreatePillars < ActiveRecord::Migration
  def change
    create_table :pillars do |t|
      t.string   :name
      t.string   :description
      t.integer  :priority

      t.timestamps
    end
  end
end
