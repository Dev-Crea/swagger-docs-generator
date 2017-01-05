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
        path_exist(json, construct_routes)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    # :reek:UtilityFunction
    def path_exist(json, hash)
      old_route = json['paths']

      keys_new = hash.keys[0]
      keys_old = old_route.keys[0]

      if keys_new.to_s.eql?(keys_old.to_s)
        old_route[keys_old].merge!(hash[keys_new])
      else
        old_route.merge!(hash)
      end
    end

    def construct_routes
      extract = Extractor.new(controller, @action)
      verb = extract.verb
      path = extract.path
      verb.eql?('put') ? route_update(path, verb) : route(path, verb)
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

    def route(path, verb)
      { "#{path}": { "#{verb}": super_hash } }
    end

    def route_update(path, verb)
      { "#{path}": { "#{verb}": super_hash }.merge!(patch: super_hash) }
    end
  end
end
