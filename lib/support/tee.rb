# tee.rb - def tee


# Unix like 'tee' utility. Prints its input on stderr by default, then returns input
def tee(o=$stderr)
  ->(x){ o.puts x; x }
end
