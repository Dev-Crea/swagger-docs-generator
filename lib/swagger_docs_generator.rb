# Information for this gem
require 'swagger_docs_generator/info'

# Class configuration
require 'swagger_docs_generator/configuration/configuration'
require 'swagger_docs_generator/configuration/configuration_info'
require 'swagger_docs_generator/configuration/configuration_path'

# Generator for swagger json file
require 'swagger_docs_generator/generator'
require 'swagger_docs_generator/metadata/metadata'
require 'swagger_docs_generator/metadata/configuration'
require 'swagger_docs_generator/metadata/info'
require 'swagger_docs_generator/metadata/path'

# Tasks
require 'swagger_docs_generator/railtie' if defined?(Rails)
