class TracksController < ApplicationController
  def create
    @track = Track.new(params[:track])
    if @track.save
      flash[:notice] = "Successfully created track."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    flash[:notice] = "Successfully destroyed track."
    redirect_to root_url
  end
end
