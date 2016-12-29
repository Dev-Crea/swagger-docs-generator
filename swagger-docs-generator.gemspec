# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'swagger/docs/generator/info'

Gem::Specification.new do |spec|
  spec.name          = Swagger::Docs::Generator::GEM
  spec.version       = Swagger::Docs::Generator::VERSION
  spec.authors       = Swagger::Docs::Generator::AUTHORS
  spec.email         = Swagger::Docs::Generator::EMAILS
  spec.license       = Swagger::Docs::Generator::LICENSE

  spec.summary       = Swagger::Docs::Generator::SUMMARY
  spec.description   = Swagger::Docs::Generator::DESCRIPTION
  spec.homepage      = Swagger::Docs::Generator::HOMEPAGE

  spec.files         = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md']
  spec.files         += Dir['lib/**/*']

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'overcommit', '~> 0.34.2'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'reek', '~> 4.2', '>= 4.2.4'
  spec.add_development_dependency 'activesupport', '~> 4.2', '>= 4.2.7.1'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'aruba', '~> 0.14.2'
  spec.add_development_dependency 'json-schema', '~> 2.6', '>= 2.6.2'
end
