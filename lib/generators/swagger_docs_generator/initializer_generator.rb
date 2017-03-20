# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Generator Rails
  #
  # Create a initializer for rails application
  class InitializerGenerator < Rails::Generators::Base
    desc 'Generate a initializer for Swagger Docs Generator'
    INITIALIZER = <<-INIT
# frozen_string_literal: true

if Rails.env.doc?
  SwaggerDocsGenerator.configure do |config|
    config.swagger = '2.2.4'        # Swagger version used
    config.base_path = '/'          # Base to API
    config.host = 'localhost:3000'  # Host api
  end

  SwaggerDocsGenerator.configure_info do |info|
    info.title = 'API example.com'  # Title to API
    info.version = 'v1'             # Version to API
  end
end
    INIT

    # Create initializer
    def copy_initializer
      initializer 'swagger_docs_generator.rb', INITIALIZER
    end
  end
end
