module PostsHelper
  def link_user(user)
  end

  def link_users(users)
    users.
    link_to post.user.name, "/posts/user/#{post.user_id}"
  end
end
