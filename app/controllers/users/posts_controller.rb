class Users::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.all
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:user_id, :address, :latitude, :longitude, :title, :body)
  end

end
