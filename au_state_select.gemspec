# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'au_state_select/version'

Gem::Specification.new do |spec|
  spec.name          = "au_state_select"
  spec.version       = AuStateSelect::VERSION
  spec.authors       = ["Ben Zhang"]
  spec.email         = ["bzbnhang@gmail.com"]
  spec.summary       = %q{Provides a simple helper to get an HTML select list of Australia states.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
