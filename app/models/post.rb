class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :users

  scope :by_join_date, -> {order("created_at DESC")}
  scope :search_content, ->(q) {where 'content like ?', "%#{q}%"}
  scope :search_tag, ->(q) {Post.tagged_with(q)}

  def self.having(user)
    Post.all.where(user_id: user.id)
  end

  def user(id)
    User.find(id)
  end

  def user=(obj)
    self.user_id = obj.id
  end

  def content_html
    StringParse.md2html(self.content)
  end
end
