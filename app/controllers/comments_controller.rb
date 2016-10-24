class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  #handles creating the comment after the form has been submitted
  def create
    @comment_params = params.require(:comment).permit([:title, :body])
    @comment = Comment.new(@comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end
end
