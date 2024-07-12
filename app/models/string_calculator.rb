class StringCalculator
  class NegativeNumberError < StandardError; end
  
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    Rails.logger.debug "input nubers #{numbers}"

    # Check for custom delimiter
    delimiter = ','
    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] 
      numbers = numbers.gsub("\n", delimiter) 
    else
      numbers = numbers.gsub("\n", ',') 
    end

    Rails.logger.debug "Modified number after delimiter check: #{numbers}"

    split_pattern = Regexp.escape(delimiter)
    values = numbers.split(/[\s#{split_pattern}]+/).map(&:strip).map(&:to_f)
    Rails.logger.debug "values: #{values}"

    # Check for negative numbers
    negatives = values.select { |num| num < 0 }
    unless negatives.empty?
      raise NegativeNumberError, "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    sum = values.sum
    sum == sum.to_i ? sum.to_i : sum
  end
end