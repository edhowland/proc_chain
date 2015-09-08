# proc_chain.rb - module ProcChain

module ProcChain
  refine(Proc) do
    def | arg
    ProcChainer.new(arg)
    end
  end
end
