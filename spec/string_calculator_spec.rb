require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself when a single number is passed' do
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(calculator.add("2,3")).to eq(5)
    end

    it 'returns the sum of multiple comma-separated numbers' do
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it 'raises an exception when negative numbers are included' do
      expect { calculator.add("1,-2,-5,3") }.to raise_error("negative numbers not allowed -2,-5")
    end

    it 'handles large numbers' do
      expect(calculator.add("1000,2000,3000")).to eq(6000)
    end

    it 'returns the sum of numbers separated by commas and newlines' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum of numbers with a custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end
  end
end
