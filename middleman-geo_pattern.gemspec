# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-geo_pattern/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-geo_pattern'
  spec.version       = Middleman::GeoPattern::VERSION
  spec.authors       = ['Max Meyer']
  spec.email         = ['dev@fedux.org']
  spec.summary       = 'Integrate geo_pattern-gem into middleman'
  spec.homepage      = 'https://github.com/fedux-org/middleman-geo_pattern'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'middleman-core', '>= 3.3.10'
  spec.add_runtime_dependency 'geo_pattern', '~> 1.4.0'
end
