# proc_chain_spec.rb - specs for ProcChain
require_relative 'spec_helper'
using ProcChain


describe Proc do
  describe 'returns ProcChainer' do
    let(:chain) { ->(x) { x } }
    subject { chain | ->(x){ x } }

    specify { subject.must_be_instance_of ProcChainer }
  end
end
