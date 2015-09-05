# no_proc_chain_spec.rb - specs for ProcChain
require_relative 'spec_helper'
using ProcChain

describe Proc do
  describe 'should not respond to | method' do
    subject { ->{} }

  specify { subject.wont_respond_to :say }
  end
end
