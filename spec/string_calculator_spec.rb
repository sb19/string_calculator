require_relative '../app/string_calculator'
RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number string' do
      calculator = StringCalculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers in the string' do
      calculator = StringCalculator.new
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'returns the sum of multiple numbers in the string' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    it 'returns the sum of numbers having newline between numbers' do
        calculator = StringCalculator.new
        expect(calculator.add('1\n2,3')).to eq(6)
    end

    it 'returns the sum of numbers having custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add('//;\n1;2')).to eq(3)
    end

    it 'raises an error for negative numbers and lists the negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add('2,-3,5,-10') }.to raise_error(RuntimeError, 'negative numbers not allowed -3,-10')
    end
  end
end