class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    sum = numbers.split(',').map(&:strip).map(&:to_f).sum

    sum == sum.to_i ? sum.to_i : sum
  end
end