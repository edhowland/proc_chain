# chainer_spec.rb - specs for ProcChainer

require_relative 'spec_helper'

describe ProcChainer do
  let(:chainer) { ProcChainer.new( ->(x){ x }) } # this is like Unix cat. I.e. echo hi | cat
  describe '| method takes argument, returns self' do
    subject { chainer.| 1 }

    specify { subject.must_equal chainer }    
  end

  describe 'call takes arg returns it' do
    subject { chainer.call :test }

    specify { subject.must_equal :test }
  end

  describe '2 lambdas chained' do
    let(:my_chain) { ProcChainer.new( ->(x){ x + 1 }) }
    let(:two_lambdas) { my_chain | ->(x){ x * 2 } }
    subject { two_lambdas.call(1) }

  specify { subject.must_equal 4 }
  end
end
