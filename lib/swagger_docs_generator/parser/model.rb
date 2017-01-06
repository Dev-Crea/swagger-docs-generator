# frozen_string_literal: true

require 'swagger_docs_generator/parser/models/mongo'
require 'swagger_docs_generator/parser/models/active_record'

module SwaggerDocsGenerator
  # Parser models
  class Model
    attr_reader :name

    def initialize(controller)
      @name = controller.controller_name.singularize.camelize
      @orm = if defined?(Mongoid)
               ModelMongo.new(name)
             else
               ModelActiveRecord.new(name)
             end
    end

    def attribute_properties
      @orm.attribute_properties
    end
  end
end
