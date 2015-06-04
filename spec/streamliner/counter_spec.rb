require 'spec_helper'

module Streamliner
  describe Counter do
    let(:counter) { Streamliner::Counter }
    let(:params_hash_1) { "home" }
    let(:params_hash_2) { "session" }

    it 'returns a hash' do
      result = counter.new(params_hash_1, nil).add
      expect(result).to be_a(Hash)
    end

    it 'counts controllers passed in' do
      result = counter.new(params_hash_1, {}).add
      result = counter.new(params_hash_1, result).add
      result = counter.new(params_hash_2, result).add
      result.delete(:start)
      expect(result).to eq({"home" => 2, "session" => 1})
    end
  end
end
