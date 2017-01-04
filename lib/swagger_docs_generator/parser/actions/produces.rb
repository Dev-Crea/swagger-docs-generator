# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :produces
    #
    # Complete consume field for action
    class Produces < Actions
      VALUE = :produces

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
