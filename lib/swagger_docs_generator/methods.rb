# frozen_string_literal: true

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  # # Methods for controller
  #
  # Methods adding to controller parsing in rails appliation
  module Methods
    # Create json file for controller
    def swagger_controller(controller, description)
      ctr_file = controller_file(controller)
      prepare_file(ctr_file)
      create_a_tag(ctr_file, controller, description)
    end

    # Complete json file with datas to method and controller, controller reading
    def swagger_doc(ctrl, action, data = {})
      ctr_file = controller_file(ctrl)
      json = JSON.parse(File.read(ctr_file))
      File.open(ctr_file, 'w') do |file|
        hash = construct_routes(ctrl, action, data)
        control_presence(json, 'paths', hash)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def prepare_file(ctr_file)
      File.delete(ctr_file) if File.exist?(ctr_file)
      base_file = { paths: {}, tags: {} }
      File.open(ctr_file, 'a+') { |file| file.puts(base_file.to_json) }
    end

    def controller_file(ctrl)
      path = File.join(Dir.pwd, '/public')
      version_api = SwaggerDocsGenerator.configure_info.version
      File.join(path, version_api, "#{ctrl.controller_name}.json")
    end

    def construct_routes(controller, action, data)
      extract = SwaggerDocsGenerator::Extractor.new(controller, action)
      {
        "#{extract.path}": {
          "#{extract.verb}": {
            tags: [controller.controller_name],
            summary: data[:summary]
          }.merge!(responses?(data)).merge!(description?(data))
        }
      }
    end

    def construct_tags(controller_name, description)
      { name: controller_name, description: description }
    end

    def create_a_tag(ctr_file, controller, description)
      ctr_file = controller_file(controller)
      json = JSON.parse(File.read(ctr_file))
      File.open(ctr_file, 'w') do |file|
        hash = construct_tags(controller.controller_name, description)
        control_presence(json, 'tags', hash)
        file.puts(JSON.pretty_generate(json))
      end
    end

    def control_presence(json, value, hash)
      if json.values_at(value).blank?
        json[value] = hash
      else
        json[value].merge!(hash)
      end
    end

    def responses?(data)
      {
        responses: if data.key?(:responses)
                     data[:responses]
                   else
                     { ok: { description: 'Request successfully processed.' } }
                   end
      }
    end

    def description?(data)
      if data.key?(:description)
        { description: data[:description] }
      else
        {}
      end
    end
  end
end
