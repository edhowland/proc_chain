# proc_chainer.rb - class ProcChainer

# ProcChainer returned from Proc#|. accumulateslambdas in a chain so they can be called in a Unix/Elixr pipelline
class ProcChainer
  def initialize alambda
  end

  def | alambda
    self
  end
end
