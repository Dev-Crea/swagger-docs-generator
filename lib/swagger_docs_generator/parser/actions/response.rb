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
          case code
          when Array
            sh.merge!(one_response_with_schema(code))
          when Integer
            sh.merge!(one_response(code))
          end
        end
        sh
      end

      def no_response
        one_response(200)
      end

      def one_response(code)
        response = ActionDispatch::Response.new(code)
        { response.code => { description: response.message } }
      end

      # :reek:FeatureEnvy
      def one_response_with_schema(code)
        key = code[0]
        response = ActionDispatch::Response.new(key)
        {
          response.code => {
            'description' => response.message,
            'schema' => type_or_not(code)
          }
        }
      end

      def type_or_not(code)
        code.length.eql?(3) ? include_type(code) : no_type(code)
      end

      def include_type(code)
        {
          'type' => code[1],
          'items' => {
            '$ref' => code[2]
          }
        }
      end

      def no_type(code)
        {
          '$ref' => code[1]
        }
      end
    end
  end
end
