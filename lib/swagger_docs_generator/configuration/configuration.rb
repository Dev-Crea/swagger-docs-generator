# frozen_string_literal: true

# :reek:Attribute
module SwaggerDocsGenerator
  # # Configuration to swagger json file
  #
  # This class it's a DSL class. For customize default json file.
  #
  # @example
  #   SwaggerDocsGenerator.configure do |config|
  #     config.swagger = '2.0.0'
  #   end
  #
  #   SwaggerDocsGenerator.config
  #   => #<SwaggerDocsGenerator::Configuration:0x007f8ae49138d8
  #    @swagger='2.0.0'>
  #
  # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md
  class Configuration
    # Accessors with default value
    attr_accessor :swagger, :cleanning, :base_path

    # Accessors without default value
    attr_accessor :schemes, :consumes, :produces, :host, :external_docs,
                  :security, :definitions, :doc_class, :doc_folder

    # Initalize default value (and requried) for json swagger file
    def initialize
      @swagger = '2.0'
      @base_path = '/'
      @cleanning = true
    end
  end

  class << self
    def configure
      block_given? ? yield(config) : config
    end

    def config
      @config ||= Configuration.new
    end

    def file_base
      File.join(@config.doc_folder, @config.doc_class)
    end

    def file_docs
      Dir[File.join(@config.doc_folder, '*.rb')]
    end

    def temporary_folder
      Rails.root.join('tmp', SwaggerDocsGenerator::GEM)
    end
  end
end
