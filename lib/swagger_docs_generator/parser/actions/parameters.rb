# frozen_string_literal: true

# :reek:UtilityFunction
# :reek:InstanceVariableAssumption
# :reek:TooManyInstanceVariables
# :reek:DuplicateMethodCall
# :reek:TooManyStatements
module SwaggerDocsGenerator
  module Actions
    # # Test :parameters
    #
    # Complete parameters field for action
    class Parameter
      def initialize(&block)
        @param = nil
        instance_eval(&block) if block_given?
      end

      def to_hash
        if @param.nil?
          case @in
          when :path then path_hash
          when :header then header_hash
          when :query then query_hash
          when :form then form_hash
          end
        else
          @param.to_hash
        end
      end

      private

      def name(text)
        @name = text
      end

      def description(text)
        @description = text
      end

      def required(text)
        @required = text
      end


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
        @name = data[0]
      end

      alias query_hash path_hash

      def body(&block)
        @param = Body.new(&block)
      end

      def form(data)
        @in = :form
        @name = data[0]
      end

      def form_hash
        {}
      end
    end
  end
end

require 'swagger_docs_generator/parser/actions/parameters/body'
