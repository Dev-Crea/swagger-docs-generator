# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:NilCheck

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :header
    class Header < Parameter
      def to_hash
        {
          in:               :header,
          name:             @name.nil? ? 'header' : @name,
          description:      @description.nil? ? '' : @description,
          required:         @required.nil? ? true : @required,
          type:             @type.nil? ? '' : @type
        }
      end

      private

      def type(text)
        @type = text
      end
    end
  end
end
