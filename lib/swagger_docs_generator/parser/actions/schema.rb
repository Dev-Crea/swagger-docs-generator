# frozen_string_literal: true

# :reek:InstanceVariableAssumption
module SwaggerDocsGenerator
  module Actions
    # Object Schema
    #
    # Parse repsonse and create schema swagger object
    class Schema
      def initialize(&block)
        instance_eval(&block) if block_given?
      end

      def to_hash
        element = { type: @type || 'array' }
        element.merge!(items: { '$ref': @definition }) if @definition.present?
      end

      private

      def type(text)
        @type = text
      end

      def definition(text)
        @definition = '#/definitions/' + text.tr(' ', '_').camelize
      end
    end
  end
end
