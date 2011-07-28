class ResourcesController < ApplicationController
  before_filter :find_by_name, :only => %w[ show update edit destroy]

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(params[:resource])
    if @resource.save
      redirect_to @resource, :notice => "Successfully created resource."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @resource.update_attributes(params[:resource])
      redirect_to @resource, :notice  => "Successfully updated resource."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_url, :notice => "Successfully destroyed resource."
  end
end
