class User < ActiveRecord::Base
  has_many :friends
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      nil
    end
  end


end
