class ProfileController < ApplicationController
  before_filter :login_required
  
  def show
    @user = User.find(params[:id])
    @activities = @user.activities.all(:limit=>20,:order => "created_at desc")
    @state = @user.states.last
    @followers = @user.followers
    @followed_users = @user.followed_users
  end

end
