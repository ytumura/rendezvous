module ApplicationHelper
  def login?
    return true if current_user.present?
    return false
  end
  def user_info
    name = current_user.name
    "Your name:#{name}"
  end
end
