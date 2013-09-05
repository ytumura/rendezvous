class RootController < ApplicationController
  def index
    @tags = Post.tag_counts_on(:tags)[0..3]
  end
end
