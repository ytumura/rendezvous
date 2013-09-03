class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @search_form = SearchForm.new params[:search_form] 
    @posts = Post.all

    if @search_form.q.present?
      if @search_form.tag?
        @posts = @posts.search_tag @search_form.q
      else
        @posts = @posts.search_content @search_form.q
      end
    end
    @posts = @posts.by_join_date
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.content = StringParse.md2html(@post.content)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.tag_list = StringParse.tags(params['tags'], '#')
    @post.user_list = StringParse.tags(params['users'], '@')

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      begin
        raise unless @post.update(post_params)

        @post.tag_list = StringParse.tags(@post.content)
        @post.tag_list = StringParse.tags(params['tags'], '#')
        @post.user_list = StringParse.tags(params['users'], '@')
        raise unless @post.save
      rescue
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
