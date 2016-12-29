# frozen_string_literal: true

module Swagger
  module Docs
    module Generator
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
        end

        def generate_swagger_file
          delete_file_before
          swagger_file = File.new(@swagger_file, 'a+')
          swagger_file.puts('{"swagger": "2.0.0", "basePath": "localhost:3000"}')
          swagger_file.close
        end

        private

        def delete_file_before
          File.delete(@swagger_file) if File.exist?(@swagger_file)
        end
      end
    end
  end
end
