module Streamliner
  module ControllerInterceptor

  extend ActiveSupport::Concern

    included do
      append_before_action :count_controller
    end

    def count_controller
      controller = params[:controller]
      cached_count = Rails.cache.fetch(:controller_counter)
      updated_count = Streamliner::Counter.new(controller, cached_count).add
      Rails.cache.write(:controller_counter, updated_count)
      puts updated_count
    end
  end
end
