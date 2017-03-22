# frozen_string_literal: true

# :reek:InstanceVariableAssumption

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :path
    class Path < Parameter
      def to_hash
        {
          in: :path,
          name: @name || 'path',
          description: @description,
          required: @required || true,
          type: @type
        }
      end

      private

      def type(text)
        @type = text
      end
    end
  end
end
