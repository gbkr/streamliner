# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'streamliner/version'

Gem::Specification.new do |spec|
  spec.name          = "streamliner"
  spec.version       = Streamliner::VERSION
  spec.authors       = ["Greg Baker"]
  spec.email         = ["gba311@gmail.com"]
  spec.summary       = %q{Identifies unused controllers in Rails applications.}
  spec.description   = %q{Lightweight solution to measure controller usage in Rails applications with the aim of identifying unused controllers.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
