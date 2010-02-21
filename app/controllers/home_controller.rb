class HomeController < ApplicationController
  def index
    store_location
    redirect_to login_path unless current_user
    @user= current_user
    @followers = @user.followers.all(:limit=>8)
    @followed_users = @user.followed_users.all(:limit=>8)
    @feeds = current_user.feeds.all(:limit=>30)
    @state=State.new
  end
end