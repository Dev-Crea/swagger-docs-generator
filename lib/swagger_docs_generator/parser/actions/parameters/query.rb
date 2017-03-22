# frozen_string_literal: true

# :reek:InstanceVariableAssumption

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :query
    class Query < Parameter
      def to_hash
        {
          in: :query,
          name: @name || 'body',
          description: @description || '',
          required: @required || true,
          type: @type || 'array',
          items: { type: 'string' }
        }
      end

      private

      def type(text)
        @type = text
      end
    end
  end
end
