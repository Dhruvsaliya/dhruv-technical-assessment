require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end
    
    it "returns the sum of multiple integers" do
      expect(StringCalculator.add("1, 2, 3, 4")).to eq(10)
    end
    
    it "returns the sum of multiple numbers including float values" do
      expect(StringCalculator.add("1, 2, 3, 4.5")).to eq(10.5)
    end

    it "handles new lines between numbers" do
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
  end
end