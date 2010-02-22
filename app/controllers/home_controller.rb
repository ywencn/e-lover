class HomeController < ApplicationController
  before_filter :login_required
  def index
    store_location
    redirect_to login_path unless current_user
    @user= current_user
    if current_user
      @followers = current_user.followers.all(:limit=>8)
      @followed_users = current_user.followed_users.all(:limit=>8)
      @feeds = current_user.feeds.all(:limit=>30)
    end
    @state=State.new
  end
end