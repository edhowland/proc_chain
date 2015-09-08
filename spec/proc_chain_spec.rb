# proc_chain_spec.rb - specs for ProcChain
require_relative 'spec_helper'
using ProcChain


describe Proc do
  describe 'returns ProcChainer' do
    let(:chain) { ->(x) { x } }
    subject { chain | ->(x){ x } }

    specify { subject.must_be_instance_of ProcChainer }
  end

  describe '2 procs computing a sum' do
    let(:chain) { ->(x){ x + 1 } | ->(x){ x * 2 } }
    subject { chain.call 1 }

    specify { subject.must_equal 4 }
  end

  describe '3 lambdas' do
    let(:chain) { ->(x) { x + 1 } | ->(x){ x + 2 } | ->(x){ x + 3 } } 
    subject { chain.call 1 }

  specify { subject.must_equal 7 }
  end 
end
