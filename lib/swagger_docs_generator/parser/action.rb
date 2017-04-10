# frozen_string_literal: true

require 'swagger_docs_generator/parser/actions/actions'

# :reek:UtilityFunction
# :reek:InstanceVariableAssumption
# :reek:TooManyInstanceVariables
# :reek:TooManyStatements

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
module SwaggerDocsGenerator
  # # Parse action in controller classe to Rails application. It's adding
  # paths to swagger docs file.
  class ParserAction < Parser
    def initialize(action, &block)
      super(binding.of_callers[1].klass)
      @action = action
      @parameter = []
      @response = {}
      instance_eval(&block)
    end

    def adding_path
      create_file unless File.exist?(temporary_file)
      json = JSON.parse(File.read(temporary_file))
      File.open(temporary_file, 'w') do |file|
        path_exist(json, construct_routes)
        file.puts(JSON.pretty_generate(json))
      end
    end

    private

    def path_exist(json, hash)
      old_route = json['paths']

      keys_new = hash.keys[0]
      index = keys_new.to_s

      if !old_route.blank? && old_route.keys.include?(index)
        old_route[index].merge!(hash[keys_new])
      else
        old_route.merge!(hash)
      end
    end

    def construct_routes
      extract = Extractor.new(controller, @action)
      @verb = extract.verb
      @route = extract.path
      @verb.eql?('put') ? route_update : route
    end

    def construct_path
      element = {}
      summary_text = @summary.present? ? @summary : @action.to_s.humanize
      element.merge!(summary: summary_text)
      element.merge!(description: @description)   if @description.present?
      element.merge!(parameters: @parameter)      if @parameter.present?
      element.merge!(consumes: @consume)          if @consume.present?
      element.merge!(deprecated: @deprecated)     if @deprecated.present?
      element.merge!(produces: @produce)          if @produce.present?
      element.merge!(responses: @response)
      element.merge!(tags: write_tag)
    end

    def route
      { @route => { @verb => construct_path } }
    end

    def route_update
      { @route => { @verb => construct_path }.merge!(patch: construct_path) }
    end

    def write_tag
      [@tag_name]
    end

    def summary(text)
      @summary = text
    end

    def consumes(text)
      @consume = text
    end

    def produces(text)
      @produce = text
    end

    def deprecated(value)
      @deprecated = value
    end

    def responses(&block)
      rep = SwaggerDocsGenerator::Actions::Response.new(&block)
      @response.merge!(rep.to_hash)
    end

    def parameters(&block)
      param = SwaggerDocsGenerator::Actions::Parameter.new(&block)
      @parameter.push(param.to_hash)
    end

    def description(text)
      @description = text
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
