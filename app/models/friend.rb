class Friend < ActiveRecord::Base
  belongs_to :users

  attr_accessible :status, :user_id, :friend_id

  scope :pending_friends, lambda {|friend_id| {:conditions => ["friend_id = ? AND status = 'pending'", friend_id]} }
end
