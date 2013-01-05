require_relative 'spec_helper'

describe 'Mongoid::EncryptedString integration' do
  let(:string) { 'foo' }


  describe 'create document without any attributes' do
    subject { Document.create }


    it 'sets encrypted string to nil' do
      subject.string.must_be_nil
    end


    describe "when default is set to 'foo' }" do
      subject { DocumentWithImplicitDefault.create }


      it 'sets encrypted string to foo' do
        subject.string.must_equal string
      end
    end


    describe "when default is set to ->{ EncryptedString.new('foo') }" do
      subject { DocumentWithExplicitDefault.create }


      it 'sets encrypted string to foo' do
        subject.string.must_equal string
      end
    end
  end


  describe 'create document with attribute' do
    subject { Document.create(string: string) }


    it 'sets encrypted string to foo' do
      subject.string.must_equal string
    end
  end
end
