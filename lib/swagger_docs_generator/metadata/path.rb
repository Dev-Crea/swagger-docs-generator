# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block paths in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#pathsObject
  class MetadataPath < MetadataController
    def initialize
      super
    end

    # Each controller parsed
    def construct_swagger_file
      hash = {}
      controllers.each do |controller|
        file = File.join(path, "#{controller.controller_name}.json")
        hash.merge!(JSON.parse(File.read(file))['paths']) if File.exist?(file)
      end
      { paths: hash }
    end
  end
end
