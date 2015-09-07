# no_proc_chain_spec.rb - specs for no_proc_chain

require_relative 'spec_helper'

describe Proc do
  describe 'say method raises NoMethodError' do
    let(:sayer) { ->{ true } }
    subject {sayer.say }

  specify { ->{ subject }.must_raise NoMethodError }
  end
end
