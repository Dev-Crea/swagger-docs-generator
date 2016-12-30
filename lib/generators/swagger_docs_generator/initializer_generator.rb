# frozen_string_literal: true

module SwaggerDocsGenerator
  class InitializerGenerator < Rails::Generators::Base
    desc 'Generate a initializer for Swagger Docs Generator'
    INITIALIZER = <<-INIT
# frozen_string_literal: true

SwaggerDocsGenerator.configure do |config|
  config.swagger = '2.2.4'
  config.base_path = '/'
  config.host = 'localhost:3000'
end

SwaggerDocsGenerator.configure_info do |info|
  info.title = 'API example.com'
  info.version = '1.0.0'
end
    INIT

    # Create initializer
    def copy_initializer
      initializer 'swagger_docs_generator.rb', INITIALIZER
    end
  end
end
