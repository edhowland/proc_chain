# proc_chain

eElixr-style lambda pipeline

## Abstract

 proc_chain is a small library to allow Procs to be chained together in a pipeline.
The output or return value is passed into the input or argument of the next lambda.
This allows for a very functional-like approach to coding.
In essence, it looks and works like a Unix shell pipe line
with '|' characters separating each lambda.


### Invoke Adventure magic spell

```

require 'proc_chain'
using ProcChain # Ruby 2.1+ style Refinements

(->(x){ 'x' } | ->(x){ x + 'y' } | ->(x){ x + 'zz' } | ->(x){ z + 'y'}).call '' # returns 'xyzzy'

```

## Features

- Proc chains can be any length - Allows for step-wise refinement of the input
- Proc chains can be themselves be chained - Constructing a complex pipeline is easy
- Proc chains behave like Procs and be passed to things that expect a single Proc

### Anti-features

- Proc is only monkey-patched when you need to construct the Proc chain
- Proc chains are agnostic with regardto input and output - Any Ruby object can be processed

## Debugging and Logging

 proc_chain ships with a support utility like
'tee' in the Unix world. Placing 'tee' between any points in a chain will prints
its input to stderr and returns it the link in the chain'
Stderr is thedefaultoutput stream for 'tee', but it can be chained by passing any
other File object.
E.g.:

```
 ->(x){ x + 1 } | tee($stdout) 
```

## How does it Work?


ProcChain actually is just syntacticsugar around the following Composition design pattern:


```

  chain=[->(x){ x + 1}, ->(x){ x + 3}]
chain.reduce(1) {|i, j| j.call(i) }

```


You can think of ProcChain as a mini-DSL for doing this kind of thing.
Also, the elements in a chain do not have to be Lambdas.
They onlyneed to be objects that respond to :call, taking a single
object and returning a single object.


## Examples/Use Cases

### RPN Calculator


See examples/rpn_calc.rb.
A simple REPL that asks for a string of RPN style notation.
Parses it with split and then mapsinto an array of
Procs that process a stack.
Then calls the ProcChain with a  as the stack.
Finally, it prints the final result popped off the stack.


Note: There is no syntax checking going on.

