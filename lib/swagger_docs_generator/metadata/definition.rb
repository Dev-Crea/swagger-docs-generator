# frozen_string_literal: true

require 'swagger_docs_generator/parser/model'

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block definition in swagger file
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#definitions-object
  class MetadataDefinition < Metadata
    def initialize
      super
      @model = nil
    end

    def construct_swagger_file
      { definitions: search_definition }
    end

    private

    def search_definition
      find_models.merge!(find_in_controller)
    end

    def find_models
      hash = {}
      all_class_documentation.each do |controller|
        data = each_controller(controller::CONTROLLER)
        hash.merge!(data) unless data.empty?
      end
      hash
    end

    def find_in_controller
      hash = {}
      all_class_documentation.each do |controller|
        file = temporary_file(controller::CONTROLLER)
        hash.merge!(read_file(file)) if File.exist?(file)
      end
      hash
    end

    # :reek:UtilityFunction
    def read_file(file)
      json = JSON.parse(File.read(file))
      json.key?('definitions') ? json['definitions'] : {}
    end

    def each_controller(model_name)
      read_model(model_name) || {}
    end

    def read_model(model_name)
      @model = Model.new(model_name)
      contruct_hash
    rescue NameError => message
      puts "-> [Model] #{message.name} -- doesn't exist"
    end

    def contruct_hash
      {
        @model.name => {
          type: 'object',
          properties: @model.attribute_properties
        }
      }
    end

    # :reek:UtilityFunction
    def temporary_file(controller)
      File.join(SwaggerDocsGenerator.temporary_folder,
                "#{controller.controller_name}.json")
    end
  end
end
