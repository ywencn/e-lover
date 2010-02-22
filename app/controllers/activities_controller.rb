class ActivitiesController < ApplicationController
  before_filter :login_required
  
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "Successfully destroyed activity."
    redirect_to root_url
  end
end
