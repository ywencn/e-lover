class HomeController < ApplicationController
  def index
    store_location
    redirect_to login_path unless current_user
    @user= current_user
    @state=State.new
  end

end
