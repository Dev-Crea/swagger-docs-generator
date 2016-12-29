# frozen_string_literal: true

# :reek:Attribute
module Swagger
  module Docs
    module Generator
      # # Configuration to swagger json file
      #
      # This class it's a DSL class. For customize default json file.
      #
      # @example
      #   Swagger::Docs::Generator.configure |config|
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
      # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md
      class Configuration
        attr_accessor :version_swagger, :version_api, :base_path, :attribute

        def configure(&block)
          yield self
        end

        # Initalize default value for json swagger file
        def initialize
          @version_swagger = '1.0.4'
          @version_api = '1.0.0'
          @base_path = 'localhost:3000'
          @attribute = {}
        end
      end

      class << self
        def configure
          yield config
        end

        def config
          @config ||= Configuration.new
        end

        alias :configuration :config
      end
    end
  end
end
