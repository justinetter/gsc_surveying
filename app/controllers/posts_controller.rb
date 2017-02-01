class PostsController < ApplicationController
  def carousel_scroll
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_url
    else
      redirect_to :back
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :image)
  end
end
