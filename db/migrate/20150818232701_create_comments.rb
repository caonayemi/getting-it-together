class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commenter
      t.references :commentable, polymorphic: true, index: true
      t.string     :content

      t.timestamps
    end
  end
end
