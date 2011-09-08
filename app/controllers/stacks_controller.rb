class StacksController < InheritedResources::Base

  # Stack is created in two phases, this is a quick hack to avoid extra ajax calls
  def create
    create! { edit_resource_url }
    flash.clear
  end

  protected
  def resource
    @stack ||= end_of_association_chain.find_by_name!(params[:id])
  end
end
