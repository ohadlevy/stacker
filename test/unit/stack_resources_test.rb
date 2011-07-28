require 'test_helper'

class StackResourcesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StackResources.new.valid?
  end
end
