$LOAD_PATH.unshift '../lib'
require 'proc_chain'

using ProcChain

p = ->(x){ puts x }
p p.respond_to? :say
p.say

