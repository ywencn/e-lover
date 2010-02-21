class Post < ActiveRecord::Base
 # attr_accessible :title, :body, :comments_count, :user_id, :last_replid_user_id, :last_replid_time, :publish_to_blog, :publish_to_group
 include ActivityLogger
 
 belongs_to :user
 belongs_to :group
 belongs_to :last_replied_user, :class_name=>"User", :foreign_key => "last_replied_user_id"
 has_many :comments,:as => :item,:order=> "created_at desc",:dependent => :delete_all
 has_many :tracks, :as => :item ,:order=> "created_at desc",:dependent => :delete_all,
          :limit => 3
 validates_presence_of :body, :message => "文章内容不能为空"
 validates_presence_of :title, :message => "文章标题不能为空"
 
 after_create :log_activity

private
 def log_activity
   add_activities(:item => self, :user => self.user)
 end
end

