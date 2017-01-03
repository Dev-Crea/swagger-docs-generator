# frozen_string_literal: true

module SwaggerDocsGenerator
  class MetadataPath < Metadata
    def initialize
      @config = SwaggerDocsGenerator.configure_path
      # Reload all controller before parsing
      Rails.application.eager_load!
    end

    # Each cotnroller parsed
    def construct_swagger_file
      path = File.join(Dir.pwd, 'public',
                       SwaggerDocsGenerator.configure_info.version)
      hash = {}
      controllers = ApplicationController.subclasses
      controllers.each do |controller|
        if File.exist?(File.join(path, "#{controller.controller_name}.json"))
          puts "path: '#{SwaggerDocsGenerator.configure_info.version}/#{controller.controller_name}'"
          hash.merge!('$ref': controller.controller_name)
        end
      end
      { apis: hash }
    end

    protected

    def routes_1
      {
        '/pet': {
          'post': {
            summary: 'rsiygjvdhbj',
            response: {
              '405': {
                description: 'Invalid input'
              }
            }
          }
        }
      }
    end
  end
end
