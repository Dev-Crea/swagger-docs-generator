# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:NilCheck

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :header
    class Header < Parameter
      FIELDS = %w[description format default enum].freeze

      def to_hash
        {
          in:               :header,
          name:             @name,
          required:         @required.nil? ? true : @required,
          type:             @type
        }.merge(no_mandatory_field)
      end

      private

      def type(text)
        @type = text
      end

      def default(text)
        @default = text
      end

      def enum(array)
        @enum = array
      end

      def format(text)
        @format = text
      end
    end
  end
end
