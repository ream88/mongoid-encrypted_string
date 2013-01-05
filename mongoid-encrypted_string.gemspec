$: << File.expand_path('../lib', __FILE__)
require 'mongoid/encrypted_string/version'

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-encrypted_string'
  gem.version       = Mongoid::EncryptedString::VERSION
  gem.authors       = 'Mario Uher'
  gem.email         = 'uher.mario@gmail.com'
  gem.homepage      = 'https://github.com/haihappen/mongoid-encrypted_string'
  gem.summary       = 'Encrypted string type for Mongoid.'
  gem.description   = 'Mongoid::EncryptedString defines an encrypted string type for your Mongoid apps.'

  gem.files         = `git ls-files`.split("\n")
  gem.require_path  = 'lib'

  gem.add_dependency 'gibberish'
  gem.add_dependency 'mongoid'
end
