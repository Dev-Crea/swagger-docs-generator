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

    def construct_swagger_file
      hash = {}
      SwaggerDocsGenerator::Metadata.protected_instance_methods.each do |method|
        hash.merge!(send(method))
      end
      hash
    end

    protected

    def swagger
      { swagger: @config.swagger }
    end

    def base_path
      { basePath: @config.base_path }
    end

    def info
      { info: @config.info }
    end

    def schemes
      { schemes: @config.schemes }
    end

    def consumes
      { consumes: @config.consumes }
    end

    def produces
      { produces: @config.produces }
    end
  end
end
