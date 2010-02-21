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

require 'test_helper'

class StateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert State.new.valid?
  end
end
