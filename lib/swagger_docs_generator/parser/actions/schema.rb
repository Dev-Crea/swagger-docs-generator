# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # Create object swagger Schema
    class Schema
      def initialize(&block)
        @definition = nil
        @type = 'array'
        instance_eval(&block) if block_given?
      end

      def to_hash
        element = { type: @type }
        element.merge!(items: { '$ref': @definition })
      end

      private

      attr_reader :type, :definition

      def type(text)
        @type = text
      end

      def definition(text)
        @definition = '#/definitions/' + text.tr(' ', '_').camelize
      end
    end
  end
end
