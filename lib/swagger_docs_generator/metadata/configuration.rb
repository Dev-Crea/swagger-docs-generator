# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block schema in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema
  class MetadataConfiguration < Metadata
    def initialize
      @config = SwaggerDocsGenerator.configure
    end

    protected

    def swagger
      { swagger: @config.swagger }
    end

    def base_path
      { basePath: @config.base_path }
    end

    def schemes
      { schemes: @config.schemes }
    end

    def host
      { host: @config.host }
    end

    def definitions
      { definitions: @config.definitions }
    end

    def external_docs
      { externalDocs: @config.external_docs }
    end

    def security
      { security: @config.security }
    end
  end
end
