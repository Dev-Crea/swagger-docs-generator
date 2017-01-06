# frozen_string_literal: true

# :reek:UtilityFunction
module SwaggerDocsGenerator
  module Actions
    # # Test :parameters
    #
    # Complete parameters field for action
    class Parameters < Actions
      VALUE = :parameters

      def initialize(data)
        super(VALUE)
        complete_hash(data) if data[VALUE].present?
      end

      private

      # name:             0
      # in:               1 -- [query, header, path, formData, body]
      # description:      2
      # type: || schema:  3 -- [string, number, integer, boolean, array, file]
      # required:         4
      # other:            5
      def complete_hash(data)
        all_parameters = []
        raw ||= data[key]
        raw.each do |parameter|
          all_parameters.push(write_param(parameter))
        end
        hash[key] = all_parameters
      end

      def write_param(param)
        hash = param[0].eql?('body') ? body(param) : classic(param)
        type_or_schema = params[5]
        hash.merge!(type_or_schema) if type_or_schema.present?
        hash
      end

      def classic(param)
        {
          name: param_name(param),
          in: param_in(param),
          description: param_description(param),
          type: param_type(param),
          required: param_required(param)
        }
      end

      def body(param)
        {
          name: param_name(param),
          in: param_in(param),
          description: param_description(param),
          schema: param_schema(param),
          required: param_required(param)
        }
      end

      def param_name(param)
        param[0].to_s
      end

      def param_in(param)
        param[1].to_s.camelize(:lower)
      end

      def param_description(param)
        param[2].humanize
      end

      def param_type(param)
        param[3]
      end

      def param_required(param)
        param[4] || false
      end

      def param_schema(param)
        param[3]
      end
    end
  end
end
