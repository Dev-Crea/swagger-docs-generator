# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :body
    class Body < Parameter
      def to_hash
        {
          in: :body,
          name: @name || 'body',
          description: @description || '',
          required: @required || true,
          schema: { '$ref': format_name }
        }
      end

      private

      def schema(text)
        @schema = text
      end

      def format_name
        "#/definitions/#{@schema.tr(' ', '_').camelize}"
      end
    end
  end
end
