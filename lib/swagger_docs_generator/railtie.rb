# frozen_string_literal: true

module SwaggerDocsGenerator
  class Railtie < Rails::Railtie
    railtie_name :swagger

    rake_tasks do
      puts 'Loading tasks'
      # tasks = File.join(File.dirname(__FILE__), 'tasks', '*.rake')
      # Dir[tasks].each { |file_task| load file_task }
      # Dir.glob('tasks/*.rake').each { |file_task| load file_task }

      namespace :swagger do
        desc 'Generate Swagger Documentation files'
        task :docs do |_t, _args|
          puts 'Create Swagger File in public/swagger.json'
        end
      end
    end
  end
end
