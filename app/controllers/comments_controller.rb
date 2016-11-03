class CommentsController < ApplicationController
    before_action :authenticate_user, except:[:index,:show]
  # def new
  #   @comment = Comment.new
  # end

  #handles creating the comment after the form has been submitted
  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit([:body])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    # @post = Post.find params[:post_id]
      comment = Comment.find params[:id]
    if can? :delete, comment
      post = comment.post
      comment.destroy
      redirect_to post_path(post), notice: 'Comment Deleted!'
    else
      redirect_to root_path, alert: 'Access Denied. You did not create this comment!'
    end

  end

end
