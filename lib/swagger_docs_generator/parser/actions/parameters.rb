# frozen_string_literal: true

# :reek:UtilityFunction
module SwaggerDocsGenerator
  module Actions
    # # Test :parameters
    #
    # Complete parameters field for action
    class Parameter
      def initialize(&block)
        instance_eval(&block) if block_given?
      end

      def to_hash
        case @in
        when :path then path_hash
        when :header then header_hash
        when :query then query_hash
        when :body then body_hash
        when :form then form_hash
        end
      end

      private

      def path(data)
        @in = :path
        @name = data[0]
        @description = data[1]
        @type = data[2]
        @required = data[3]
      end

      def path_hash
        {
          name: @name,
          in: @in,
          description: @description,
          required: @required,
          type: @type
        }
      end

      def header(data)
        @in = :header
        @name = data[0]
        @description = data[1]
        @type = data[2]
        @required = data[3]
        @enum = data[4]
      end

      def header_hash
        {
          name: @name,
          in: @in,
          description: @description,
          required: @required,
          type: @type,
          enum: @enum
        }
      end

      def query(data)
        @in = :query
      end

      alias query_hash path_hash

      def body(data)
        @in = :body
        @name = data[1]
        @description = data[0]
        @definition = data[1]
      end

      def body_hash
        {
          name: @name,
          in: @in,
          description: @description,
          required: true,
          schema: { type: :object, items: { '$ref': @definition.tr(' ', '_').camelize } }
        }
      end

      def form(data)
        @in = :form
      end

      def form_hash
      end
    end
  end
end
