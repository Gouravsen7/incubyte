require 'string_calculator'

describe StringCalculator do
  describe '#calculate action' do
    context 'when pass nothing in the parameter' do
      it 'returns message' do
        calculator = StringCalculator.new()
        expect(calculator.calculate).to eq("Please provide valid input")
      end
    end

    context 'when given an empty string' do
      it 'returns 0' do
        calculator = StringCalculator.new("")
        expect(calculator.calculate).to eq("0")
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        calculator = StringCalculator.new('5')
        expect(calculator.calculate).to eq("5")
      end
    end

    context 'when given two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new('2,3')
        expect(calculator.calculate).to eq("5")
      end
    end

    context 'when given multiple arguments with new line' do
      it "returns an sum of the valid inputs string with newline" do
        calc = StringCalculator.new("5,7,", "5\n5")
        expect(calc.calculate).to eq("12, 10")
      end
    end

    context 'when given multiple numbers separated by commas' do
      it 'returns the sum of all the numbers' do
        calculator = StringCalculator.new('2,3,5,7')
        expect(calculator.calculate).to eq("17")
      end
    end

    context 'when given numbers separated by a custom delimiter' do
      it 'returns the sum of all the numbers' do
        calculator = StringCalculator.new('//;\n1;2;3')
        expect(calculator.calculate).to eq("6")
      end
    end

    context 'when given numbers with negative numbers' do
      it 'returns an exception with the negative numbers in the error message' do
        calculator = StringCalculator.new('1,-2,3,-4')
        expect(calculator.calculate).to eq('Exception: negative numbers not allowed: -2, -4')
      end
    end

    context 'when given numbers with negative and delimiters numbers' do
      it 'returns an exception with the negative numbers in the error message' do
        calculator = StringCalculator.new('//;\n1;1,//-2,3//$#*()\n,-4')
        expect(calculator.calculate).to eq('Exception: negative numbers not allowed: -2, -4')
      end
    end

    context 'when given numbers with a custom delimiter of any length' do
      it 'returns the sum of all the numbers' do
        calculator = StringCalculator.new('//[***]\n1***2***3')
        expect(calculator.calculate).to eq("6")
      end
    end

    context 'when given multiple custom delimiters' do
      it 'returns the sum of all the numbers' do
        calculator = StringCalculator.new('//[*][%]\n5*2%3')
        expect(calculator.calculate).to eq("10")
      end
    end

    context 'when given valid inputs with any number of arguments provided' do
      it "returns the numbers when valid inputs are provided" do
        calculator = StringCalculator.new("1", "2", "3")
        expect(calculator.calculate).to eq("1, 2, 3")
      end
    end
  end
end
