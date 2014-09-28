# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hca/version'

Gem::Specification.new do |spec|
  spec.name          = 'hca'
  spec.version       = Hca::VERSION
  spec.authors       = ['Andrei Gladkyi']
  spec.email         = ['arg@arglabs.net']
  spec.summary       = %q{Compiles HAML CoffeScript templates into a client-side JavaScript code}
  spec.homepage      = 'https://github.com/arg/hca'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'tilt'
  spec.add_dependency 'execjs'
  spec.add_dependency 'coffee-script'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rails', '>= 3.1.0'
end
