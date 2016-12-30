# frozen_string_literal: true

# :reek:Attribute
module SwaggerDocsGenerator
  # # Configuration to swagger json file
  #
  # This class it's a DSL class. For customize default json file.
  #
  # @example
  #   SwaggerDocsGenerator.configure do |config|
  #     config.swagger = '2.0.0'
  #     config.info = {
  #       info: {
  #         title: 'Topisime API',
  #         description: 'Super Topisime API for http://example.com service'
  #       }
  #     }
  #   end
  #
  #   SwaggerDocsGenerator.config
  #   => #<SwaggerDocsGenerator::Configuration:0x007f8ae49138d8
  #    @info={ ...  }
  #    @swagger='2.0.0'>
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md
  class Configuration
    attr_accessor :swagger, :base_path, :info, :schemes, :consumes, :produces,
                  :host, :paths, :definitions, :security_definitions,
                  :security, :tags, :external_docs

    SWAGGER = '1.0.4'

    # Initalize default value (and requried) for json swagger file
    def initialize
      @swagger = SWAGGER
      @info = ConfigurationInfo.new
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
