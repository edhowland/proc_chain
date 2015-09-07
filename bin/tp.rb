$LOAD_PATH.unshift '../lib'
require 'proc_chain'

using ProcChain

p = ->(x){ puts x }
p.say

