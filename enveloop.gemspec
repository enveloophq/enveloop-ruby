require File.expand_path('lib/enveloop/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'enveloop'
  spec.version               = LokaliseRails::VERSION
  spec.authors               = ['Ben Wyrosdick']
  spec.email                 = ['support@enveloop.com']
  spec.summary               = 'Envelope API wrapper'
  spec.description           = 'This gem provides a wrapper for the Envelope API.'
  spec.homepage              = 'https://github.com/enveloophq/ruby_enveloop'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'
end