# frozen_string_literal: true

require 'json'

# :reek:TooManyStatements and :reek:UtilityFunction
module SwaggerDocsGenerator
  class MetadataPath < Metadata
    def initialize
      @config = SwaggerDocsGenerator.configure_path
      # Reload all controller before parsing
      Rails.application.eager_load!
    end

    # Each controller parsed
    def construct_swagger_file
      path = File.join(SwaggerDocsGenerator.configure_info.version)
      hash = {}
      controllers = ApplicationController.subclasses
      controllers.each do |controller|
        file = File.join(Dir.pwd, 'public', path,
                         "#{controller.controller_name}.json")
        if File.exist?(file)
          hash.merge!(JSON.parse(File.read(file)))
        end
      end
      { paths: hash }
    end
  end
end
