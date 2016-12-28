# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'swagger/docs/generator/info'

Gem::Specification.new do |spec|
  spec.name          = Swagger::Docs::Generator::GEM
  spec.version       = Swagger::Docs::Generator::VERSION
  spec.authors       = Swagger::Docs::Generator::AUTHORS
  spec.email         = Swagger::Docs::Generator::EMAILS

  spec.summary       = Swagger::Docs::Generator::SUMMARY
  spec.description   = Swagger::Docs::Generator::DESCRIPTION
  spec.homepage      = Swagger::Docs::Generator::HOMEPAGE

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md']
  spec.files         += Dir['lib/**/*']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
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
end
