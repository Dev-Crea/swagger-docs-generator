# frozen_string_literal: true

# :reek:UtilityFunction

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
        raw = data[key]
        hash[key] = raw.present? ? each_response(raw) : no_response
      end

      def each_response(raw)
        sh = {}
        raw.each do |code|
          sh.merge!(one_response(ActionDispatch::Response.new(code)))
        end
        sh
      end

      def no_response
        one_response(ActionDispatch::Response.new(200))
      end

      def one_response(response)
        { response.code.to_s => { description: response.message } }
      end
    end
  end
end
