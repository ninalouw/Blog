class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  #ACTIONS
  #creates new post, displays a form
  def new
    @post = Post.new
     @categories = Category.all
  end

  #handles creating the post after the form has been submitted
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  #shows particular posts when you click on them
  def show
  #find_post method gets called here
  end

  #displays all the posts
  def index
    @posts = Post.order(created_at: :desc)

  end

#gets a post for editing
  def edit
    #find_post method gets called here
  end

  def update
     #find_post method gets called here
     if @post.update(post_params)
       redirect_to post_path(@post)
     else
       render :edit
     end
  end

  def destroy
    #find_post method gets called here
    @post.destroy
    redirect_to posts_path
  end

#Methods created to refactor code

  private
#find_post method, gets called on :show, :edit, :update, :destroy
  def find_post
    @post = Post.find params[:id]
  end

  private
#post_params method used for defining params in create and update
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
