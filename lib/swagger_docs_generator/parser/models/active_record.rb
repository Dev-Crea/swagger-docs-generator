# frozen_string_literal: true

# rubocop:disable Lint/Eval
module SwaggerDocsGenerator
  # # Parse Active Record model
  class ModelActiveRecord
    NAME = :active_record
    TYPES = {
      'binary' =>       { type: 'string', format: 'binary' },
      'boolean' =>      { type: 'boolean' },
      'date' =>         { type: 'string', format: 'date' },
      'datetime' =>     { type: 'string', format: 'date-time' },
      'decimal' =>      { type: 'number', format: 'double' },
      'float' =>        { type: 'number', format: 'float' },
      'integer' =>      { type: 'integer', format: 'int32' },
      'bigint' =>       { type: 'integer', format: 'int64' },
      'primary_key' =>  { type: 'integer', format: 'int32' },
      'references' =>   { type: 'integer', format: 'int32' },
      'string' =>       { type: 'string' },
      'text' =>         { type: 'string' },
      'time' =>         { type: 'string', format: 'date-time' },
      'timestamp' =>    { type: 'string', format: 'date-time' }
    }.freeze

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
      {
        name => TYPES[@model.columns_hash[name].type.to_s]
      }
    end
  end
end
# rubocop:enable Lint/Eval
