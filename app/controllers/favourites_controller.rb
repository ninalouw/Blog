class FavouritesController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @favourite = Favourite.new(user: current_user, post: @post)
    respond_to do |format|
      if cannot? :favourite, @post
        format.html { redirect_to :back, notice:"🔥Access Denied🔥"}
    elsif @favourite.save
        format.js { render :create_success}
        format.html { redirect_to :back, notice: "Favourited!"}
      else
        format.js { render js: 'alert("Failure")'}
        format.html { redirect_to :back, alert:@favourite.errors.full_messages.join(", ")}
      end
    end
  end

  def destroy
    @favourite = Favourite.find params[:id]
    @post = @favourite.post
    respond_to do |format|
      if @favourite.destroy
        format.html { redirect_to :back, notice: "Unfavourited!"}
        format.js { render :destroy}
      else
        format.html { redirect_to :back, alert:@favourite.errors.full_messages.join(", ")}
        format.js { render js: 'alert("access denied");'}
      end
   end
  end

end
