# frozen_string_literal: true

module Swagger
  module Docs
    module Generator
      # # Generate JSON file
      #
      # Create a json file for swagger-ui service
      class Generator
        def initialize
          @file = 'swagger.json'
          @path = '/public'
          generate_swagger_file
        end

        private

        def generate_swagger_file
          swagger_file = File.new(File.join(Dir.pwd, @path, @file), 'a+')
          swagger_file.puts('Test')
          swagger_file.close
        end
      end
    end
  end
end
