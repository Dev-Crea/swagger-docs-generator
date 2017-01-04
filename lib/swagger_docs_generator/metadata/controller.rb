# frozen_string_literal: true

require 'json'

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # @abstract
  #   Abstract class for metadata provide to controlloer in Rails application
  class MetadataController < Metadata
    def initialize
      # Reload all controller before parsing
      Rails.application.eager_load!
      @path = File.join(Dir.pwd, 'public',
                        SwaggerDocsGenerator.configure_info.version)
      @controllers = ApplicationController.subclasses
    end

    private

    attr_accessor :controllers, :path
  end
end

require 'swagger_docs_generator/metadata/path'
require 'swagger_docs_generator/metadata/tag'
