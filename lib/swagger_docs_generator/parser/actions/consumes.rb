# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :consumes
    #
    # Complete consume field for action
    class Consumes < Actions
      VALUE = :consumes

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end

      private

      def complete_hash(data)
        default = ['application/json']
        raw = data.key?(key) ? data[key] : default
        hash[key] = raw
      end
    end
  end
end
