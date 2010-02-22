class GroupsController < ApplicationController
  before_filter :login_required
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id],:include=>[:admin,:users])
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    @group.admin = current_user
    if @group.save
      flash[:notice] = "Successfully created group."
      redirect_to @group
    else
      render :action => 'new'
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = "Successfully updated group."
      redirect_to @group
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "Successfully destroyed group."
    redirect_to groups_url
  end
end