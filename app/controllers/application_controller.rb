class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def find_by_name
    if params[:id]
      obj = controller_name.singularize
      not_found and return unless eval("@#{obj} = #{obj.camelize}.find_by_name(params[:id])")
    end
  end

  def not_found
    respond_to do |format|
      format.html { render "common/404", :status => 404 }
      format.json { head :status => 404}
      format.yaml { head :status => 404}
      format.yml { head :status => 404}
    end
    true
  end


end
