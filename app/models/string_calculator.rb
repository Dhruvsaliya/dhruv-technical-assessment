class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    Rails.logger.debug "input nubers #{numbers}"

    numbers = numbers.gsub("\n", ',')
    
    sum = numbers.split(/[\s,]+/).map(&:strip).map(&:to_f).sum

    sum == sum.to_i ? sum.to_i : sum
  end
end