# frozen_string_literal: true

# :reek:Attribute
module SwaggerDocsGenerator
  # # Configuration to swagger json file
  #
  # This class it's a DSL class. For customize default json file.
  #
  # @example
  #   SwaggerDocsGenerator.configure do |config|
  #     config.version_swagger = '2.0.0'
  #     config.version_api = '1.0.0'
  #     config.base_path = 'api.example.com'
  #     config.attribute = {
  #       info: {
  #         title: 'Topisime API',
  #         description: 'Super Topisime API for http://example.com service'
  #       }
  #     }
  #   end
  #
  #   SwaggerDocsGenerator.config
  #   => #<SwaggerDocsGenerator::Configuration:0x007f8ae49138d8
  #    @attribute={ ...  }
  #    @base_path="api.example.com"
  #    @version_api='1.0.0'
  #    @version_swagger='2.0.0'>
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md
  class Configuration
    attr_accessor :version_swagger, :version_api, :base_path, :attribute

    VERSION_SWAGGER = '1.0.4'
    VERSION_API = '1.0.0'
    BASE_PATH = 'localhost:3000'

    # Initalize default value for json swagger file
    def initialize
      @version_swagger = VERSION_SWAGGER
      @version_api = VERSION_API
      @base_path = BASE_PATH
      @attribute = {}
    end
  end

  class << self
    def configure
      block_given? ? yield(config) : config
    end

    def config
      @config ||= Configuration.new
    end

    alias :configuration :config
  end
end
