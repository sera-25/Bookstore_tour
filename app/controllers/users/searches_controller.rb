class Users::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "users/searches/index"
    else
      @posts = Post.looks(params[:search], params[:word])
      render "users/searches/index"
    end
  end
end
