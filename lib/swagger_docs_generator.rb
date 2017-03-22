# frozen_string_literal: true

# Dependencies
require 'json'
require 'binding_of_callers'

# Information for this gem
require 'swagger_docs_generator/info'

# Class configuration
require 'swagger_docs_generator/configuration/configuration'
require 'swagger_docs_generator/configuration/configuration_info'

# Modules methods in a controller
require 'swagger_docs_generator/methods'

# Models reader (ORM)
require 'swagger_docs_generator/models/mongo'
require 'swagger_docs_generator/models/active_record'

# Parser class
require 'swagger_docs_generator/parser/parser'

# Extractor verb
require 'swagger_docs_generator/extractor'

# Generator for swagger json file
require 'swagger_docs_generator/generator'
require 'swagger_docs_generator/metadata/metadata'

# Tasks
require 'swagger_docs_generator/railtie' if defined?(Rails)
