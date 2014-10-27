require_relative '../lib/rpn/calculator'

rpn = RPN::Calculator.new
puts "Enter 'q' to quit."
loop do
  print '> '
  input_string = gets.chomp!
  exit if input_string.downcase == 'q'
  puts rpn.calculate(input_string)
end