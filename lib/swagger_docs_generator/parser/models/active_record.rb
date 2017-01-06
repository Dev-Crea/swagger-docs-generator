# frozen_string_literal: true

# rubocop:disable Lint/Eval
module SwaggerDocsGenerator
  # # Parse Active Record model
  class ModelActiveRecord
    NAME = :active_record

    def initialize(model)
      @model = eval(model)
    end

    def attribute_properties
      propertie = {}
      @model.columns_hash.each do |name, _value|
        propertie.merge!(attribute_propertie(name))
      end
      propertie
    end

    private

    def attribute_propertie(name)
      { name => { type: @model.columns_hash[name].type } }
    end
  end
end
# rubocop:enable Lint/Eval
