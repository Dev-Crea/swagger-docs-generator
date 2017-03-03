# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :deprecated
    #
    # Complete deprected field for action
    class Deprecated < Actions
      VALUE = :deprecated

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end
    end
  end
end
