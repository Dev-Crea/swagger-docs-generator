# frozen_string_literal: true

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
