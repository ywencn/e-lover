# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end

  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end
  
# define my date formate 
  def my_date(date)
     Date.today == date.to_date ? date.strftime("%H:%M:%S") : date.strftime("%Y-%m-%d")
  end
# define my date formate
  def standard_date(date)
     date.strftime("%Y-%m-%d %H:%M:%S")
  end
  
  def standard_date_m(date)
     date.strftime("%Y-%m-%d %H:%M")
  end   
  
  def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    unless object.errors.empty?
      error_lis = []
      object.errors.each{ |key, msg| error_lis << content_tag("li", msg) }
      content_tag("div", content_tag(options[:header_tag] || "h2", "发生#{object.errors.count}个错误" ) + content_tag("ul", error_lis), "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation" )
  
    end
  end
  
  def avatar(user,size="100_100")
    if user.avatar
     image_tag("/files/avatar/#{size}/#{user.id}.jpg")
    else
     image_tag("/files/avatar/#{size}/0.jpg")
    end
  end
  #user name link ,to users/show or profile
  def username_link(user)
    link_to h(user.username) ,user_path(user) ,:class=>"username_link"
  end
  
  def passed_time(datetime)
    case datetime
    when 1
      1
    end
  end
end
