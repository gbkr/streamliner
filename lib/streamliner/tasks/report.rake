namespace :streamliner do
  desc 'Display count of controller hits'
  task :report => :environment do
    Rails.application.eager_load!
    controller_list = ApplicationController.subclasses

    controller_counter = Rails.cache.fetch(:controller_counter)
    start = controller_counter.delete(:start)
    puts "\nSince#{start.strftime('%e %b %Y %H:%M:%S%p')} the following controller hits have occured:\n\n"

    sorted_controllers = controller_counter.sort_by{|k,v| v}.reverse.to_h
    sorted_controllers.each do |controller, count|
      puts "#{controller.humanize}".ljust(30) + "#{count}"
    end

    unused_controllers = controller_list.map { |e| e.name.downcase.split('controller')[0] } - sorted_controllers.keys
    if unused_controllers.any?
      puts "\nThe following controllers were not used and should be considered for removal:\n\n"
      puts unused_controllers.map {|e| e.humanize }.to_sentence
    else
      puts "\nAll controllers were used and none are suggested for removal."
    end
  end
end
