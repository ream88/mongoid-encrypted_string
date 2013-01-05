require_relative 'spec_helper'

describe Mongoid::EncryptedString do
  before { require 'mongoid/encrypted_string/global' }


  it 'is available as ::EncryptedString too' do
    ::EncryptedString.must_be_same_as Mongoid::EncryptedString
  end
end
