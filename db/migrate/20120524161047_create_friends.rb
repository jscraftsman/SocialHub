class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :status,         :null => false, :default => "pending"
      t.integer :user_id,       :null => false
      t.integer :friend_id,     :null => false

      t.timestamps
    end
    add_index :friends, :user_id
    add_index :friends, :friend_id
  end
end
