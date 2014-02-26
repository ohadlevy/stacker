require 'inherited_resources'

module Stacker
  class Engine < ::Rails::Engine
    initializer "stacker.load_app_instance_data" do |app|
      #Pull in all the migrations from Stacker to the application
      app.config.paths['db/migrate'] += Stacker::Engine.paths['db/migrate'].existent
    end
    initializer 'foreman_tasks.register_plugin', :after => :finisher_hook do |app|
      Foreman::Plugin.register :"foreman-stacks" do
        requires_foreman '> 1.4'
        sub_menu :top_menu, :stacks, :caption => N_('Stacks'), :after => :hosts_menu do
          menu :top_menu, :stack,
               :caption  => N_('Stacks'),
               :url_hash => { :controller => 'stacks', :action => :index }

          menu :top_menu, :resources,
               :caption  => N_('Resources'),
               :url_hash => { :controller => 'resources', :action => :index }

          menu :top_menu, :deployments,
               :caption  => N_('Deployments'),
               :url_hash => { :controller => 'deployments', :action => :index }

          menu :top_menu, :instances,
               :caption  => N_('Instances'),
               :url_hash => { :controller => 'instances', :action => :index }
        end
      end
    end
  end
end
