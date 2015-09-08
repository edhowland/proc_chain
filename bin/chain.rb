#!/usr/bin/env ruby
# chain.rb - test various Proc chains

require_relative '../lib/proc_chain'

using ProcChain

(->(x){ x * 2} | tee | ->(x){ x * 4 } | tee).call 1


