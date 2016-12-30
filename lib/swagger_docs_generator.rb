# Information for this gem
require 'swagger_docs_generator/info'

# Class configuration
require 'swagger_docs_generator/configuration/configuration'
require 'swagger_docs_generator/configuration/configuration_info'

# Generator for swagger json file
require 'swagger_docs_generator/generator'
require 'swagger_docs_generator/metadata'

# Tasks
require 'swagger_docs_generator/railtie' if defined?(Rails)
