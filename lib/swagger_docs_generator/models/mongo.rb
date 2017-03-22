# frozen_string_literal: true

# rubocop:disable Lint/Eval
module SwaggerDocsGenerator
  # # Parse Mongo model
  class ModelMongo
    NAME = :mongo
    TYPES = {
      'Array' =>            { type: 'string' },
      'BigDecimal' =>       { type: 'number', format: 'double' },
      'Mongoid::Boolean' => { type: 'boolean' },
      'Date' =>             { type: 'string', format: 'date' },
      'DateTime' =>         { type: 'string', format: 'date-time' },
      'Float' =>            { type: 'number', format: 'float' },
      'Hash' =>             { type: 'string' },
      'Integer' =>          { type: 'integer', format: 'int64' },
      'BSON::ObjectId' =>   { type: 'string' },
      'Object' =>           { type: 'string' },
      'BSON::Binary' =>     { type: 'string', format: 'binary' },
      'Range' =>            { type: 'string' },
      'String' =>           { type: 'string' },
      'Symbol' =>           { type: 'string' },
      'Time' =>             { type: 'string', format: 'date-time' },
      'TimeWithZone' =>     { type: 'string', format: 'date-time' }
    }.freeze

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
      {
        name => TYPES.fetch(@model.fields[name].type.to_s)
      }
    end
  end
end
# rubocop:enable Lint/Eval
