namespace :swagger do
  desc 'Generate Swagger Documentaiton files'
  task docs: [:environment] do
    Swagger::Docs::Generator::Generator.generate_swagger_file
  end
end
