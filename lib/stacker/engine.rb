require 'inherited_resources'
require 'delayed_job_active_record'
require 'uuidtools'

module Stacker
  class Engine < ::Rails::Engine
    initializer "stacker.load_app_instance_data" do |app|
      #Pull in all the migrations from Stacker to the application
      #TODO: get delayed_job out of here, so it goes
      app.config.paths['db/migrate'] += Stacker::Engine.paths['db/migrate'].existent
    end
  end
end
