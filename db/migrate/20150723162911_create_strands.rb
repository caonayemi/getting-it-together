class CreateStrands < ActiveRecord::Migration
  def change
    create_table :strands do |t|
      t.string   :name
      t.string   :description
      t.string   :tracking_style

      t.timestamps
    end
  end
end
