class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :status
      t.integer :user_id

      t.timestamps
    end

    create_table :friends_users, :id => false do |t|
      t.integer :user_id
      t.integer :friend_id
    end
  end
end
