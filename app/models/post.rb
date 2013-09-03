class Post < ActiveRecord::Base
  acts_as_taggable

  scope :by_join_date, -> {order("created_at DESC")}
  scope :search_content, ->(q) {where 'content like ?', "%#{q}%"}
  scope :search_tag, ->(q) {Post.tagged_with(q[1..-1])}
end
