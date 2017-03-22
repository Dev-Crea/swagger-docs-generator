# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse Controller classes
  #
  # Parse controller classes in Rails application. It's create temporary file
  # and adding automaticaly tags element.
  class ParserController < Parser
    def initialize(description)
      super(binding.of_callers[1].klass)
      @description = description
      prepare_file
    end

    def adding_tag
      json = JSON.parse(File.read(temporary_file))
      File.open(temporary_file, 'w') do |file|
        json['tags'].merge!(construct_tags)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def prepare_file
      delete_file
      base_file = { paths: {}, tags: {}, definitions: {} }
      File.open(temporary_file, 'a+') { |file| file.puts(base_file.to_json) }
    end

    def delete_file
      File.delete(temporary_file) if File.exist?(temporary_file)
    end

    def construct_tags
      { name: tag_name, description: @description }
    end
  end
end
