#!/usr/bin/env ruby
# rpn_calc.rb - RPN style calculator

require_relative '../lib/proc_chain'

# (5 * 4) - (8 + 2)
strng =   '8 2 + 5 4 * -'
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

