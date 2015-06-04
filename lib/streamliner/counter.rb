require 'date'

module Streamliner
  class Counter

    attr_reader :controller, :counter

    def initialize(controller, counter)
      @controller = controller
      @counter = counter || {}
      ensure_start_date
    end

    def add
      count = (counter.fetch(controller, 0) + 1)
      counter[controller] = count
      counter
    end

    private

    def ensure_start_date
      counter[:start] ||= DateTime.now
    end
  end
end
