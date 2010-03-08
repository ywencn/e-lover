class StatesController < ApplicationController
  
  before_filter :find_user ,:except=>:create
  before_filter :login_required
  
  def index
    store_location
    @state = State.new
    @states = @user.states.paginate :page => params[:page],
                             :per_page => 10,
                             :order => "created_at desc"
                        #     :include =>[:user,:comments,{:comments => :user}]
    @comment=Comment.new
  end
  
  def create
     
    @state = current_user.states.new(params[:state])
    if @state.save
      flash[:notice] = "Successfully created state."
      redirect_back_or_default(root_path)
    else
      render :action => 'new'
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    flash[:notice] = "Successfully destroyed state."
    redirect_to user_states_url(@user)
  end
private
  def find_user 
    @user=User.find(params[:user_id].to_i)
  end
end
