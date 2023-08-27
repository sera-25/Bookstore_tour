class Users::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  # フォロー一覧
  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
