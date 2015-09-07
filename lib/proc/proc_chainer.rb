# proc_chainer.rb - class ProcChainer

# ProcChainer returned from Proc#|. accumulateslambdas in a chain so they can be called in a Unix/Elixr pipelline
class ProcChainer
  def initialize alambda
    @lambdas = [alambda]
  end

  def | alambda
    @lambdas << alambda
    self
  end

  def call arg
    @lambdas.reduce(arg) {|val, lamb| lamb.call(val) }
  end
end
