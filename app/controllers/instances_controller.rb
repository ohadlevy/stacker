class InstancesController < InheritedResources::Base
  actions :show, :index, :destroy

  protected
  def resource
    @instance ||= end_of_association_chain.find_by_uuid!(params[:id])
  end
end
