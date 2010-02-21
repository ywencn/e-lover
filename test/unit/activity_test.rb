# == Schema Information
#
# Table name: activities
#
#  id         :integer(4)      not null, primary key
#  public     :boolean(1)
#  item_id    :integer(4)
#  item_type  :string(255)
#  user_id    :integer(4)
#  preview    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Activity.new.valid?
  end
end
