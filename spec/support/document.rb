class Document
  include Mongoid::Document

  field :string, type: Mongoid::EncryptedString
end

class DocumentWithImplicitDefault
  include Mongoid::Document

  field :string, type: Mongoid::EncryptedString, default: 'foo'
end

class DocumentWithExplicitDefault
  include Mongoid::Document

  field :string, type: Mongoid::EncryptedString, default: ->{ Mongoid::EncryptedString.new('foo') }
end
