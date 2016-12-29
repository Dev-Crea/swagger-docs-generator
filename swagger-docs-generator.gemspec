# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'swagger_docs_generator/info'

Gem::Specification.new do |spec|
  spec.name          = SwaggerDocsGenerator::GEM
  spec.version       = SwaggerDocsGenerator::VERSION
  spec.authors       = SwaggerDocsGenerator::AUTHORS
  spec.email         = SwaggerDocsGenerator::EMAILS
  spec.license       = SwaggerDocsGenerator::LICENSE

  spec.summary       = SwaggerDocsGenerator::SUMMARY
  spec.description   = SwaggerDocsGenerator::DESCRIPTION
  spec.homepage      = SwaggerDocsGenerator::HOMEPAGE

  spec.files         = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md']
  spec.files         += Dir['lib/**/*']

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'overcommit', '~> 0.34.2'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'reek', '~> 4.2', '>= 4.2.4'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'json-schema-rspec', '~> 0.0.4'

  spec.add_runtime_dependency 'rake', '~> 12.0'
end
