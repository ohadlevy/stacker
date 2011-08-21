require 'test_helper'

class DeploymentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Deployment.new.valid?
  end
end
