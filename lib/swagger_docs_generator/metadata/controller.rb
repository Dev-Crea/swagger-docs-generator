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
      @conf = SwaggerDocsGenerator.configure.base_controller
      @controllers = case @conf
                     when String then string_controller
                     when Array then array_controller
                     when Class then class_controller
                     end
    end

    private

    attr_accessor :controllers, :file_path

    # :reek:UtilityFunction
    def string_controller
      ApplicationController.subclasses
    end

    def array_controller
      array = []
      @conf.map { |controller| array |= controller.subclasses }
      array
    end

    def class_controller
      @conf.subclasses
    end
  end
end

require 'swagger_docs_generator/metadata/path'
require 'swagger_docs_generator/metadata/tag'
require 'swagger_docs_generator/metadata/definition'
