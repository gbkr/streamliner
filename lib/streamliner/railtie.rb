require 'rails'
require 'streamliner/counter'

module Streamliner
  class Railtie < Rails::Railtie
    initializer 'streamliner.action_controller' do
      ActiveSupport.on_load(:action_controller) do
        include Streamliner::ControllerInterceptor
      end
    end
  end
end
