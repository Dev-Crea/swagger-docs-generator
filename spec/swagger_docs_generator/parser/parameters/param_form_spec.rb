# frozen_string_literal: true

require 'spec_helper'

describe SwaggerDocsGenerator::Actions::Form, type: :parser,
                                              name: :params_form do
  let(:param_name) { nil }
  let(:param_description) { nil }
  let(:param_required) { nil }
  let(:param) do
    pname = param_name
    pdescription = param_description
    prequired = param_required
    SwaggerDocsGenerator::Actions::Parameter.new do
      form do
        name pname
        description pdescription
        required prequired
      end
    end
  end

  context 'when attribute complete' do
    let(:param_name) { Faker::Color.color_name }
    let(:param_description) { Faker::Beer.name }
    let(:param_required) { Faker::Boolean.boolean }

    it_behaves_like 'parameters form haves'
  end

  context 'when attribute is incomplete' do
    it_behaves_like 'parameters form haves'
  end

  context 'when name attribute alone' do
    let(:param_name) { Faker::Color.color_name }

    it_behaves_like 'parameters form haves'
  end

  context 'when description attribute alone' do
    let(:param_description) { Faker::Beer.name }

    it_behaves_like 'parameters form haves'
  end

  context 'when required attribute alone' do
    let(:param_required) { Faker::Boolean.boolean }

    it_behaves_like 'parameters form haves'
  end
end
