# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # @abstract
  #   Abstract class for metadata provide to controlloer in Rails application
  class MetadataController < Metadata
    private

    # :reek:UtilityFunction
    def temporary_file(controller)
      File.join(SwaggerDocsGenerator.temporary_folder,
                "#{controller.controller_name}.json")
    end
  end
end

require 'swagger_docs_generator/metadata/path'
require 'swagger_docs_generator/metadata/tag'
require 'swagger_docs_generator/metadata/definition'
