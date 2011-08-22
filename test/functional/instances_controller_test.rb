require 'test_helper'

class InstancesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Instance.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Instance.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Instance.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to instance_url(assigns(:instance))
  end

  def test_edit
    get :edit, :id => Instance.first
    assert_template 'edit'
  end

  def test_update_invalid
    Instance.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Instance.first
    assert_template 'edit'
  end

  def test_update_valid
    Instance.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Instance.first
    assert_redirected_to instance_url(assigns(:instance))
  end

  def test_destroy
    instance = Instance.first
    delete :destroy, :id => instance
    assert_redirected_to instances_url
    assert !Instance.exists?(instance.id)
  end
end
