# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Metadata generated in swagger json file
  class Metadata
    attr_reader :config
    def initialize
      @config = SwaggerDocsGenerator.config
      puts "Config : #{@config.inspect}"
    end

    def version_swagger
      { swagger: @config.version_swagger }
    end

    def base_path
      { basePath: @config.base_path }
    end
  end
end
