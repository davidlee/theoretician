# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'theoretician/version'

Gem::Specification.new do |spec|
  spec.name          = "theoretician"
  spec.version       = Theoretician::VERSION
  spec.authors       = ["David Lee"]
  spec.email         = ["dav@davlee.com"]
  spec.summary       = %q{Explore music theory and build scale & chord charts for guitar and keys.}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "awesome_print"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "irb-history"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
