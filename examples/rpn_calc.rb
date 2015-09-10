#!/usr/bin/env ruby
# rpn_calc.rb - RPN style calculator

require_relative '../lib/proc_chain'

# (5 * 4) - (8 + 2)
def rpn_calc(strng)
  rpn = strng.split.map do |e|
    if e =~ /[\+\-\*\/]/
      e.to_sym
    else
      e.to_i
    end
  end

  puts 'intermediate:'
  p rpn
  a= rpn.map do |e|
    case e
      when Integer
        ->(x){ x.push e}
      when :+
        ->(x){ x.push(x.pop + x.pop)}

      when :-
        ->(x){ x.push(x.pop - x.pop)}

      when :*
        ->(x){ x.push(x.pop * x.pop)}

      when :/
        ->(x){ x.push(x.pop / x.pop)}
    end
  end





  chain = ProcChainer.new(->(x){x})
  chain.lambdas =  a

  result = chain.call([])
  puts result.pop
end

# main loop
puts "RPN Calculator"
puts 'Enter RPN notation: E.g. 5 4 + 1 2 - *'
puts '^C to end'
puts
while true do
  print 'rpn> '
  strng = gets.chomp
  puts rpn_calc(strng)
end

at_exit do
  puts 'Exiting ...'
  puts 'Thanks for using RPN Calculator!'
end

