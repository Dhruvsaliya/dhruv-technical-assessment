class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    numbers.split(',').map(&:strip).map(&:to_f).sum
  end
end