# frozen_string_literal: true

require 'json'

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block paths in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#pathsObject
  class MetadataPath < Metadata
    def initialize
      # Reload all controller before parsing
      Rails.application.eager_load!
    end

    # Each controller parsed
    def construct_swagger_file
      path = File.join(Dir.pwd, 'public',
                       SwaggerDocsGenerator.configure_info.version)
      hash = {}
      controllers = ApplicationController.subclasses
      controllers.each do |controller|
        file = File.join(path, "#{controller.controller_name}.json")
        hash.merge!(JSON.parse(File.read(file))['paths']) if File.exist?(file)
      end
      { paths: hash }
    end
  end
end
