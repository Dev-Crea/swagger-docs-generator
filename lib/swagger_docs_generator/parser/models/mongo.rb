# frozen_string_literal: true

# rubocop:disable Lint/Eval
module SwaggerDocsGenerator
  # # Parse Mongo model
  class ModelMongo
    NAME = :mongo

    def initialize(model)
      @model = eval(model)
    end

    def attribute_properties
      propertie = {}
      @model.fields.each do |name, _value|
        propertie.merge!(attribute_propertie(name))
      end
      propertie
    end

    private

    def attribute_propertie(name)
      { name => { type: @model.fields[name].type } }
    end
  end
end
# rubocop:enable Lint/Eval
