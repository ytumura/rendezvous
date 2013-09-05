class TagsController < ApplicationController
  def index
    #@tags = Post.tag_counts_on(:tags)
    @tags = Post.tags_on(:tags)
  end

  def list
    @posts = Post.search_tag("##{params[:tag_name]}").by_join_date
  end
end
