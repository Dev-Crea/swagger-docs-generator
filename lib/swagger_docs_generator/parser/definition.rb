# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class ParserDefinition < Parser
    def initialize(name, &block)
      super(binding.of_callers[1].klass::CONTROLLER)
      @name = name
      instance_eval(&block)
    end

    def adding_defintion
      json = JSON.parse(File.read(controller_file))
      File.open(controller_file, 'w') do |file|
        json['definitions'].merge!(construct_definition)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def type(text)
      @type = text
    end

    def properties(text)
      @properties = text
    end

    def required(text)
      @required = text
    end

    def construct_definition
      { format_name => construct }
    end

    def construct
      element = {}
      element.merge!(type: @type || 'object')
      element.merge!(required: @required)       if @required.present?
      element.merge!(properties: @properties)   if @properties.present?
    end

    def format_name
      @name.tr(' ', '_').camelize
    end
  end
end
