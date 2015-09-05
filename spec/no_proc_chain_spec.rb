# no_proc_chain_spec.rb - specs for no_proc_chain

require_relative 'spec_helper'

describe Proc do
  describe 'should not respond to | method' do
    subject { ->{} }

  specify { subject.wont_respond_to :say }
  end
end
