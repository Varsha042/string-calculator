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

    it 'handles negative numbers' do
      expect(calculator.add("1,-2,3")).to eq(2)
    end

    it 'handles large numbers' do
      expect(calculator.add("1000,2000,3000")).to eq(6000)
    end
  end
end
