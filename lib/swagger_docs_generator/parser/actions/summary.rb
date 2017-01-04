# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :summary
    #
    # Complete summary field for action
    class Summary < Actions
      VALUE = :summary

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end
    end
  end
end
