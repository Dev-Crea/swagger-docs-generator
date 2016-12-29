# frozen_string_literal: true

module Swagger
  module Docs
    module Generator
      class InitializerGenerator < Rails::Generators::Base
        desc 'Generate a initliazer for Swagger Docs Generator'
        INITIALIZER = <<-INIT
# frozen_string_literal: true

require 'swagger_docs_generator'

Swagger::Docs::Generator.configure do |config|
  config.version_swagger = '2.2.4'
  config.version_api = '1.0.0'
  config.base_path = 'localhost:3000'
  config.attribute = {
    info: {
      title: 'API example.com'
    }
  }
end
        INIT

        # Create initializer
        def copy_initializer
          initializer 'swagger_docs_generator.rb', INITIALIZER
        end
      end
    end
  end
end
