require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_index
    get :index
    assert_redirected_to login_path
  end
  
  def text_index_with_user
    get :index, {}, {:user_id => users(2).id}
    assert_response :success
    assert_template "index"
  end
end
