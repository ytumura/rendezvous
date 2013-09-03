class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :users

  scope :by_join_date, -> {order("created_at DESC")}
  scope :search_content, ->(q) {where 'content like ?', "%#{q}%"}
  scope :search_tag, ->(q) {Post.tagged_with(q)}
end
