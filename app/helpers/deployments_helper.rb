module DeploymentsHelper
  def resource_quantity q
    q > 0 ? q : 1
  end
end
