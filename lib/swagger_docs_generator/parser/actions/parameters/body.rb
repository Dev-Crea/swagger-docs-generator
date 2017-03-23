# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:NilCheck

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :body
    class Body < Parameter
      def to_hash
        {
          in:               :body,
          name:             @name.nil? ? 'body' : @name,
          description:      @description.nil? ? '' : @description,
          required:         @required.nil? ? true : @required,
          schema: { '$ref': @schema.nil? ? '' : format_name }
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
