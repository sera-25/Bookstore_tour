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
      flash[:notice] = "投稿に成功しました"
      redirect_to posts_path
    else
      @posts = Post.all
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :address, :latitude, :longitude, :title, :body, images: [])
  end

end
