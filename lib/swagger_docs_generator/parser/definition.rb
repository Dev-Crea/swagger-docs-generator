# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class ParserDefinition < Parser
    def initialize(controller, name, parameters)
      super(controller)
      @name = name
      @parameters = parameters
    end

    def adding_defintion
      json = JSON.parse(File.read(controller_file))
      File.open(controller_file, 'w') do |file|
        json['definitions'].merge!(construct_definition)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def construct_definition
      { format_name => { type: 'object', properties: @parameters } }
    end

    def format_name
      @name.tr(' ', '_').camelize
    end
  end
end
