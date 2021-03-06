# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Rake action
  #
  # Create an action for rails apps and executed with rake
  class Railtie < Rails::Railtie
    railtie_name :swagger

    rake_tasks do
      tasks = File.join(File.dirname(__FILE__), '../tasks', '*.rake')
      Dir[tasks].each { |file_task| load file_task }
    end
  end
end
