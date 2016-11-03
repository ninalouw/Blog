class PostsController < ApplicationController
  before_action :authenticate_user, except:[:index,:show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access, only:[:edit, :update, :destroy]

  #ACTIONS
  #creates new post, displays a form
  def new
    @post = Post.new
     @category = Category.all
     @comments = Comment.all
  end

  #handles creating the post after the form has been submitted
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  #shows particular posts when you click on them
  def show
    #find_post method gets called here
    @comment = Comment.new
    @favourite = @post.favourite_for(current_user)
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
    params.require(:post).permit(:title, :body, :category_id, :comment_id, tag_ids: [])
  end

  def authorize_access
   unless can? :manage, @post
    # head :unauthorized #this will send empty HTTP request
    redirect_to root_path, alert: 'Access Denied. You did not create this question!'
    end
  end

end
