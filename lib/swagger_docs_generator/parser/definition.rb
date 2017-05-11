# frozen_string_literal: true

# :reek:InstanceVariableAssumption
module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class ParserDefinition < Parser
    def initialize(name, &block)
      super(binding.of_callers[1].klass)
      @name = name
      instance_eval(&block)
    end

    def adding_definition
      json = JSON.parse(File.read(temporary_file))
      File.open(temporary_file, 'w') do |file|
        json['definitions'].merge!(construct_definition)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def type(text)
      @type = text
    end

    def properties(text = nil, &block)
      @properties = if block_given?
                      { @required.first => SubProperties.new(&block).construct }
                    else
                      text
                    end
    end

    def required(text)
      @required = text
    end

    def construct_definition
      { format_name => construct }
    end

    def construct
      {
        type: @type || 'object',
        required: @required || [],
        properties: @properties
      }
    end

    def format_name
      @name.tr(' ', '_').camelize
    end
  end
end

require 'swagger_docs_generator/parser/sub_definition'
