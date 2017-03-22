# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Metadata generated in swagger json file
  class Metadata
    ACCEPT = %i(title version contact description host schemes base_path
                swagger).freeze

    def initialize
      @config = nil
    end

    def construct_swagger_file
      hash = {}
      self.class.protected_instance_methods.each do |method|
        if ACCEPT.include?(method) || method.is_a?(Hash)
          hash.merge!(send(method)) unless @config.send(method).blank?
        end
      end
      hash
    end

    private

    # :reek:UtilityFunction
    def base_class_documentation
      "#{SwaggerDocsGenerator.version_ruby}::BaseDoc".constantize
    end

    def all_class_documentation
      base_class_documentation.subclasses
    end

    attr_reader :config
  end
end

require 'swagger_docs_generator/metadata/configuration'
require 'swagger_docs_generator/metadata/info'
require 'swagger_docs_generator/metadata/jsons'
require 'swagger_docs_generator/metadata/definition'
