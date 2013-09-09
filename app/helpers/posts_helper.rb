module PostsHelper
  def link_user(user)
  end

  def link_users(users)
    # リンク場所無いので一端名前だけ
    users.user_list.map{|user|"@"+User.find(user[1..-1]).name}.join(', ')
  end
end
