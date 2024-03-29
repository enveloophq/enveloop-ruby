require_relative 'lib/enveloop/version'

Gem::Specification.new do |spec|
  spec.name          = "enveloop"
  spec.version       = Enveloop::VERSION
  spec.authors       = ["Ben Wyrosdick"]
  spec.email         = ["support@enveloop.com"]

  spec.summary       = "Envelope API wrapper"
  spec.description   = "This gem provides a wrapper for the Envelope API."
  spec.homepage      = "https://github.com/enveloophq/enveloop-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/enveloophq/enveloop-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/enveloophq/enveloop-ruby/blob/master/CHANGELOG.md"

  spec.add_dependency "faraday"
  spec.add_development_dependency "rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
