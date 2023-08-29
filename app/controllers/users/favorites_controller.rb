class Users::FavoritesController < ApplicationController
  
  # お気に入り（いいね）するとき
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to request.referer
  end
  
  # お気に入り（いいね）を外すとき
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
