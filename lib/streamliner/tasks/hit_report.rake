namespace :streamliner do
  desc 'Display count of controller hits'
  task :hit_report => :environment do
    controller_counter = Rails.cache.fetch(:controller_counter)
    start = controller_counter.delete(:start)
    puts "\nSince#{start.strftime('%e %b %Y %H:%M:%S%p')} the following controller hits have occured:\n\n"

    sorted_count = controller_counter.sort_by{|k,v| v}.reverse
    sorted_count.each do |controller, count|
      puts "#{controller.humanize}".ljust(30) + "#{count}"
    end
  end
end
