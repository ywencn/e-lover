class CommentsController < ApplicationController
  
  before_filter :get_instance_vars
    
  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = parent.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_back_or_default @comment
    else
      render :action => 'new'
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end
  
  # Return a the parent (person or blog post) of the comment.
  def parent
    if state?
      @state
    end
    if post?
      @post
    end
  end
  
  def state?
    !params[:state_id].nil?
  end
  def post?
    !params[:post_id].nil?
  end

private
  
    def get_instance_vars
      if state?
        @state = State.find(params[:state_id])
      end
      if post?
        @post = Post.find(params[:post_id])
      end
    end
end
