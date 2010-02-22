module ActivitiesHelper
  def feed_message(activity)
    activity_user = activity.user
    
    case activity_type(activity)
    when "State"
      state = activity.item
      view_state = username_link(activity_user)
      %(
        #{view_state}: 
        #{h(state.body)}
       #{content_tag("div","#{time_ago_in_words(state.created_at)} ago","class"=>"time_ago")}
      )
    when "Post"
      post = activity.item
      %(
        #{username_link(activity_user)} 发表了日志 #{post_title_link(post)}
        #{content_tag("div",truncate(h(strip_tags(post.body)),200),"class" => "activity_body")}
       #{content_tag("div","#{time_ago_in_words(post.created_at)} ago","class"=>"time_ago")}
      )
    when "Comment"
      comment = activity.item
      post = comment.item
      author = post.user
      %(
        #{username_link(activity_user)} 回复了 #{username_link(author)} 的日志
        #{post_title_link(post)}
        #{content_tag("div",truncate(h(strip_tags(comment.body)),200),"class" => "activity_body")}
       #{content_tag("div","#{time_ago_in_words(comment.created_at)} ago","class"=>"time_ago")}
      )
    end
  end
  
  private
    def activity_type(activity)
      activity.item.class.to_s      
    end
    def post_title_link(post)
      link_to h(post.title) ,user_post_path(post.user,post),:class=>"username_link"
    end
end
