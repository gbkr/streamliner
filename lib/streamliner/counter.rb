require 'date'

module Streamliner
  class Counter

    attr_reader :controller, :counter

    def initialize(controller, counter)
      @controller = controller
      @counter = counter || Hash.new(0)
      ensure_start_date
    end

    def add
      counter[controller] += 1
      counter
    end

    private

    def ensure_start_date
      if counter[:start] == 0
        counter[:start] = DateTime.now
      end
    end
  end
end
