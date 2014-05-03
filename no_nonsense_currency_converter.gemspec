# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'no_nonsense_currency_converter/version'

Gem::Specification.new do |spec|
  spec.name          = 'no_nonsense_currency_converter'
  spec.version       = NoNonsenseCurrencyConverter::VERSION
  spec.authors       = ['Anshul mengi']
  spec.email         = ['anshulmengi@gmail.com']
  spec.description   = 'A very simple currency converter based on the Google Finance Converter'
  spec.summary       = 'WIP'
  spec.homepage      = 'https://github.com/anshulm/no_nonsense_currency_converter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
