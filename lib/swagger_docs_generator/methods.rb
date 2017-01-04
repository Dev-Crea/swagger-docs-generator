# frozen_string_literal: true

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  module Methods
    # Create json file for controller
    def swagger_controller(controller, _description)
      p 'Parse controller'
      ctr_file = controller_file(controller)
      File.delete(ctr_file) if File.exist?(ctr_file)
      FileUtils.touch(ctr_file)
      # create_a_tag(controller, description)
    end

    # Complete json file with datas to method and controller, controller reading
    def swagger_doc(ctrl, action, data = {})
      p 'Parse action in controller'
      ctr_file = controller_file(ctrl)
      json = File.read(ctr_file)
      hash = json.blank? ? {} : JSON.parse(json)
      File.open(ctr_file, 'w') do |file|
        json = construct_routes(ctrl, action, data)
        file.puts(JSON.pretty_generate(hash.merge!(json)))
      end
    end

    private

    def controller_file(ctrl)
      path = File.join(Dir.pwd, '/public')
      version_api = SwaggerDocsGenerator.configure_info.version
      File.join(path, version_api, "#{ctrl.controller_name}.json")
    end

    def construct_routes(controller, action, data)
      extract = SwaggerDocsGenerator::Extractor.new(controller, action)
      verb = extract.verb
      path = extract.path
      {
        "#{path}": {
          "#{verb}": {
            tags: [ controller.controller_name ],
            summary: data[:summary],
            description: data[:description]
          }
        }
      }
    end

    def create_a_tag(controller, description)
      p 'Create tag to controller'
      ctr_name = controller.controller_name
      path = File.join(Dir.pwd, '/public')
      file = File.join(path, 'swagger.json')
      File.open(file, 'a+') do |json|
        puts File.read(f)
        hash = JSON.parse(File.read(json))
        hash[:Tags].push({ name: ctr_name, description: description })
        json.write(hash)
      end
    end
  end
end
