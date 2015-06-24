namespace :streamliner do
  desc 'Display count of controller hits'
  task :report => :environment do
    Rails.application.eager_load!
    controller_list = ApplicationController.subclasses
    controller_counter = Rails.cache.fetch(:streamliner_counter)
    report = Streamliner::Report.new(controller_counter, controller_list).generate
    puts report
  end
end
