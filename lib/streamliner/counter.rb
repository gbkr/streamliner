module Streamliner
  class Counter

    attr_reader :controller, :counter

    def initialize(controller, counter)
      @controller = controller
      @counter = counter || {}
    end

    def add
      count = (counter.fetch(controller, 0) + 1)
      counter[controller] = count
      counter
    end
  end
end
