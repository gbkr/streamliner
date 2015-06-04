require 'rails'
require 'streamliner/counter'

module Streamliner
  class Railtie < Rails::Railtie
    initializer 'streamliner.action_controller' do
      ActiveSupport.on_load(:action_controller) do
        include Streamliner::ControllerInterceptor
      end
    end

    rake_tasks do
      load 'streamliner/tasks/report.rake'
      load 'streamliner/tasks/hit_report.rake'
    end
  end
end
