# frozen_string_literal: true

# :reek:InstanceVariableAssumption

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :header
    class Header < Parameter
      def to_hash
        {
          in: :header,
          description: @description || '',
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
