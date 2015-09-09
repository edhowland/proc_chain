#!/usr/bin/env ruby
# rpn_calc.rb - RPN style calculator

require_relative '../lib/proc_chain'

# (5 * 4) - (8 + 2)
#  8 2 + 5 4 * -
a=[
->(x){ x.push 8},
->(x){ x.push 2},
->(x){ x.push(x.pop + x.pop)},
->(x){ x.push 5},
->(x){ x.push 4},
->(x){ x.push(x.pop * x.pop)},
->(x){ x.push(x.pop - x.pop)}
]


chain = ProcChainer.new(->(x){x})
chain.lambdas =  a

result = chain.call([])
puts result.pop

