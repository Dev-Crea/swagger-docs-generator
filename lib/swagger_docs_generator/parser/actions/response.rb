# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test :response
    #
    # Complete description field for action
    class Response < Actions
      VALUE = :responses

      def initialize(data)
        super(VALUE)
        complete_hash(data)
      end

      private

      def complete_hash(data)
        default = { ok: { description: 'Request successfully processed.' } }
        raw = data.key?(key) ? data[key] : default
        hash[key] = raw
      end
    end
  end
end
