class PostsController < ApplicationController
  include TrackLogger
  before_filter :find_user ,:only=>[:index]
  before_filter :store_location,:only=>[:index,:show]
  before_filter :login_required
  
  def index
    @posts = @user.posts.paginate :all,:page=>params[:page],:per_page=>10,:order=>"created_at desc"
  end
  
  def show
    @post = Post.find(params[:id])
    Post.increment_counter(:read_count,params[:id])
    add_track(:item => @post, :author => @post.user ,:reader => current_user)
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.last_replied_user = current_user
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_back_or_default(root_url)
  end
  
protected
  def find_user
    @user=User.find(params[:user_id])
  end
end
