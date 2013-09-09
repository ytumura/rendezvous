class TagsController < ApplicationController
  def index
    @posts = Post.all.desc.limit(10)
    @my_posts = Post.having(current_user).desc.limit(10)
    @tags = Post.tag_counts_on(:tags)[0..3]
    @search_form = SearchForm.new params[:search_form] 

    if @search_form.q.present?
      if @search_form.tag?
        @posts = @posts.search_tag(@search_form.q)
      elsif @search_form.user?
        name = @search_form.q[1..-1]
        user = User.find_by(name: name)
        @posts = @posts.search_tag("@#{user.id}")
      else
        @posts = @posts.search_content(@search_form.q)
        @posts = @posts.desc
      end
    end
  end

  def list
    @posts = Post.search_tag("##{params[:tag_name]}").desc
  end
end
