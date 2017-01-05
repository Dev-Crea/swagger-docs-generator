# frozen_string_literal: true
namespace :swagger do
  desc 'Generate Swagger Documentation files'
  task docs: :environment do
    puts 'Create Swagger File in public/swagger.json'
    swag = SwaggerDocsGenerator::Generator.new
    # Reload all controller before parsing
    Rails.application.eager_load!
    # Generates files
    swag.generate_swagger_file
    swag.delete_temporary_files
  end
end
