class ConnectionsController < ApplicationController
  before_filter :login_required
  
  def index
    @connections = Connection.all
  end
  
  def new
    @connection = Connection.new
  end
  
  def create
    @connection = Connection.new
    @connection.be_followed_id = params[:be_followed_id]
    @connection.follower = current_user
    if @connection.save
      flash[:notice] = "Successfully created connection."
      redirect_back_or_default(root_url)
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @connection = Connection.find_by_be_followed_id_and_follower_id(params[:id],current_user.id)
    @connection.destroy
    flash[:notice] = "Successfully destroyed connection."
    redirect_back_or_default(root_url)
  end
end
