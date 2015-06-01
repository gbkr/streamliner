module StreamLiner
  class Counter

    attr_reader :cntl_name, :hit_count

    def initialize(cntl_name, hit_count)
      @cntl_name = cntl_name
      @hit_count = hit_count || {}
    end

    def add
      count = hit_count.fetch(cntl_name, 0)
      count += 1
      hit_count[cntl_name] = count
      hit_count
    end
  end
end
