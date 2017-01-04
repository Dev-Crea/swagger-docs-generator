# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :tags
    #
    # Complete tags field for action
    class Tags < Actions
      VALUE = :tags

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end

      private

      def complete_hash(data)
        hash[key] = [data]
      end
    end
  end
end
