# chainer_spec.rb - specs for ProcChainer

require_relative 'spec_helper'

describe ProcChainer do
  let(:chainer) { ProcChainer.new( ->(x){ x }) } # this is like Unix cat. I.e. echo hi | cat
  describe '| method takes argument, returns self' do
    subject { chainer.| 1 }

    specify { subject.must_equal chainer }    
  end
end
