module TagsHelper
  def tag_count
    Post.tag_counts_on(:tags).size
  end
end
