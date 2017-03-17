# frozen_string_literal: true

require 'swagger_docs_generator/parser/model'

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block definition in swagger file
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#definitions-object
  class MetadataDefinition < MetadataController
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

    # :reek:NilCheck
    def find_models
      hash = {}
      controllers.each do |controller|
        data = each_controller(controller)
        hash.merge!(data) unless data.nil?
      end
      hash
    end

    def find_in_controller
      hash = {}
      controllers.each do |controller|
        file = File.join(file_path, "#{controller.controller_name}.json")
        hash.merge!(read_file(file)) if File.exist?(file)
      end
      hash
    end

    # :reek:UtilityFunction
    def read_file(file)
      json = JSON.parse(File.read(file))
      json.key?('definitions') ? json['definitions'] : {}
    end

    def each_controller(controller)
      @model = Model.new(controller)
      contruct_hash
    rescue NameError => message
      puts "Error model name : #{message.name}"
    end

    def contruct_hash
      {
        @model.name => {
          type: 'object',
          properties: @model.attribute_properties
        }
      }
    end
  end
end
