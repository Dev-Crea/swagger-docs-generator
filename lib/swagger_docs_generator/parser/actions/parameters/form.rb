# frozen_string_literal: true

# :reek:InstanceVariableAssumption

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :form
    class Form < Parameter
      def to_hash
        {
          in: :form,
          description: @description || '',
          required: @required || true
        }
      end
    end
  end
end
