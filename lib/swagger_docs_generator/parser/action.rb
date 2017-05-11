# frozen_string_literal: true

require 'swagger_docs_generator/parser/actions/actions'

# :reek:UtilityFunction
# :reek:InstanceVariableAssumption
# :reek:TooManyInstanceVariables
# :reek:TooManyStatements
# :reek:DuplicateMethodCall
# :reek:FeatureEnvy
# :reek:TooManyMethods

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
      paths = hash.keys.split.first

      if paths.count <= 2
        paths.each do |path|
          tag = extract_tag(path)
          tags = hash[path][@verb][:tags]
          if path.downcase.include?(tag.downcase) && !tags.include?(tag)
            hash[path][@verb][:tags].push(tag)
            hash[path]['patch'][:tags].push(tag) if @verb.eql?('put')
          end
        end
      end

      if !old_route.blank? && old_route.keys.include?(index)
        paths.each do |path|
          old_route[path].merge!(hash[path])
        end
      else
        old_route.merge!(hash)
      end
    end

    def construct_routes
      yop = {}
      extract = Extractor.new(controller, @action)
      @verb = extract.verb
      @route = extract.path
      @route.each do |rte|
        yop.merge!(@verb.eql?('put') ? route_update(rte) : route(rte))
      end
      yop
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

    def route(rte)
      { rte => { @verb => construct_path } }
    end

    def route_update(rte)
      { rte => { @verb => construct_path }.merge!('patch' => construct_path) }
    end

    def write_tag
      [@tag_name.humanize]
    end

    def extract_tag(route)
      route.split('/').reject do |rte|
        rte.empty?
      end.first.humanize
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
