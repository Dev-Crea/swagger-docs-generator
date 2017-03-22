# frozen_string_literal: true

# :reek:UtilityFunction
# :reek:InstanceVariableAssumption
# :reek:TooManyStatements
# :reek:TooManyInstanceVariables

module SwaggerDocsGenerator
  module Actions
    # # Test :response
    #
    # Complete description field for action
    class Response
      def initialize(&block)
        instance_eval(&block) if block_given?
      end

      def to_hash
        { @status.to_s => construct }
      end

      private

      def construct
        element = {}
        element.merge!(description: @description || default_description)
        element.merge!(schema: @schema)           if @schema.present?
        element.merge!(header: @header)           if @header.present?
        element.merge!(example: @example)         if @example.present?
        element
      end

      def status(text)
        @status = text
      end

      def description(text)
        @description = text
      end

      def default_description
        Rack::Utils::HTTP_STATUS_CODES[@status]
      end

      def header(text)
        @header = text
      end

      def example(text)
        @example = text
      end

      def schema(&block)
        @schema = SwaggerDocsGenerator::Actions::Schema.new(&block).to_hash
      end
    end
  end
end
