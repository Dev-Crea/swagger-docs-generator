# frozen_string_literal: true

require 'json'

module SwaggerDocsGenerator
  # # Generate JSON file
  #
  # Create a json file for swagger-ui service
  #
  # @!attribute [r] swagger_file
  #   @return [String] the swagger file name with path
  class Generator
    attr_reader :swagger_file

    def initialize
      @file = 'swagger.json'
      @path = '/public'
      @swagger_file = File.join(Dir.pwd, @path, @file)
      @meta = Metadata.new
    end

    def generate_swagger_file
      delete_file_before
      swagger_file = File.new(@swagger_file, 'a+')
      swagger_file.puts(agregate_metadata)
      swagger_file.close
    end

    private

    attr_reader :meta

    def delete_file_before
      File.delete(@swagger_file) if File.exist?(@swagger_file)
    end

    def write_in_swagger_file
      @meta.construct_swagger_file
    end

    def agregate_metadata
      case defined?(Rails) && Rails.env
      when 'production' || 'test'
        write_in_swagger_file.to_json
      else
        JSON.pretty_generate write_in_swagger_file
      end
    end
  end
end
