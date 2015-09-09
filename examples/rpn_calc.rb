#!/usr/bin/env ruby
# rpn_calc.rb - RPN style calculator

require_relative '../lib/proc_chain'

# (5 * 4) - (8 + 2)
#  8 2 + 5 4 * -

rpn = [8, 2, :+, 5, 4, :*, :-]
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

