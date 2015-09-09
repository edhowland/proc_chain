#!/usr/bin/env ruby
# rpn_calc.rb - RPN style calculator

require_relative '../lib/proc_chain'

a=[->(x){ x.push 5},
->(x){ x.push 4},
->(x){ x.push(x.pop * x.pop)}
]


chain = ProcChainer.new(->(x){x})
chain.lambdas =  a

result = chain.call([])
puts result.pop

