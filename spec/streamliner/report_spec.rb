require 'spec_helper'

module Streamliner
  describe Report do
    let(:controllers) {
      %w[FirstController SecondController ThirdController, ForthController]
    }
    let(:count) {
      {
        'first' => 5,
        'second' => 3,
        'third' => 1
      }.merge({start: DateTime.parse('2040/1/1')})
    }

    it 'alerts the user when no usage data has been recorded' do
      report = Report.new(nil, controllers).generate
      expect(report).to eq("No controller usage recorded\n")
    end

    it 'generates a valid report when there is usage data' do
      report = Report.new(count, controllers).generate
      expect(report).to eq("\nSince  1 Jan 2040 00:00:00AM the following controller usage has occurred:\n\nController                    Hits           Percentage use\n-----------------------------------------------------------\n\nFirst                         5              55.56%\nSecond                        3              33.33%\nThird                         1              11.11%\n\nThe following controllers were not used and should be considered for removal:\n\nForth")
    end
  end
end
