# proc_chain.rb - module ProcChain

module ProcChain
  refine(Proc) do
    def say
      "in Proc"
    end
  end
end
