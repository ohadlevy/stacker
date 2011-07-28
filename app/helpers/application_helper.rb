module ApplicationHelper

  def edit_many klass, association
    render :partial => 'common/edit_many', :locals =>{ :klass => klass, :associations => association.all.delete_if{|e| e == klass}}
  end

end
