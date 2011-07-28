require 'test_helper'

class StackTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Stack.new.valid?
  end
end
