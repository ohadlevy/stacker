require 'test_helper'

class DeploymentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Deployment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Deployment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Deployment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to deployment_url(assigns(:deployment))
  end

  def test_edit
    get :edit, :id => Deployment.first
    assert_template 'edit'
  end

  def test_update_invalid
    Deployment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Deployment.first
    assert_template 'edit'
  end

  def test_update_valid
    Deployment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Deployment.first
    assert_redirected_to deployment_url(assigns(:deployment))
  end

  def test_destroy
    deployment = Deployment.first
    delete :destroy, :id => deployment
    assert_redirected_to deployments_url
    assert !Deployment.exists?(deployment.id)
  end
end
