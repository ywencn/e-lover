# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  username          :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  login_count       :integer(4)
#  current_login_at  :datetime
#  last_login_at     :datetime
#  current_login_ip  :string(255)
#  last_login_ip     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  avatar            :boolean(1)
#

class User < ActiveRecord::Base
  
  acts_as_authentic do |c|
    c.validate_email_field = false
    c.validate_password_field = false
    c.validate_login_field = false
  end
  
  has_many :states
  has_many :activities
  has_many :feeds,:order => "id desc", :limit=>20
  has_many :posts
  has_many :tracks
  has_many :groups, :foreign_key => "admin_id"
  has_and_belongs_to_many :groups
  has_many :followers_connection,:class_name=>"Connection", :foreign_key => "be_followed_id"
  has_many :followed_users_connection,:class_name=>"Connection",  :foreign_key => "follower_id"
  has_many :followers, :through => :followers_connection,:foreign_key => "be_followed_id"
  has_many :followed_users, :through => :followed_users_connection,:foreign_key => "follower_id"
  
  
  validates_format_of :email, :with => Authlogic::Regex.email, :message => "请输入正确格式的E-mail"
  validates_uniqueness_of :email,  :message => "E-mail已经被占用，请使用其他E-mail注册。"
  validates_length_of :username, :within => 2..12,:message => "用户名长度必须在2-12之间"
  validates_length_of :email, :within => 5..30,  :message => "E-mail长度必须在5-30之间"
  validates_confirmation_of :password, :message => "两次输入密码不一致",:if => :require_password?
  validates_length_of :password, :within => 6..20,:message => "密码长度必须在6-20之间",:if => :require_password?
  
 
end

