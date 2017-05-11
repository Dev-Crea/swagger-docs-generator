# frozen_string_literal: true

# :reek:InstanceVariableAssumption
module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class SubProperties < ParserDefinition
    def initialize(&block)
      instance_eval(&block)
    end

    def construct
      {
        type: @type || 'object',
        required: @required || [],
        properties: @properties
      }
    end

    private

    def properties(text)
      @properties = text
    end

    def type
      'object'
    end
  end
end
