# frozen_string_literal: true

require 'json'

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Generate metadata for block tag in swagger specification
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#tagObject
  class MetadataTag < Metadata
    # Create tag
    def construct_swagger_file
      path = File.join(Dir.pwd, 'public',
                       SwaggerDocsGenerator.configure_info.version)
      array = []
      controllers = ApplicationController.subclasses
      controllers.each do |controller|
        file = File.join(path, "#{controller.controller_name}.json")
        array.push(JSON.parse(File.read(file))['tags']) if File.exist?(file)
      end
      { tags: array }
    end
  end
end
