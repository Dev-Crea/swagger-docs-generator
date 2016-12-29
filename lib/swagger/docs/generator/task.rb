module Swagger
  module Docs
    module Generator
      class Task < Rails::Railtie
        rake_tasks do
          tasks = File.join(File.dirname(__FILE__), '../../../tasks/*.rake')
          Dir[tasks].each { |file_task| load file_task }
        end
      end
    end
  end
end
