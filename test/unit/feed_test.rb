# == Schema Information
#
# Table name: feeds
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  activity_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
