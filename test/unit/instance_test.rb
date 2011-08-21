require 'test_helper'

class InstanceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Instance.new.valid?
  end
end
