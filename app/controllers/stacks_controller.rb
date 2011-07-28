class StacksController < ApplicationController
  before_filter :find_by_name, :only => %w[ show create update edit destroy]

  def index
    @stacks = Stack.all
  end

  def show
  end

  def new
    @stack = Stack.new
  end

  def create
    @stack = Stack.new(params[:stack])
    if @stack.save
      redirect_to @stack, :notice => "Successfully created stack."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @stack.update_attributes(params[:stack])
      redirect_to @stack, :notice  => "Successfully updated stack."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @stack.destroy
    redirect_to stacks_url, :notice => "Successfully destroyed stack."
  end
end
