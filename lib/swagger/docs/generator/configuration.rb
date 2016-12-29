# frozen_string_literal: true

# :reek:Attribute
module Swagger
  module Docs
    module Generator
      # # Configuration to gem
      #
      # This class it's a DSL class. For customize default json file.
      class Configuration
        attr_accessor :version_swagger, :version_api, :base_path, :attribute

        def configure(&block)
          yield self
        end

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
