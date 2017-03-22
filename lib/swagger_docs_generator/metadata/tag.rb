# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block tag in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#tagObject
  class MetadataTag < MetadataController
    # Create tag
    def construct_swagger_file
      array = []
      all_class_documentation.each do |controller|
        file = temporary_file(controller::CONTROLLER)
        array.push(JSON.parse(File.read(file))['tags']) if File.exist?(file)
      end
      { tags: array }
    end
  end
end
