module Streamliner
  class Report
    attr_reader :controller_count, :controller_list, :controllers_by_use
    attr_accessor :report

    def initialize(controller_count, controller_list)
      @controller_count = controller_count
      @controller_list = controller_list
      @report = String.new
    end

    def generate
      if data_recorded?
        add_start_date
        add_header
        add_usage
        add_unused_code
      else
        no_data_message
      end
      report
    end

    private

    def add_start_date
      start = controller_count.delete(:start)
      report << "\nSince #{start.strftime('%e %b %Y %H:%M:%S%p')} the following" +
        " controller usage has occurred:\n\n"
    end

    def data_recorded?
      !controller_count.nil?
    end

    def no_data_message
      report << "No controller usage recorded\n"
    end

    def add_header
      headers = ""
      headers << "Controller".ljust(pleasing_spacing)
      headers << "Hits".ljust(15)
      headers << "Percentage use\n"
      report << headers
      report << "-" * headers.chomp.length + "\n\n"
    end

    def sorted_controllers
      controller_by_use ||= controller_count.sort_by{|k,v| v}.reverse.to_h
    end

    def add_usage
      sorted_controllers.each do |controller, count|
        report << "#{controller.capitalize}".ljust(pleasing_spacing) +
          "#{count}".ljust(15) + "#{usage_percentage(count)}%\n"
      end
    end

    def pleasing_spacing
      controller_list.map { |e| e.to_s.length }.max + 14
    end

    def usage_percentage count
      sum = controller_count.values.reduce(:+)
      ((count.to_f / sum) * 100).round(2)
    end

    def add_unused_code
      if unused_controllers.any?
        report << "\nThe following controllers were not used and should be considered for removal:\n\n"
        no_usage = unused_controllers.map {|e| e.capitalize }
        report << (Array.method_defined?(:to_sentence) ? no_usage.to_sentence : no_usage.join(', '))
      else
        report << "\nAll controllers were used and none are suggested for removal.\n\n"
      end
    end

    def unused_controllers
      controller_list.map { |e|
        e.to_s.downcase.split('controller')[0] } - sorted_controllers.keys
    end
  end
end
