module ApplicationHelper
  def get_user_email(id)
    User.find(id).email
  end
end
