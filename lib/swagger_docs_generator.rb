# frozen_string_literal: true
# Information for this gem
require 'swagger_docs_generator/info'

# Class configuration
require 'swagger_docs_generator/configuration/configuration'
require 'swagger_docs_generator/configuration/configuration_info'

# Modules methods in a controller
require 'swagger_docs_generator/methods'

# Extractor verb
require 'swagger_docs_generator/extractor'

# Generator for swagger json file
require 'swagger_docs_generator/generator'
require 'swagger_docs_generator/metadata/metadata'

# Tasks
require 'swagger_docs_generator/railtie' if defined?(Rails)
