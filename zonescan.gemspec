# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zonescan/version'

Gem::Specification.new do |spec|
  spec.name          = Zonescan::PROJECT
  spec.version       = Zonescan::VERSION
  spec.authors       = ['georg']
  spec.email         = ['georg@gj.ee']
  spec.summary       = 'utility to scan list of domains for running services'
  spec.description   = 'utility to scan list of domains for running services'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency 'curb'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
