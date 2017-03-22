# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Parse classes
  #
  # @abstract Classes for parsing Rails classes
  #
  # @!attribute [r] controller
  #   It's a name of controller parsed
  # @!attribute [r] path
  #   It's a path to temporary file
  # @!attribute [r] version
  #   It's a version to API documentation parsed
  class Parser
    attr_reader :controller, :path, :version

    def initialize(controller)
      @controller = controller
    end

    def temporary_file
      File.join(SwaggerDocsGenerator.temporary_folder, controller_json)
    end

    private

    def controller_name
      @controller.controller_name
    end

    def controller_json
      "#{controller_name}.json"
    end
  end
end

require 'swagger_docs_generator/parser/controller'
require 'swagger_docs_generator/parser/action'
require 'swagger_docs_generator/parser/definition'
