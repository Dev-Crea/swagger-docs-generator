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
        @param.to_hash
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

      def body(&block)
        @param = Body.new(&block)
      end

      def form(&block)
        @param = Form.new(&block)
      end

      def header(&block)
        @param = Header.new(&block)
      end

      def path(&block)
        @param = Path.new(&block)
      end

      def query(&block)
        @param = Query.new(&block)
      end

      def test_value(value, default)
        value.empty? ? default : value
      end
    end
  end
end

require 'swagger_docs_generator/parser/actions/parameters/body'
require 'swagger_docs_generator/parser/actions/parameters/form'
require 'swagger_docs_generator/parser/actions/parameters/header'
require 'swagger_docs_generator/parser/actions/parameters/path'
require 'swagger_docs_generator/parser/actions/parameters/query'
