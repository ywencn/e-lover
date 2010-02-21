class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = @user.activities.all(:limit=>20)
  end

end
