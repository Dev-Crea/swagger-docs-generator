# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'swagger_docs_generator/info'

Gem::Specification.new do |spec|
  version = SwaggerDocsGenerator::VERSION
  spec.version       = if ENV['TRAVIS'] && !ENV['TRAVIS_BRANCH'].eql?('master')
                         "#{version}-#{ENV['TRAVIS_BUILD_NUMBER']}"
                       else
                         version
                       end
  spec.name          = SwaggerDocsGenerator::GEM
  spec.authors       = SwaggerDocsGenerator::AUTHORS
  spec.email         = SwaggerDocsGenerator::EMAILS
  spec.license       = SwaggerDocsGenerator::LICENSE

  spec.summary       = SwaggerDocsGenerator::SUMMARY
  spec.description   = SwaggerDocsGenerator::DESCRIPTION
  spec.homepage      = SwaggerDocsGenerator::HOMEPAGE

  spec.files         = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md']
  spec.files         += Dir['lib/**/*']
  spec.files         += Dir['spec/**/*']

  spec.require_paths = ['lib']

  spec.post_install_message = SwaggerDocsGenerator::POST_INSTALL

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'overcommit', '~> 0.34.2'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'reek', '~> 4.2', '>= 4.2.4'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'json-schema-rspec', '~> 0.0.4'
  spec.add_development_dependency 'travis', '~> 1.8', '>= 1.8.4'
  spec.add_development_dependency 'rails', '~> 4.2', '>= 4.2.8'
  spec.add_development_dependency 'faker', '~> 1.7', '>= 1.7.3'
  spec.add_development_dependency 'activesupport', '~> 4.2'

  spec.add_runtime_dependency 'binding_of_callers', '~> 0.1.3'
end
