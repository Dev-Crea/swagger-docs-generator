# frozen_string_literal: true
namespace :swagger do
  desc 'Generate Swagger Documentation files'
  task docs: :environment do
    puts 'Create Swagger File in public/swagger.json'
    SwaggerDocsGenerator::Generator.new.generate_swagger_file
  end
end
