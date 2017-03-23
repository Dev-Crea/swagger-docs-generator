# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:NilCheck

module SwaggerDocsGenerator
  module Actions
    # Write parameter type :form
    class Form < Parameter
      def to_hash
        {
          in:               :form,
          name:             @name.nil? ? 'form' : @name,
          description:      @description.nil? ? '' : @description,
          required:         @required.nil? ? true : @required
        }
      end
    end
  end
end
