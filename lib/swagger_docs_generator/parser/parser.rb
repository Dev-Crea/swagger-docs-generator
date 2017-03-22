# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse classes
  #
  # @abstract Classes for parsing Rails classes
  #
  # @!attribute [r] controller
  #   It's a name of controller parsed
  # @!attribute [r] tag_name
  #   It's a tag attaching to controller
  class Parser
    attr_reader :controller, :tag_name

    def initialize(klass)
      @controller = klass::CONTROLLER
      @tag_name = defined?(klass::TAG) ? klass::TAG : controller_name
    end

    def temporary_file
      File.join(SwaggerDocsGenerator.temporary_folder, tmp_json)
    end

    private

    def controller_name
      @controller.controller_name
    end

    def tmp_json
      "#{@tag_name}.json"
    end
  end
end

require 'swagger_docs_generator/parser/controller'
require 'swagger_docs_generator/parser/action'
require 'swagger_docs_generator/parser/definition'
