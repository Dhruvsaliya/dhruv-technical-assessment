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

    it "for custom delimiters" do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
    end
    
    it "set error for negative numbers" do
      expect { StringCalculator.add("//;\n1;-2;3") }
        .to raise_error(StringCalculator::NegativeNumberError, "Negative numbers not allowed: -2")
      expect { StringCalculator.add("//;\n1;-2;3;-4") }
        .to raise_error(StringCalculator::NegativeNumberError, "Negative numbers not allowed: -2, -4")
      expect { StringCalculator.add("//;\n1;-2;3;-4.5") }
        .to raise_error(StringCalculator::NegativeNumberError, "Negative numbers not allowed: -2, -4.5")
    end
  end
end