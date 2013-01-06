require 'active_support/all'
require 'gibberish'
require 'mongoid'

module Mongoid
  class EncryptedString < String
    def mongoize
      self.class.mongoize(self)
    end

    class << self
      attr_accessor :key

      def mongoize(string)
        aes.encrypt(string)
      end

      def demongoize(string)
        return if string.nil?
        
        new(aes.decrypt(string))
      end

      def config
        self
      end

    private
      def aes
        @aes ||= Gibberish::AES.new(key || raise(StandardError, "Mongoid::EncryptedString.config.key is not set"))
      end
    end
  end
end
