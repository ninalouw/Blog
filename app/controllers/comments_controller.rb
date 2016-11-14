class CommentsController < ApplicationController
    before_action :authenticate_user, except:[:index,:show]
  def new
    @comment = Comment.new
  end

  #handles creating the comment after the form has been submitted
  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit([:body])
    @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.post = @post
      @comment.user = current_user
      respond_to do |format|
      if @comment.save
        format.js {render :create_success}
        format.html { redirect_to post_path(@post)}
      else
        format.js {render :create_failure}
        format.html { render 'posts/show'}
      end
    end
  end

  def destroy
      # @post = Post.find params[:post_id]
      @comment = Comment.find params[:id]
      respond_to do |format|
       if can? :delete, @comment
        @post = @comment.post
        @comment.destroy
          format.html { redirect_to post_path(@post), notice: 'Comment Deleted!'}
          format.js { render :destroy}
        else
          format.html { redirect_to root_path, alert: 'Access Denied. You did not create this comment!'}
          format.js{ render js: 'alert("access denied");'}
        end
     end
  end

end
