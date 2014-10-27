require 'spec_helper'
require_relative '../lib/rpn/calculator'

describe RPN::Calculator do
  it 'calculates properly formatted examples' do
    examples = {
        %w(5 8 +) => 13,
        %w(-3 -2 * 5 +) => 11,
        %w(2 9 3 + *) => 24,
        %w(20 13 - 2 /) => 3.5
    }
    result = nil

    examples.each do |example, expected_result|
      rpn = RPN::Calculator.new
      example.each do |input|
        result = rpn.calculate(input)
      end

      expect(result).to eql(expected_result)
    end
  end

  it 'returns a syntax error message for improperly formatted examples' do
    examples = [
        %w(5 +),
        %w(7 0 /),
        %w(*),
        %w(NaN)
    ]
    result = nil

    examples.each do |example|
      rpn = RPN::Calculator.new
      example.each do |input|
        result = rpn.calculate(input)
      end

      expect(result).to eql(RPN::Calculator::SYNTAX_ERROR_MESSAGE)
    end
  end
end