module RPN
  class Calculator
    OPERATORS = %w(+ - * /)
    SYNTAX_ERROR_MESSAGE = 'Syntax error.'

    def initialize
      @numbers = []
    end

    def calculate(input_string)
      @input_string = input_string
      calculate_input ? @numbers.last : SYNTAX_ERROR_MESSAGE
    end

    private

    def calculate_input
      if input_is_number?
        @numbers.push input_to_numeric
      elsif input_is_valid_operation?
        calculate_operation
      end
    end

    def input_is_number?
      true if Float(@input_string) rescue false
    end

    def input_to_numeric
      (@input_string.include? '.') ? @input_string.to_f : @input_string.to_i
    end

    def input_is_valid_operation?
      @numbers.length >= 2 && (@input_string != '/' || @numbers[-1] != 0) if OPERATORS.include?(@input_string)
    end

    def calculate_operation
      operand = @input_string == '/' ? @numbers.pop.to_f : @numbers.pop
      @numbers << @numbers.pop.send(@input_string, operand)
    end
  end
end