# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class ParserController < Parser
    def initialize(description)
      super(binding.of_callers[1].klass::CONTROLLER)
      prepare_file
      @description = description
    end

    def adding_tag
      json = JSON.parse(File.read(controller_file))
      File.open(controller_file, 'w') do |file|
        json['tags'].merge!(construct_tags)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def prepare_file
      delete_file
      base_file = { paths: {}, tags: {}, definitions: {} }
      File.open(controller_file, 'a+') { |file| file.puts(base_file.to_json) }
    end

    def delete_file
      File.delete(controller_file) if File.exist?(controller_file)
    end

    def construct_tags
      { name: controller_name, description: @description }
    end
  end
end
