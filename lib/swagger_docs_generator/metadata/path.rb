# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block paths in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#pathsObject
  class MetadataPath < MetadataController
    # Each controller parsed
    def construct_swagger_file
      hash = {}
      all_class_documentation.each do |controller|
        file = temporary_file(controller::CONTROLLER)
        hash.merge!(JSON.parse(File.read(file))['paths']) if File.exist?(file)
      end
      { paths: hash }
    end
  end
end
