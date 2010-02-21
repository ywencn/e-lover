# == Schema Information
#
# Table name: states
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  body           :string(255)
#  comments_count :integer(4)      default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

class State < ActiveRecord::Base
  attr_accessible :user_id, :body
  
  include ActivityLogger
  belongs_to :user
  has_many :comments,:as => :item,:order=> "created_at desc"
  has_many :activities, :as => :item, :dependent => :destroy    
  
  validates_presence_of :body, :on => :create, :message => "发表内容不能为空。"
    
  after_save :log_activity

private
  def log_activity
    add_activities(:item => self, :user => self.user)
  end
end

