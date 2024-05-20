class StringCalculator

  def initialize(*numbers)
    @invalid_inputs = []
    @negative_numbers = []
    @inputs = numbers
  end

  def calculate()
    return "Please provide valid input" if @inputs.empty?

    @inputs.compact.each do |num|
      @invalid_inputs << num if num.end_with?(",\n")
      @negative_numbers += num.scan(/-\d+/)
    end

    return "Exception: invalid inputs #{@invalid_inputs.join(', ')}" unless @invalid_inputs.empty?
    return "Exception: negative numbers not allowed: #{@negative_numbers.join(', ')}" unless @negative_numbers.empty?

    output = @inputs.map {|n| n.scan(/\d+/).sum(&:to_i) }.join(', ')
    return output
  end
end