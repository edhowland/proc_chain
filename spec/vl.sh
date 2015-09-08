#!/bin/bash
# functions for vr ../lib/xxxx/file.rb

vp()
{
  vr "../lib/proc/$1"
}

lirb()
{
  irb -r ../lib/proc_chain.rb
}
