# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::Actions::Header, type: :parser,
                                                name: :params_header do
  let(:param_name) { nil }
  let(:param_description) { nil }
  let(:param_required) { nil }
  let(:param_type) { nil }
  let(:param_default) { nil }
  let(:param_enum) { nil }
  let(:param_format) { nil }

  context 'when attribute complete' do
    let(:param_name) { Faker::Color.color_name }
    let(:param_description) { Faker::Beer.name }
    let(:param_required) { Faker::Boolean.boolean }
    let(:param_type) { Faker::Name.first_name }
    let(:param_default) { Faker::Name.first_name }
    let(:param_format) { Faker::Name.first_name }
    let(:param_enum) { Faker::Lorem.words(4, true) }

    let(:param) do
      pname = param_name
      pdescription = param_description
      prequired = param_required
      ptype = param_type
      pdefault = param_default
      pformat = param_format
      penum = param_enum
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          name pname
          description pdescription
          required prequired
          type ptype
          default pdefault
          format pformat
          enum penum
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: param_name,
        description: param_description,
        required: param_required,
        type: param_type,
        default: param_default,
        format: param_format,
        enum: param_enum
      )
    end
    it_behaves_like 'parameters header haves'
  end

  context 'when attribute is incomplete' do
    let(:param) do
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: nil
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when name attribute alone' do
    let(:param_name) { Faker::Color.color_name }

    let(:param) do
      pname = param_name
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          name pname
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: param_name,
        required: true,
        type: nil
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when description attribute alone' do
    let(:param_description) { Faker::Beer.name }

    let(:param) do
      pdescription = param_description
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          description pdescription
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: nil,
        description: param_description
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when required attribute alone' do
    let(:param_required) { Faker::Boolean.boolean }

    let(:param) do
      prequired = param_required
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          required prequired
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: param_required,
        type: nil
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when type attribute alone' do
    let(:param_type) { Faker::Name.first_name }

    let(:param) do
      ptype = param_type
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          type ptype
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: param_type
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when default attribute alone' do
    let(:param_default) { Faker::Name.first_name }

    let(:param) do
      pdefault = param_default
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          default pdefault
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: nil,
        default: param_default
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when format attribute alone' do
    let(:param_format) { Faker::Name.first_name }

    let(:param) do
      pformat = param_format
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          format pformat
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: nil,
        format: param_format
      )
    end

    it_behaves_like 'parameters header haves'
  end

  context 'when default attribute alone' do
    let(:param_enum) { Faker::Lorem.words(4, true) }

    let(:param) do
      penum = param_enum
      SwaggerDocsGenerator::Actions::Parameter.new do
        header do
          enum penum
        end
      end
    end

    it do
      expect(param.to_hash).to eql(
        in: :header,
        name: nil,
        required: true,
        type: nil,
        enum: param_enum
      )
    end

    it_behaves_like 'parameters header haves'
  end
end
