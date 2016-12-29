namespace :swagger do
  desc 'Generate Swagger Documentation files'
  task docs: :environment do |_t, _args|
    puts 'Create Swagger File in public/swagger.json'
    # Swagger::Docs::Generator::Generator.generate_swagger_file
  end
end
