require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Resource.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Resource.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Resource.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to resource_url(assigns(:resource))
  end

  def test_edit
    get :edit, :id => Resource.first
    assert_template 'edit'
  end

  def test_update_invalid
    Resource.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Resource.first
    assert_template 'edit'
  end

  def test_update_valid
    Resource.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Resource.first
    assert_redirected_to resource_url(assigns(:resource))
  end

  def test_destroy
    resource = Resource.first
    delete :destroy, :id => resource
    assert_redirected_to resources_url
    assert !Resource.exists?(resource.id)
  end
end
