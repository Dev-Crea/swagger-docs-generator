# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Metadata generated in swagger json file
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
      { external_docs: @config.external_docs }
    end

    def security
      { security: @config.security }
    end
  end
end
