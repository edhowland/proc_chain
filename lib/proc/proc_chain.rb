# proc_chain.rb - module ProcChain

module ProcChain
  refine(Proc) do
    def say
      puts "in Proc Id"
    end
  end

end
