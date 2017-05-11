# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Generator Rails
  #
  # Create a initializer for rails application
  class EnvironmentGenerator < Rails::Generators::Base
    desc 'Generate a Environment `doc` for Swagger Docs Generator'
    ENVIRONMENT = <<-INIT
  # frozen_string_literal: true

  Rails.application.configure do
    # Do not eader load code on boot.
    config.eager_load = false
  end
    INIT

    # Create a new environment
    def copy_environment
      create_file 'config/environments/doc.rb', ENVIRONMENT
    end
  end
end
