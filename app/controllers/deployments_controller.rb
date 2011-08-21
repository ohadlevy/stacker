class DeploymentsController < InheritedResources::Base
  protected
  def resource
    @deployment ||= end_of_association_chain.find_by_name!(params[:id])
  end

end
