# frozen_string_literal: true

# :reek:TooManyConstants
module Swagger
  module Docs
    module Generator
      # # Configuration to gem
      #
      # This class it's a DSL class. For customize default json file.
      class Configuration
        attr_reader :version_swagger, :version_api, :base_apth, :attribute

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
    end
  end
end
