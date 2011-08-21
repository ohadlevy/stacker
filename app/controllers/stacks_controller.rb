class StacksController < InheritedResources::Base
  protected
  def resource
    @stack ||= end_of_association_chain.find_by_name!(params[:id])
  end
end
