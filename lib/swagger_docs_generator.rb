# Information for this gem
require 'swagger/docs/generator/info'

# Class configuration
require 'swagger/docs/generator/configuration'

# Generator for swagger json file
require 'swagger/docs/generator/generator'
require 'swagger/docs/generator/metadata'

# Tasks
require 'swagger/docs/generator/task' if defined?(Rails)
