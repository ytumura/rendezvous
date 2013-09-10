require 'spec_helper'

describe Post do
  before do
    @user = User.new
    @user.id = 1
    @user.email = "test@zigexn.co.jp"
    @user.name = "test"
  end

  it "user=" do
    @post = Post.new
    @post.user = @user

    expect(@post.user_id).to eq(@user.id)
  end
end
