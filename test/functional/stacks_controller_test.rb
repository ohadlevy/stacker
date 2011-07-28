require 'test_helper'

class StacksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Stack.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Stack.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Stack.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to stack_url(assigns(:stack))
  end

  def test_edit
    get :edit, :id => Stack.first
    assert_template 'edit'
  end

  def test_update_invalid
    Stack.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Stack.first
    assert_template 'edit'
  end

  def test_update_valid
    Stack.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Stack.first
    assert_redirected_to stack_url(assigns(:stack))
  end

  def test_destroy
    stack = Stack.first
    delete :destroy, :id => stack
    assert_redirected_to stacks_url
    assert !Stack.exists?(stack.id)
  end
end
