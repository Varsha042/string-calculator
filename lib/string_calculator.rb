class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = extract_delimiter(numbers)
    parsed_numbers = numbers.gsub(%r{//(.+)\n}, "").split(/[#{delimiter}]/).map(&:to_i)

    negatives = parsed_numbers.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    parsed_numbers.sum
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?("//")
      numbers.match(%r{//(.+)\n})[1].strip
    else
      ",|\n"
    end
  end
end
