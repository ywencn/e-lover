require 'test_helper'

class ConnectionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Connection.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Connection.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Connection.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to connection_url(assigns(:connection))
  end
  
  def test_edit
    get :edit, :id => Connection.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Connection.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Connection.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Connection.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Connection.first
    assert_redirected_to connection_url(assigns(:connection))
  end
  
  def test_destroy
    connection = Connection.first
    delete :destroy, :id => connection
    assert_redirected_to connections_url
    assert !Connection.exists?(connection.id)
  end
end
