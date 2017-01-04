# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :description
    #
    # Complete description field for action
    class Description < Actions
      VALUE = :description

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end
    end
  end
end
