module ApplicationHelper
  def user_info
    name = current_user.name
    "Your name:#{name}"
  end
end
