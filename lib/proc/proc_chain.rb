# proc_chain.rb - module ProcChain

module ProcChain
  refine(Proc) do
    def | arg
      "in Proc: #{arg}"
    end
  end
end
