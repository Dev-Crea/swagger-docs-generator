# frozen_string_literal: true

namespace :swagger do
  desc 'Generate Swagger Documentation files'
  # Execute task just for environment 'doc'
  task docs: :environment do
    swag = SwaggerDocsGenerator::Generator.new

    puts 'Imports documentation file...'
    swag.import_documentations

    puts 'Create Swagger File in :'
    puts swag.info_swagger_file

    puts
    puts 'Aggregate documentation data in `swagger.json` :'
    swag.info_controller_parser { |info| puts info }
    swag.generate_swagger_file

    puts
    puts 'Delete temporary file :'
    puts swag.info_swagger_temporary
    swag.delete_temporary_files
  end
end
