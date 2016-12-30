# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Metadata generated in swagger json file
  class Metadata
    attr_reader :config

    def initialize
      @config = SwaggerDocsGenerator.configuration
    end

    def version_swagger
      { swagger: @config.version_swagger }
    end

    def base_path
      { basePath: @config.base_path }
    end

    def attributes
      { info: @config.attribute.merge!(version: @config.version_api) }
    end
  end
end
