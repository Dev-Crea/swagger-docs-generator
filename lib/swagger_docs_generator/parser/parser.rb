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
      @path = File.join(Dir.pwd, 'public')
      @version = SwaggerDocsGenerator.configure_info.version
    end

    def controller_file
      File.join(@path, @version, "#{controller_name}.json")
    end

    private

    def controller_name
      @controller.controller_name
    end

    # :reek:UtilityFunction
    def control_presence(json, value, hash)
      if json.values_at(value).blank?
        json[value] = hash
      else
        json[value].merge!(hash)
      end
    end
  end
end

require 'swagger_docs_generator/parser/controller'
require 'swagger_docs_generator/parser/action'
