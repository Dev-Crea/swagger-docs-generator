# frozen_string_literal: true

module SwaggerDocsGenerator
  class MetadataInfo < Metadata
    def initialize
      @config = SwaggerDocsGenerator.configure_info
    end

    def construct_swagger_file
      { info: super }
    end

    protected

    def title
      { title: @config.title }
    end

    def version
      { version: @config.version }
    end

    def description
      { description: @config.description }
    end

    def terms_of_service
      { terms_of_service: @config.terms_of_service }
    end

    def contact
      { contact: @config.contact }
    end

    def license
      { license: @config.license }
    end
  end
end
