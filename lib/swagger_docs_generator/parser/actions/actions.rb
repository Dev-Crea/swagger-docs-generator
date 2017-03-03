# frozen_string_literal: true

module SwaggerDocsGenerator
  module Actions
    # # Test value in actions
    #
    # @abstract classes for all actions class
    # @see https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#operation-object
    class Actions
      attr_reader :hash, :key

      def initialize(key)
        @key = key
        @hash = { @key => {} }
      end

      def hash
        @hash[@key] ? @hash : {}
      end

      # List to all childrens
      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      private

      def complete_hash(data)
        raw ||= data[@key]
        @hash[@key] = raw
      end
    end
  end
end

require 'swagger_docs_generator/parser/actions/tags'
require 'swagger_docs_generator/parser/actions/summary'
require 'swagger_docs_generator/parser/actions/description'
require 'swagger_docs_generator/parser/actions/response'
require 'swagger_docs_generator/parser/actions/consumes'
require 'swagger_docs_generator/parser/actions/produces'
require 'swagger_docs_generator/parser/actions/deprecated'
require 'swagger_docs_generator/parser/actions/parameters'
