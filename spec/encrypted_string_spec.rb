require_relative 'spec_helper'

describe Mongoid::EncryptedString do
  let(:string) { 'foo' }
  subject { Mongoid::EncryptedString.new(string) }


  describe 'not setting a key' do
    it 'raises an error' do
      key = Mongoid::EncryptedString.config.key
      Mongoid::EncryptedString.config.key = nil
      Mongoid::EncryptedString.instance_variable_set :@aes, nil
      
      ->{
        subject.mongoize
      }.must_raise StandardError
      
      Mongoid::EncryptedString.config.key = key
    end
  end


  describe :mongoize do
    let(:value) { subject.mongoize }


    it 'returns database friendly value' do
      value.must_be_kind_of String
      value.wont_equal string
      (value.length > string.length).must_equal true
    end
  end


  describe 'self.mongoize' do
    let(:value) { Mongoid::EncryptedString.mongoize(subject) }


    it 'returns database friendly value' do
      value.must_be_kind_of String
      value.wont_equal string
    end
  end


  describe 'self.demongoize' do
    let(:value) { Mongoid::EncryptedString.demongoize(Mongoid::EncryptedString.mongoize(string)) }


    it 'returns a EncryptedString object' do
      value.must_be_kind_of Mongoid::EncryptedString
      value.must_equal string
    end
  end
end
