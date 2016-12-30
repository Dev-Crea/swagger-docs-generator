# frozen_string_literal: true

module SwaggerDocsGenerator
  # # Metadata generated
  #
  # Metadata generated in swagger json file
  class Metadata
    def initialize
      @config = nil
    end

    def construct_swagger_file
      hash = {}
      self.class.protected_instance_methods.each do |method|
        hash.merge!(send(method)) unless @config.send(method).blank?
      end
      hash
    end

    private

    attr_reader :config
  end
end
