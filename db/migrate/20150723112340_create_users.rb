class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :username
      t.string   :password_hash
      t.text     :description
      t.text     :motivation

      t.timestamps
    end
  end
end
