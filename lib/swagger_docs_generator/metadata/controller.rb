# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # @abstract
  #   Abstract class for metadata provide to controlloer in Rails application
  class MetadataController < Metadata
    def initialize
      @file_path = File.join(Dir.pwd, 'public',
                             SwaggerDocsGenerator.configure_info.version)
      conf = SwaggerDocsGenerator.configure.base_controller
      @controllers = case conf
                     when String then ApplicationController.subclasses
                     when Array then conf.each(&:subclasses)
                     else conf.subclasses
                     end
    end

    private

    attr_accessor :controllers, :file_path
  end
end

require 'swagger_docs_generator/metadata/path'
require 'swagger_docs_generator/metadata/tag'
require 'swagger_docs_generator/metadata/definition'
