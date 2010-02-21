class PostsController < ApplicationController
  include TrackLogger
  before_filter :find_user ,:only=>[:index]
  before_filter :store_location,:only=>[:index,:show]
  def index
    @posts = @user.posts.paginate :all,:page=>params[:page],:per_page=>10,:order=>"created_at desc"
  end
  
  def show
    @post = Post.find(params[:id],:include=>[:user,{:comments=>:user},{:tracks=>:user}])
    @post.read_count += 1
    @post.save
    add_track(:item => @post, :author => @post.user ,:reader => current_user)
   # Track.create!(:item => @post, :user =>@post.user)
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
