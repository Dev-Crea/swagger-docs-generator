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
  #   end
  #
  #   SwaggerDocsGenerator.config
  #   => #<SwaggerDocsGenerator::Configuration:0x007f8ae49138d8
  #    @swagger='2.0.0'>
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md
  class Configuration
    attr_accessor :swagger, :base_path, :schemes, :consumes, :produces,
                  :host, :paths, :definitions, :security_definitions,
                  :security, :tags, :external_docs

    SWAGGER = '2.0'

    # Initalize default value (and requried) for json swagger file
    def initialize
      @swagger = SWAGGER
    end
  end

  class << self
    def configure
      block_given? ? yield(config) : config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
