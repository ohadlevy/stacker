module ApplicationHelper

  def edit_many_checkbox klass, association
    render :partial => 'common/edit_many_checkbox', :locals =>{ :klass => klass, :associations => association.all.delete_if{|e| e == klass}}
  end

end
