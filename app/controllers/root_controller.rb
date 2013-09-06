class RootController < ApplicationController
  def index
    @posts = Post.all.desc.limit(10)
    @my_posts = Post.having(current_user).desc.limit(10)
    @tags = Post.tag_counts_on(:tags)[0..3]
  end
end
