class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
