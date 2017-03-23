# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:NilCheck

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :query
    class Query < Parameter
      def to_hash
        {
          in:               :query,
          name:             @name.nil? ? 'query' : @name,
          description:      @description.nil? ? '' : @description,
          required:         @required.nil? ? true : @required,
          type:             @type.nil? ? 'array' : @type,
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
