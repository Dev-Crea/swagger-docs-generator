# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :parameters
    #
    # Complete parameters field for action
    class Parameters < Actions
      VALUE = :parameters

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end
    end
  end
end
