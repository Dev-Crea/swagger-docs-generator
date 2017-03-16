# frozen_string_literal: true

namespace :swagger do
  desc 'Generate Swagger Documentation files'
  task docs: :environment do
    swag = SwaggerDocsGenerator::Generator.new

    puts 'Create Swagger File in :'
    puts swag.info_swagger_file

    # Reload all controller before parsing
    Rails.application.eager_load!

    # Generates files
    puts 'Generate doc file :'
    swag.generate_swagger_file

    puts 'Delete temporary file :'
    puts swag.info_swagger_temporary
    swag.delete_temporary_files
  end
end
