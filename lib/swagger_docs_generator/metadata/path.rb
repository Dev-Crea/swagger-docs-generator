# frozen_string_literal: true

module SwaggerDocsGenerator
  class MetadataPath < Metadata
    def initialize
      @config = SwaggerDocsGenerator.configure_path
    end

    def construct_swagger_file
      hash = {}
      self.class.protected_instance_methods.each do |method|
        hash.merge!(send(method))
      end
      { paths: hash }
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
