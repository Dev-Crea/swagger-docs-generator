# frozen_string_literal: true

require 'swagger_docs_generator/parser/actions/actions'

module SwaggerDocsGenerator
  # # Parse action in controller classe to Rails application. It's adding
  # paths to swagger docs file.
  class ParserAction < Parser
    def initialize(controller, action, data)
      super(controller)
      @action = action
      @data = data
    end

    def adding_path
      json = JSON.parse(File.read(controller_file))
      File.open(controller_file, 'w') do |file|
        hash = construct_routes
        control_presence(json, 'paths', hash)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def construct_routes
      extract = Extractor.new(controller, @action)
      {
        "#{extract.path}": {
          "#{extract.verb}": {}.merge!(super_hash)
        }
      }
    end

    def super_hash
      hash = {}
      SwaggerDocsGenerator::Actions::Actions.descendants.each do |klass|
        hash.merge!(klass.new(expect_tag(klass)).hash)
      end
      hash
    end

    def expect_tag(klass)
      klass.eql?(Actions::Tags) ? controller_name : @data
    end
  end
end
