# mongoid-encrypted_string

`Mongoid::EncryptedString` defines a EncryptedString type for your Mongoid apps, which provides you a simple way to store encrypted information in your database.

`Mongoid::EncryptedString` uses `Gibberish::AES` internally to encrypt your data.

## Installation

In your Gemfile:

```ruby
gem 'mongoid-encrypted_string'
```

Add an initializer:

```ruby
Mongoid::EncryptedString.config.key = 'random'
```

## Usage

```ruby
class Document
  include Mongoid::Document

  field :string, type: Mongoid::EncryptedString
ends
```

```ruby
document = Document.create string: 'secret'
document.attributes => {"_id"=>"50e92506372fa248a6000002",
 "string"=>
  "U2FsdGVkX19oLIvsPM0WtUiqyFwp/TPOk5x5t/5S5q4qDkGqcoWy7FKtkxvj\nicT5\n" }
```

If you want to use `EncryptedString` directly instead of `Mongoid::EncryptedString`:

```ruby
class Document
  include Mongoid::Document

  field :string, type: EncryptedString
end
```

… your Gemfile must include a additional require statement:

```ruby
gem 'mongoid-encrypted_string', require: 'mongoid/encrypted_string/global'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

(The MIT license)

Copyright (c) 2013 Mario Uher

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
