# frozen_string_literal: true

module SwaggerDocsGenerator
  module Methods
    def swagger_controller(_description)
      # Create json file for controller
      path = File.join(Dir.pwd, '/public')
      version_api = SwaggerDocsGenerator.configure_info.version
      json_file = "#{self.controller_name}.json"
      FileUtils.touch(File.join(path, version_api, json_file))
    end

    def swagger_doc(action, &block)
      puts "Action : #{action}"
      puts "Block : #{block}"
    end
  end
end
