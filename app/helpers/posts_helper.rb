module PostsHelper
  def link_user(user)
  end

  def link_users(users)
    # リンク場所無いので一端名前だけ
    users.user_list.map{|user|user.to_i > 0 ? "@"+User.find(user).name : "@"+user}.join(', ')
  end
end
