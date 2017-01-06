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
      find_models
      {}
    end

    private

    def find_models
      controllers.each do |controller|
        begin
          @model = Model.new(controller)
          p contruct_hash
        rescue NameError => message
          puts "Error model name : #{message.name}"
        end
      end
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
