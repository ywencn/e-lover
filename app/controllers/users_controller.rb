class UsersController < ApplicationController
  before_filter :load_user, :only => [:show,:edit, :destroy]
  before_filter :login_required, :except =>[:new, :create]
  def new  
      @user = User.new  
  end
  
  def index
    store_location
    @users = User.paginate :page => params[:page],
                           :per_page => 20,
                           :order => "created_at desc",
                           :conditions => "id != #{current_user.id}"
  end

  def create  
    @user = User.new(params[:user])  
    if @user.save  
      flash[:notice] = "Registration successful."  
      redirect_to :action =>'avatar',:id=>current_user.id
    else  
      render :action => 'new'  
    end  
  end 
  
  def show
    
  end
  
  def edit  
     
  end  

  def update  
    @user = current_user  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to root_url  
    else  
      render :action => 'edit'  
    end  
  end
  
  #avater
  def avatar
    
  end
  
  def upload_avatar
      if request.post?  
        avatar_200_200 = RAILS_ROOT + "/public/files/avatar/200_200/"  
        photo_name     = "#{current_user.id}.jpg"  

        avatar_100_100 = RAILS_ROOT + "/public/files/avatar/100_100/"  
        avatar_64_64   = RAILS_ROOT + "/public/files/avatar/64_64/"  
        avatar_50_50   = RAILS_ROOT + "/public/files/avatar/50_50/"  
        avatar_40_40   = RAILS_ROOT + "/public/files/avatar/40_40/"  


        if params[:commit] == "上传照片"  
          #TODO Validate Image Size!  
          #TODO 增加白色背景，以防不规则图片!  

          photo = params[:photo]  

          raise "image type Error!" if photo.content_type !~ /^image\/.*?jpeg|jpg|png|bmp|gif$/i  
          Dir.chdir avatar_200_200  

          img  = MiniMagick::Image.from_blob(photo.read)  
          img.format("jpg") if photo.content_type =~ /gif|png$/i  

          img.resize "300x300"
          
           img.combine_options do |c|  
              c.resize "300x300"  
              c.background "#ffffff"  
              c.gravity "center"  
              c.extent "300x300"  
          end  
          
          img.write photo_name 
          img.resize 100 and Dir.chdir avatar_100_100 and img.write photo_name  
          img.resize 64  and Dir.chdir avatar_64_64   and img.write photo_name  
          img.resize 50  and Dir.chdir avatar_50_50   and img.write photo_name  
          img.resize 40  and Dir.chdir avatar_40_40   and img.write photo_name 

          user=User.find(current_user.id)
          user.avatar=1
          user.save!
          redirect_to request.referer  
        elsif params[:commit] == "保存设置"  

          Dir.chdir avatar_200_200  
          if File.exist?(photo_name)  
            width = params[:x2].to_i - params[:x1].to_i  
            height= params[:y2].to_i - params[:y1].to_i  

            img = MiniMagick::Image.open(photo_name)  

            img.crop "#{width}x#{height}+#{params[:x1]}+#{params[:y1]}"  

            img.resize 100 and Dir.chdir avatar_100_100 and img.write photo_name  
            img.resize 64  and Dir.chdir avatar_64_64   and img.write photo_name  
            img.resize 50  and Dir.chdir avatar_50_50   and img.write photo_name  
            img.resize 40  and Dir.chdir avatar_40_40   and img.write photo_name  
          end  
          redirect_to root_url
        end  
      end  
  end

protected

  def load_user
    @user=current_user
  end
  
  def destroy
    
  end

end
