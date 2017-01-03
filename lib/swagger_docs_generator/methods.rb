# frozen_string_literal: true

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  module Methods
    # Create json file for controller
    def swagger_controller(controller, description)
      FileUtils.touch(controller_file(controller))
      # create_a_tag(controller, description)
    end

    # Complete json file with datas to method and controller, controller reading
    def swagger_doc(ctrl, action, data = {})
      ctr_file = controller_file(ctrl)
      json = File.read(ctr_file)
      hash = json.blank? ? {} : JSON.parse(json)
      File.open(ctr_file, 'w') do |file|
        file.puts(hash.merge!(construct_routes(ctrl, action, data)).to_json)
      end
    end

    private

    def controller_file(ctrl)
      path = File.join(Dir.pwd, '/public')
      version_api = SwaggerDocsGenerator.configure_info.version
      File.join(path, version_api, "#{ctrl.controller_name}.json")
    end

    def construct_routes(controller, action, data)
      verb = SwaggerDocsGenerator::Extractor.new(controller, action).verb
      {
        "/#{action}": {
          verb => {
            tags: [ controller.controller_name ],
            summary: data[:summary],
            description: data[:description]
          }
        }
      }
    end

    def create_a_tag(controller, description)
      ctr_name = controller.controller_name
      path = File.join(Dir.pwd, '/public')
      file = File.join(path, "swagger.json")
      File.open(file, 'r+') do |f|
        puts File.read(f)
        hash = JSON.parse(File.read(f))
        hash[:Tags].push({ name: ctr_name, description: description })
        f.write(hash)
      end
    end
  end
end
