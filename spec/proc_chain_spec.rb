# proc_chain_spec.rb - specs for ProcChain
require_relative 'spec_helper'
using ProcChain


describe Proc do
  describe 'should not respond to | method' do
    let(:sayer) { ->{true} }
    subject {sayer.| :test }

  specify { subject.must_equal 'in Proc: test' }
  end
end
