class Users::CommentsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
