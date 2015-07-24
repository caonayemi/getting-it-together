class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :initiator
      t.references :acceptor

      t.timestamps
    end
  end
end
