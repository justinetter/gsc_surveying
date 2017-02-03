class PostsController < ApplicationController
  def carousel_scroll
    @carousel_size = 4
    @direction = params[:direction]
    # steps up and down carousel_index
    cookies[:carousel_index] = if @direction.to_sym.eql? :right
      cookies[:carousel_index] = cookies[:carousel_index].to_i + 1
    elsif @direction.to_sym.eql? :left
      cookies[:carousel_index] = cookies[:carousel_index].to_i - 1
    end
    # keeps within limits
    if cookies[:carousel_index].to_i > Post.all.size - @carousel_size
      cookies[:carousel_index] = Post.all.size - @carousel_size
    elsif cookies[:carousel_index].to_i < 0
      cookies[:carousel_index] = 0
    end
    # gets images
    @images = Post.limit(@carousel_size).offset(cookies[:carousel_index].to_i)
    # carousel image to insert with ids
    if @direction == "right"
      @image = @images.last
      @image_id = "last_carousel_image"
      @image_to_remove ="first_coursel_image" 
    else
      @image = @images.first
      @image_id = "first_coursel_image"
      @image_to_remove = "last_carousel_image"
    end
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
